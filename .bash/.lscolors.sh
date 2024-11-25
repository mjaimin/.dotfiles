#!/bin/bash

# LS_COLORS configuration
# Format: TYPE=ATTRIBUTES;FOREGROUND;BACKGROUND
# 
# Color codes:
# 0   = default
# 1   = bold
# 3   = italic
# 4   = underline
# 5   = blink
# 7   = reverse
# 8   = concealed
#
# Text color codes (30-37 or 38;5;COLOR for 256 colors):
# 30  = black
# 31  = red
# 32  = green
# 33  = yellow
# 34  = blue
# 35  = magenta
# 36  = cyan
# 37  = white
#
# Background color codes (40-47 or 48;5;COLOR for 256 colors):
# 40  = black background
# 41  = red background
# 42  = green background
# 43  = yellow background
# 44  = blue background
# 45  = magenta background
# 46  = cyan background
# 47  = white background

# Core file types
LS_COLORS="no=00"                   # Normal text (default)
LS_COLORS+=":di=38;5;33"           # Directory (bright blue)
LS_COLORS+=":ln=38;5;51"           # Symbolic link (cyan)
LS_COLORS+=":ex=38;5;208;1"        # Executable file (bright orange, bold)
LS_COLORS+=":fi=00"                # Regular file (default)

# Special files
LS_COLORS+=":bd=38;5;68"           # Block device (blue)
LS_COLORS+=":cd=38;5;113;1"        # Character device (bright green, bold)
LS_COLORS+=":pi=38;5;126"          # Named pipe (purple)
LS_COLORS+=":so=38;5;197"          # Socket (pink)
LS_COLORS+=":do=38;5;127"          # Door (purple)

# Special permissions
LS_COLORS+=":su=38;5;196;1"        # setuid (u+s) (bright red, bold)
LS_COLORS+=":sg=38;5;208;1"        # setgid (g+s) (bright orange, bold)
LS_COLORS+=":tw=38;5;220;1"        # sticky other writable (+t,o+w) (bright yellow, bold)
LS_COLORS+=":ow=38;5;220"          # other writable (o+w) (yellow)
LS_COLORS+=":st=38;5;86"           # sticky directory (+t) (cyan)
LS_COLORS+=":or=38;5;196;1;4"      # broken symlink (bright red, bold, underline)

# Important documentation files
LS_COLORS+=":*README=38;5;220;1"       # README files (bright yellow, bold)
LS_COLORS+=":*README.rst=38;5;220;1"   # README.rst files
LS_COLORS+=":*README.md=38;5;220;1"    # README.md files
LS_COLORS+=":*LICENSE=38;5;220;1"      # License files
LS_COLORS+=":*COPYING=38;5;220;1"      # Copying files
LS_COLORS+=":*INSTALL=38;5;220;1"      # Install files
LS_COLORS+=":*COPYRIGHT=38;5;220;1"    # Copyright files
LS_COLORS+=":*AUTHORS=38;5;220;1"      # Authors files
LS_COLORS+=":*HISTORY=38;5;220;1"      # History files
LS_COLORS+=":*CONTRIBUTORS=38;5;220;1" # Contributors files
LS_COLORS+=":*PATENTS=38;5;220;1"      # Patents files
LS_COLORS+=":*VERSION=38;5;220;1"      # Version files
LS_COLORS+=":*NOTICE=38;5;220;1"       # Notice files
LS_COLORS+=":*CHANGES=38;5;220;1"      # Changes files

# Documentation and text files
LS_COLORS+=":*.log=38;5;190"           # Log files (light green)
LS_COLORS+=":*.txt=38;5;253"           # Text files (light gray)
LS_COLORS+=":*.md=38;5;184"            # Markdown files
LS_COLORS+=":*.markdown=38;5;184"      # Markdown files
LS_COLORS+=":*.rst=38;5;184"           # reStructuredText files
LS_COLORS+=":*.tex=38;5;184"           # TeX files
LS_COLORS+=":*.nfo=38;5;184"           # NFO files
LS_COLORS+=":*.pdf=38;5;141"           # PDF files (purple)
LS_COLORS+=":*.epub=38;5;141"          # EPUB files

