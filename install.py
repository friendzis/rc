"""
Usage:
    install.py [-q] [--link | --copy] [--no-backup] [FILE] ...

Process input FILEs and install configuration files. By default reads
"config.json"

Arguments:
    FILE    Optional input file for installation paths

Options:
    -h --help       Display this help
    -q              Be quiet (not implemented)
    --link          Force linking (ln -s)
    --copy          Force copying (cp)
    --no-backup     Do not backup old files (force overwrite) (not implemented)
"""
from docopt import docopt
import json

arguments = docopt(__doc__)

if arguments['-q']:
    def display(*args):
        return 0
else:
    def display(*args):
        print(*args)

class Entity:
    def __init__(self, source, destination, method, options):
        self.source = source
        self.destination = destination

        if arguments['--no-backup'] or ('--no-backup' in options):
            self.remove = True
        else:
            self.remove = False

        if arguments['--copy']:
            self.method = "copy"
        elif arguments['--link']:
            self.method = "link"
        else:
            self.method = method    #Case when both are set is handled by docopt

    def link(self):
        display("Linking %s --> %s" % (self.destination, self.source))
        print("ln -s %s %s" % (self.source, self.destination))

    def copy(self):
        display("Copying %s to %s" % (self.source, self.destination))

    def remove(self):
        if self.remove:
            display("Removing %s..." % (self.destiantion))
            print("rm -rf %s" % (self.destination))

    def install(self):
        getattr(self, self.method)()        # This is black magic

class File(Entity):
    def __init__(self, source, destination, method, options):
        super(File, self).__init__(source, destination, method, options)

    def copy(self):
        super(File, self).copy()
        print("cp %s %s" % (self.source, self.destination))

class Directory(Entity):
    def __init__(self, source, destination, method, options):
        super(Directory, self).__init__(source, destination, method, options)

    def copy(self):
        super(Directory, self).copy()
        print("cp -r %s %s" % (self.source, self.destination))

with open('config.json') as configFile:     # This closes the file automagically
    config = json.load(configFile)

config = config["install"]      # We're only interested in Installation section

for entry in config:
    Class = globals().get(config[entry]["type"].title(), False)
    if Class:
        f = Class(entry, config[entry]["destination"], config[entry]["method"], config[entry].get("options", []))
        f.install()
