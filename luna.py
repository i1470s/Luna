from importlib import import_module
from sys import path

path.insert(1, "./Luna/")
main = import_module("Luna.luna")

main.run()