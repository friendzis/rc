"""
Usage:
    install.py [-q] [--link | --copy] [--no-backup] [FILE] ...

Process input FILEs and install configuration files. By default reads
"config.json"

Arguments:
    FILE    Optional input file for installation paths

Options:
    -h --help       Display this help
    -q              Be quiet
    --link          Force linking (ln -s)
    --copy          Force copying (cp)
    --no-backup     Do not backup old files
"""
from docopt import docopt
import json

class Entity:
    def __init__(self, source, destination, method):
        self.source = source
        self.destination = destination
        self.method = method

    def link(self):
        print("ln -s %s %s" % (self.source, self.destination))

    def install(self):
        getattr(self, self.method)()        # This is black magic

class File(Entity):
    def __init__(self, source, destination, method):
        super(File, self).__init__(source, destination, method)

    def copy(self):
        print("cp %s %s" % (self.source, self.destination))

class Directory(Entity):
    def __init__(self, source, destination, method):
        super(Directory, self).__init__(source, destination, method)

    def copy(self):
        print("cp -r %s %s" % (self.source, self.destination))

options = docopt(__doc__)

with open('config.json') as configFile:     # This closes the file automagically
    config = json.load(configFile)

config = config["install"]      # We're only interested in Installation section

for entry in config:
    Class = globals().get(config[entry]["type"].title(), False)
    if Class:
        f = Class(entry, config[entry]["destination"], config[entry]["method"])
        f.install()
