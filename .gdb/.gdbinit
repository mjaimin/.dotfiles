# Set the number of lines GDB displays to unlimited, allowing us to scroll freely
set height 0
set width 0

# Allow setting breakpoints on functions that GDB can't find yet (e.g., because they are in shared libraries not yet loaded)
set breakpoint pending on

# Enable pretty-printing of structures, making them easier to read
set print pretty on

# Save command history to a file, allowing use of up-arrow and ctrl-r to recall previous commands
set history filename ~/.gdb_history
set history save on

# Uncomment the following line to disable pagination, which causes GDB to pause output after each screenful
# set pagination off

# Log GDB's output to a file
set logging file gdb.txt
set logging overwrite on
set logging redirect on
set logging on

# Print the values of C++ objects when they are derived from base classes
set print object on

# Print static members for C++ classes
set print static-members on

# Print the C++ virtual function tables (vtables)
set print vtbl on

# Demangle C++ mangled names
set print demangle on

# Set the limit of array elements to print to unlimited
set print elements 0

# Print a backtrace for all threads
thread apply all bt