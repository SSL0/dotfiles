#!/bin/env python3

from os.path import splitext
import sys, os
file_name, extension = splitext(sys.argv[1])
archive_path = file_name + extension

if extension == '.zip':
    os.system('unzip ' + archive_path)
elif extension == '.rar':
    os.system('unrar ' + archive_path)
elif extension == '.gz':
    os.system('tar -xvf ' + archive_path)
else:
    print('Error: Unknown archive type!')
