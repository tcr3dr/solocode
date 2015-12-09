from __future__ import print_function
import sys
from subprocess import Popen
import os

def main():
	if sys.argv[1] == 'pack':
		Popen([os.path.join(os.path.dirname(__file__), 'solocode-pack.sh')] + sys.argv[2:], cwd=os.curdir).communicate()
	elif sys.argv[1] == 'push':
		Popen([os.path.join(os.path.dirname(__file__), 'solocode-push.sh')] + sys.argv[2:], cwd=os.curdir).communicate()
	elif sys.argv[1] == 'run':
		Popen([os.path.join(os.path.dirname(__file__), 'solocode-run.sh')] + sys.argv[2:], cwd=os.curdir).communicate()
	elif sys.argv[1] == 'simple':
		Popen([os.path.join(os.path.dirname(__file__), 'solocode-simple.sh')] + sys.argv[2:], cwd=os.curdir).communicate()
	else:
		print('Usage: solocode (pack|push|run)')
		sys.exit(1)
