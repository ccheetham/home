import os
import sys

def cat(path):
    exp_path = os.path.expandvars(path)
    with open(exp_path, 'r') as file:
        return file.read()

if __name__ == '__main__':
    cat(sys.argv[1])