# Data and config files
LS_COLORS+=":*.json=38;5;178"          # JSON files (orange)
LS_COLORS+=":*.jsonl=38;5;178"         # JSON Lines files
LS_COLORS+=":*.ndjson=38;5;178"        # Newline-delimited JSON
LS_COLORS+=":*.xml=38;5;178"           # XML files
LS_COLORS+=":*.yaml=38;5;178"          # YAML files
LS_COLORS+=":*.yml=38;5;178"           # YML files
LS_COLORS+=":*.toml=38;5;178"          # TOML files
LS_COLORS+=":*.conf=38;5;148"          # Configuration files (light green)
LS_COLORS+=":*.ini=38;5;148"           # INI files

# Programming languages
LS_COLORS+=":*.py=38;5;41"             # Python files (green)
LS_COLORS+=":*.ipynb=38;5;41"          # Jupyter notebooks
LS_COLORS+=":*.js=38;5;227"            # JavaScript files (yellow)
LS_COLORS+=":*.ts=38;5;227"            # TypeScript files
LS_COLORS+=":*.jsx=38;5;227"           # React JSX files
LS_COLORS+=":*.tsx=38;5;227"           # React TSX files
LS_COLORS+=":*.css=38;5;219"           # CSS files (pink)
LS_COLORS+=":*.scss=38;5;219"          # SCSS files
LS_COLORS+=":*.sass=38;5;219"          # Sass files
LS_COLORS+=":*.html=38;5;208"          # HTML files (orange)
LS_COLORS+=":*.java=38;5;209"          # Java files
LS_COLORS+=":*.sh=38;5;113"            # Shell scripts (green)
LS_COLORS+=":*.bash=38;5;113"          # Bash scripts
LS_COLORS+=":*.zsh=38;5;113"           # Zsh scripts
LS_COLORS+=":*.fish=38;5;113"          # Fish scripts
LS_COLORS+=":*.vim=38;5;156"           # Vim scripts (light green)
LS_COLORS+=":*.lua=38;5;81"            # Lua scripts (blue)

# Compiled files
LS_COLORS+=":*.class=38;5;243"         # Java class files (gray)
LS_COLORS+=":*.pyc=38;5;243"           # Python compiled files
LS_COLORS+=":*.zwc=38;5;243"           # Zsh compiled files

# Archives and compressed files
LS_COLORS+=":*.zip=38;5;205"           # ZIP archives (pink)
LS_COLORS+=":*.tar=38;5;205"           # TAR archives
LS_COLORS+=":*.tgz=38;5;205"           # TGZ archives
LS_COLORS+=":*.gz=38;5;205"            # GZIP archives
LS_COLORS+=":*.bz2=38;5;205"           # BZIP2 archives
LS_COLORS+=":*.xz=38;5;205"            # XZ archives
LS_COLORS+=":*.rar=38;5;205"           # RAR archives
LS_COLORS+=":*.7z=38;5;205"            # 7zip archives

# Media files
LS_COLORS+=":*.mp3=38;5;213"           # MP3 files (purple)
LS_COLORS+=":*.flac=38;5;213"          # FLAC files
LS_COLORS+=":*.wav=38;5;213"           # WAV files
LS_COLORS+=":*.mp4=38;5;115"           # MP4 files (green)
LS_COLORS+=":*.mkv=38;5;115"           # MKV files
LS_COLORS+=":*.avi=38;5;115"           # AVI files
LS_COLORS+=":*.mov=38;5;115"           # MOV files
LS_COLORS+=":*.jpg=38;5;215"           # JPEG files (orange)
LS_COLORS+=":*.jpeg=38;5;215"          # JPEG files
LS_COLORS+=":*.png=38;5;215"           # PNG files
LS_COLORS+=":*.gif=38;5;215"           # GIF files
LS_COLORS+=":*.svg=38;5;215"           # SVG files
LS_COLORS+=":*.ico=38;5;215"           # ICO files

# Development files
LS_COLORS+=":*Makefile=38;5;155"       # Makefiles (light green)
LS_COLORS+=":*Dockerfile=38;5;155"     # Dockerfiles
LS_COLORS+=":*.cmake=38;5;155"         # CMake files
LS_COLORS+=":*.o=38;5;243"             # Object files (gray)
LS_COLORS+=":*.a=38;5;243"             # Static libraries
LS_COLORS+=":*.so=38;5;243"            # Shared libraries
LS_COLORS+=":*.dll=38;5;243"           # DLL files

# Git files
LS_COLORS+=":*.git=38;5;197"           # Git directory (red)
LS_COLORS+=":*.gitignore=38;5;197"     # Git ignore file
LS_COLORS+=":*.gitmodules=38;5;197"    # Git modules file
LS_COLORS+=":*.gitattributes=38;5;197" # Git attributes file

export LS_COLORS
