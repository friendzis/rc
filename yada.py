"""YADA - Yet Another Dotfile Assistant

Usage:
    yada.py [-q] [--backup] [--link | --copy] bundle install [SECTION ...]
    yada.py --version
    yada.py -h | --help

Examples:
    yada.py bundle install laptop   # Search bundle for .yada files containing "laptop" section

Arguments:
    SECTION         Optional argument(s) indicating which section(s) of .yada files to use

Options:
    -q              Be quiet
    --link          Force linking (ignored with -d)
    --copy          Force copying (ignored with -d)
    --backup        Backup old files  (not implemented)
    -h --help       Display this help
    --version       Show version
"""
from docopt import docopt
from subprocess import call
import json
import yaml

import os
from os.path import join, isdir

HOME = os.getenv("HOME")
CWD = os.getcwd()
YADAFILE = '.yada'
arguments = docopt(__doc__)

# If quiet mode is selected do not print status messages
if arguments['-q']:
    def display(*args, **kwargs):
         return 0
else:
    def display(*args, **kwargs):
         print(*args, **kwargs)

class Entity:
    def __init__(self, entry):
        self.source = entry["source"]
        self.destination = entry["destination"]

        # Checking if destination should be removed first
        if arguments['--no-backup'] or ('--no-backup' in entry["options"]):
            self.backup = False
        else:
            self.backup = True

#        if arguments['--copy']:
#            self.method = "copy"
#        elif arguments['--link']:
#            self.method = "link"
#        else:
#            self.method = method    #Case when both are set is handled by docopt

    def link(self):
        display("Linking %s --> %s" % (self.destination, self.source))
        self.remove()
        call("ln -s %s %s" % (self.source, self.destination), shell=True)

    def copy(self):
        display("Copying %s to %s" % (self.source, self.destination))
        self.remove()

    def remove(self):
        if not self.backup:
            display("Removing %s..." % (self.destination))
            call("rm -rf %s" % (self.destination), shell=True)

    def install(self):
        # Basically this gets a function with the name defined in
        # self self.method and happily executes it.
        # Highly unsafe, must fix
        getattr(self, self.method)()        # This is black magic

class File(Entity):
    def __init__(self, entry):
        super(File, self).__init__(entry)

    def copy(self):
        super(File, self).copy()
        call("cp %s %s" % (self.source, self.destination), shell=True)

class Directory(Entity):
    def __init__(self, entry):
        super(Directory, self).__init__(entry)

    def copy(self):
        super(Directory, self).copy()
        call("cp -r %s %s" % (self.source, self.destination), shell=True)

#class Xrdb(Entity):

bundlePath = join (CWD, 'bundle')

def fetchBundle(path, plugins = []):
    for inode in os.listdir(path):
        inodePath = join(path, inode)
        if inode == YADAFILE:
            plugins.append(inodePath)
            return plugins
        elif isdir(inodePath):
            fetchBundle(inodePath, plugins)
    return plugins

def fetchSections(bundle):
    for bundleFragment in bundle:
        #print(bundleFragment)
        with open(bundleFragment) as fragment:
        #with open('/usr/share/rc/bundle/scm/git/.yada') as fragment:
            print(fragment)
            config = json.load(fragment)
            for entry in config:
                section = entry.get("section", "*")
                print(entry)

bundle = fetchBundle(bundlePath)
fetchSections(bundle)

#with open('config.json') as configFile:     # This closes the file automagically
#    config = json.load(configFile)

# Step through all config entries
#for entry in config:
#    Class = globals().get(entry['type'].title(), False)
#    # If we know how to handle such case
#    if Class:
#        # Use an improvised factory
#        dotfile = Class(entry)
#        dotfile.install()
