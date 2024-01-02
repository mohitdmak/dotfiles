# Udev

## Organization:
* Udev rules are defined into files with the .rules extension. 
* There are two main locations in which those files can be placed: /usr/lib/udev/rules.d it’s the directory used for system-installed rules, /etc/udev/rules.d/ is reserved for custom made rules.
* The files in which the rules are defined are conventionally named with a number as prefix (e.g 50-udev-default.rules) and are processed in lexical order independently of the directory they are in. 
* Files installed in /etc/udev/rules.d, however, override those with the same name installed in the system default path.
