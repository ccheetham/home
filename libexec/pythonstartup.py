# ===========================================================================
# startup actions upon entering Python's interactive interpreter
# ===========================================================================

# commonly needed modules
import platform
import re
import os
path = os.path
import shutil
import subprocess
import sys

# command history
try:
    import readline, atexit
    histdir = os.path.join(os.environ['ME_CACHE_DIR'], 'python')
    try:
        os.makedirs(histdir)
    except FileExistsError:
        pass
    histfile = os.path.join(histdir, 'history')
    if os.path.exists(histfile):
        readline.read_history_file(histfile)
    atexit.register(readline.write_history_file, histfile)
    del readline, atexit
except ImportError:
    pass

# some dummy vars
s = 'this is a sample string'
a = ['a', 'b', 'c']
d = {'a':'A', 'b':'B', 'c':'C'}
