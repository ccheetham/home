import atexit
import os
import readline
import socket

# =============================
# start: per-host history files
#

history_dirpath = os.path.expanduser("~/.python_history")
if not os.path.exists(history_dirpath):
    os.makedirs(history_dirpath)
history_path = os.path.join(history_dirpath, socket.gethostname())

def save_history(history_path=history_path):
    import readline
    readline.write_history_file(history_path)
atexit.register(save_history)

if os.path.exists(history_path):
    readline.read_history_file(history_path)

del atexit, os, readline, history_path, save_history

#
# end: per-host history files
# ===========================
