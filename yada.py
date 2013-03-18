"""
Usage:
    dotstrap.py [-q] [--link | --copy] [--backup] [FILE] ...

Process input FILEs and install dotfiles. If no input file is specified,
recursively searches directory `bundle` for `config.json` and executes.

Arguments:
    FILE            Optional file containing installation directives

Options:
    -h --help       Display this help
    -q              Be quiet (not implemented)
    --link          Force linking (ln -s)
    --copy          Force copying (cp)
    --backup        Backup old files  (not implemented)
"""
from docopt import docopt
from subprocess import call
import json

import os
from os.path import join, isdir

HOME = os.getenv("HOME")
arguments = docopt(__doc__)

# If quiet mode is selected do not print status messages
if arguments['-q']:
    def display(*args):
         return 0
else:
    def display(*args):
         print(*args)

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

with open('config.json') as configFile:     # This closes the file automagically
    config = json.load(configFile)

#install = config["install"]      # We're only interested in Installation section

# Step through all config entries
for entry in config:
    Class = globals().get(entry['type'].title(), False)
    # If we know how to handle such case
    if Class:
        # Use an improvised factory
        dotfile = Class(entry)
        dotfile.install()
