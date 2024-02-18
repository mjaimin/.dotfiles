#!/bin/bash

# Enable debugging
set -x

# Exit on error
set -e

# Create empty configuration files if they don't exist
touch ~/.tmux.conf ~/.bashrc ~/.vimrc

# Add repositories
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable -y
sudo add-apt-repository ppa:agornostal/ulauncher -y

# Update package lists and install packages
sudo apt-get update
sudo apt-get -y install git vim ulauncher latte-dock fsearch universal-ctags duf

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create necessary directories
mkdir -pv ~/.bash/bash-it/ ~/.tmux/plugins/ ~/.tmux/plugins/tmux-battery/ ~/.tmux/plugins/tmux-cpu/ ~/.tmux/plugins/tmux-net-speed/ ~/.tmux/plugins/tmux-copycat/ ~/.tmux/plugins/tmux-online-status ~/.tmux/plugins/tmux-open ~/.tmux/plugins/tmux-plugin-sysstat ~/.tmux/plugins/tmux-prefix-highlight ~/.tmux/plugins/tmux-sidebar ~/.tmux/plugins/tpm

# Function to clone a repository if it's not already present
clone_if_not_present() {
    local repo_url="$1"
    local target_dir="$2"
    local license_file="$3"

    if [ ! -f "$target_dir/$license_file" ]; then
        git clone "$repo_url" "$target_dir"
    fi
}

# Clone repositories if not already present
clone_if_not_present "https://github.com/mjaimin/bash-it.git" "~/.bash/bash-it/" "LICENSE"
clone_if_not_present "https://github.com/VundleVim/Vundle.vim" "~/.vim/bundle/Vundle.vim/" "LICENSE-MIT.txt"
clone_if_not_present "https://github.com/morhetz/gruvbox.git" "tmp" "LICENSE"
clone_if_not_present "https://github.com/tmux-plugins/tmux-battery.git" "~/.tmux/plugins/tmux-battery/" "LICENSE.md"
clone_if_not_present "https://github.com/tmux-plugins/tmux-cpu.git" "~/.tmux/plugins/tmux-cpu/" "LICENSE"
clone_if_not_present "https://github.com/tmux-plugins/tmux-net-speed.git" "~/.tmux/plugins/tmux-net-speed/" "LICENSE"
clone_if_not_present "https://github.com/tmux-plugins/tmux-copycat.git" "~/.tmux/plugins/tmux-copycat/" "LICENSE.md"
clone_if_not_present "https://github.com/tmux-plugins/tmux-sidebar.git" "~/.tmux/plugins/tmux-sidebar/" "LICENSE.md"
clone_if_not_present "https://github.com/tmux-plugins/tmux-prefix-highlight.git" "~/.tmux/plugins/tmux-prefix-highlight/" "LICENSE"
clone_if_not_present "https://github.com/samoshkin/tmux-plugin-sysstat.git" "~/.tmux/plugins/tmux-plugin-sysstat/" "LICENSE"
clone_if_not_present "https://github.com/tmux-plugins/tmux-online-status.git" "~/.tmux/plugins/tmux-online-status/" "LICENSE.md"
clone_if_not_present "https://github.com/tmux-plugins/tmux-open.git" "~/.tmux/plugins/tmux-open/" "LICENSE.md"
clone_if_not_present "https://github.com/tmux-plugins/tpm.git" "~/.tmux/plugins/tpm/" "LICENSE.md"

# Backup and replace configuration files
backup_and_replace() {
    local orig_file="$1"
    local backup_file="$2"
    local new_file="$3"

    if [ ! -f "$backup_file" ]; then
        mv "$orig_file" "$backup_file"
        cp "$new_file" "$orig_file"
    fi
}

# Backup and replace configuration files
backup_and_replace "~/.bashrc" "~/.dotfiles/.bash/.bashrc.native.orig" "~/.dotfiles/.bash/.bashrc.for.home"
backup_and_replace "~/.tmux.conf" "~/.dotfiles/.tmux/.tmux.conf.native.orig" "~/.dotfiles/.tmux/.tmux.conf.for.home"
backup_and_replace "~/.vimrc" "~/.dotfiles/.vim/.vimrc.native.orig" "~/.dotfiles/.vim/.vimrc.for.home"
backup_and_replace "~/.zshrc" "~/.dotfiles/.zsh/.zshrc.native.orig" "~/.dotfiles/.zsh/.zshrc.for.home"

# Copy autostart files
cp ~/.dotfiles/.config/autostart/ulauncher.desktop ~/.config/autostart/
cp ~/.dotfiles/.config/autostart/org.kde.latte-dock.desktop ~/.config/autostart/

# Copy ulauncher configuration
cp -r ~/.dotfiles/.config/ulauncher ~/.dotfiles/.config/ulauncher

# Install vim plugins
vi ~/.vimrc  -c "PluginInstall"
