### Random :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# When in visual mode, "O" and "o" both switch between the starting and ending of the code selected.

# When inside a closed block of text (i.e, content between "" or '' or () or {} or [] or <>, etc); 
    # "i" in visual mode selects text until the outer covering character
    # EG: vi" in the text: ""mohit makwana"" : with cursor@t selects: mohit makwana
    # EG: 2vi" or va" in the same above case elects: "mohit makwana"
    # EG: 2va" in the same above case selects: ""mohit makwana""

# Change filelocal in buffer (use case: use vimwiki in any md file):
    :bufdo setlocal filetype=vimwiki
    
# Also use substitution more frequently:
    # In 1 line in 1st occurence:                  :s/old/new
    # In 1 line for all occurences:                :s/old/new/g
    # Change every occurences between 2 line no.s: :#,#s/old/new/g
    # Change every occurence in whole file:        :%s/old/new/g
    # Same as above + prompt asking for each:      :%s/old/new/gc

# Also use foll more frequently:
    # "C" is equivalent of D + i
    # "I" starts insert mode at the beginning of line.
    # "R" is replace mode for continuous typing.
    # "Y" copies everything from cursor till end of line.
    # "y" works similarly like dw/cw with other moving keys like h.j.k.l.w.e..etc.
### END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### Insert mode bindings ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CTRL + U deletes all entered characters in a line.
CTRL + W deletes the previous word.
CTRL + H deletes the previous character, but honesty its no better than the backspace.
CTRL + R inserts contents of register.
CTRL + K print keybinding format of what you type.
CTRL + E/Y copies and prints characters just below and above the cursor while in insert mode.
CTRL + N/P Iterates through cmp suggestions to provide word completion while in insert mode.
### END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### Others ::
* xprop WM_CLASS to click on a window and get its class
### END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### USEFUL GIT TIP ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
configure: git config --global diff.tool vimdiff
           git config --global difftool.path nvim
           git config --global merge.tool vimdiff
           git config --global mergetool.path nvim
use:       git difftool branch1:path/to/file branch2:path/to/file 
### END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### MACROS ! ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
use 15@w to repeat the macro at 'w' 15 times (use more often!)
use @@ to repeat the last macro
use @: to repeat the last ex command
### END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### Youtube :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
Here in youtube I use the controls:
F/f to full screen 
<> to increase and decrease speed.
M to mute. 

If I want to go to full screen the best possibility is disable F.
But if I want to mute I need to hit 'im' but in fullscreen I get stuck in insert mode with the message at bottom left.
It would be nice a feature to exit insert mode without hitting <esc> or <C-[>. Maybe an imap.

It would be also nice to have a key to use when I want to inject javascript.
Like:
document.getElementsByTagName("video")[0].playbackRate=3;
To increase video speed.
### END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

### VIMWIKI :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

## Visual mode bindings ::
ah                      A header including its content up to the next header.

ih                      The content under a header (like 'ah', but excluding
                        the header itself and trailing empty lines).

aH                      A header including all of its subheaders. When [count]
                        is 2, include the parent header, when [count] is 3,
                        the grandparent and so on.

iH                      Like 'aH', but excluding the header itself and
                        trailing empty lines.

a\                      A cell in a table.

i\                      An inner cell in a table.

ac                      A column in a table.

ic                      An inner column in a table.

al                      A list item plus its children.

il                      A single list item.
### END :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
