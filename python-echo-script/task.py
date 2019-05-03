#!python

from sparrow6lib import *

foo = config()["main"]["foo"]
bar = config()["main"]["bar"]

print "main.foo is", foo
print "main.bar is", bar
