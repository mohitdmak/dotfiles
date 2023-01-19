import os
import sys
from ranger.core.loader import CommandLoader
from ranger.api.commands import Command

class linkup(Command):
    def execute(self):
        """ Extract copied files to current directory """
        s = ""
        for word in range(1, len(self.args)):
            s += self.arg(word)
            s += " "
        filename = s[0 : len(s) - 1]
        """
        # This does not work on file names with spaces
        filename = self.arg(1)
        """
        cwd = self.fm.thisdir
        if filename == '.':
            with open('/tmp/ranger-chrome-choosed', 'w') as f:
                f.write(cwd.path + '/')
            sys.exit(0)

        with open('/tmp/ranger-chrome-choosed', 'w') as f:
            f.write(os.path.join(cwd.path, filename))
        sys.exit(0)
