#!/usr/bin/env python

from setuptools import setup, find_packages

setup(name='solocode',
      version='0.1.0',
      description='Simple Solo code runner.',
      author='Tim Ryan',
      author_email='tim@3drobotics.com',
      url='https://github.com/tcr3dr',
      install_requires = [
      ],
      package_data={
        'solocode': ['*.sh']
      },
      entry_points={
          'console_scripts': [
              'solocode = solocode.__init__:main'
          ]
      },
      packages = ['solocode'],
      )
