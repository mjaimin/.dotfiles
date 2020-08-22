# no 'window' size, we can scroll
set height 0
set width 0

# allow pending breakpoints, we know what we're doing:
set breakpoint pending on

# structure easier to read
set print pretty on

# save history, <up-arrow> and ctrl-r can save a lot of time
set history filename ~/.gdb_history
set history save on

#set pagination off not sure what is this?

set logging file gdb.log
set logging on


set print object on
set print static-members on
set print vtbl on
set print demangle on

set print elements 0
thread apply all bt
