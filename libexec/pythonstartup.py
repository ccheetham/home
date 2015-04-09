# ===========================================================================
# startup actions upon entering Python's interactive interpreter
# ===========================================================================

def config_cli_history():
    '''
    configure commandline interpreter history:
      * define a per-host history file
      * if needed, create directory to house history files
      * if available, read in previous history file
      * save commandline history to history file upon exit
    '''
    import atexit, os, readline, socket
    history_home = os.path.expanduser("~/.python_history")
    if not os.path.exists(history_home):
        os.makedirs(history_home)
    history_path = os.path.join(history_home, socket.gethostname())
    if os.path.exists(history_path):
        readline.read_history_file(history_path)
    def save_history(path=history_path):
        import readline
        readline.write_history_file(path)
        del readline
    atexit.register(save_history)
    del atexit, os, readline, socket

if __name__ == '__main__':
    config_cli_history()
    # pre-import frequently used modules
    import logging
    import re
    import os
    import shutil
