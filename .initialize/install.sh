set -x
#sudo apt-get -y install git
mkdir -pv ~/.bash/bash-it/ ~/.tmux/plugins/ ~/.tmux/plugins/tmux-battery/ ~/.tmux/plugins/tmux-cpu/ ~/.tmux/plugins/tmux-net-speed/ ~/.tmux/plugins/tmux-copycat/ ~/.tmux/plugins/tmux-online-status ~/.tmux/plugins/tmux-open ~/.tmux/plugins/tmux-plugin-sysstat ~/.tmux/plugins/tmux-prefix-highlight ~/.tmux/plugins/tmux-sidebar ~/.tmux/plugins/tpm
[ ! -f ~/.bash/bash-it/LICENSE ] &&  git clone https://github.com/mjaimin/bash-it.git ~/.bash/bash-it/
[ ! -f ~/.vim/bundle/Vundle.vim/LICENSE-MIT.txt ] && git clone https://github.com/mjaimin/Vundle.vim.git ~/.vim/bundle/Vundle.vim/
[ ! -f ~/.tmux/plugins/tmux-battery/LICENSE.md ] && git clone https://github.com/tmux-plugins/tmux-battery.git ~/.tmux/plugins/tmux-battery/
[ ! -f ~/.tmux/plugins/tmux-cpu/LICENSE ] && git clone https://github.com/tmux-plugins/tmux-cpu.git ~/.tmux/plugins/tmux-cpu/
[ ! -f ~/.tmux/plugins/tmux-net-speed/LICENSE ] && git clone https://github.com/tmux-plugins/tmux-net-speed.git ~/.tmux/plugins/tmux-net-speed/
[ ! -f ~/.tmux/plugins/tmux-copycat/LICENSE.md ] && git clone https://github.com/tmux-plugins/tmux-copycat.git ~/.tmux/plugins/tmux-copycat/
[ ! -f ~/.tmux/plugins/tmux-sidebar/LICENSE.md ] && git clone https://github.com/tmux-plugins/tmux-sidebar.git ~/.tmux/plugins/tmux-sidebar/
[ ! -f ~/.tmux/plugins/tmux-prefix-highlight/LICENSE ] && git clone https://github.com/tmux-plugins/tmux-prefix-highlight.git ~/.tmux/plugins/tmux-prefix-highlight/
[ ! -f ~/.tmux/plugins/tmux-plugin-sysstat/LICENSE ] && git clone https://github.com/samoshkin/tmux-plugin-sysstat.git ~/.tmux/plugins/tmux-plugin-sysstat/
[ ! -f ~/.tmux/plugins/tmux-online-status/LICENSE.md ] && git clone https://github.com/tmux-plugins/tmux-online-status.git ~/.tmux/plugins/tmux-online-status/
[ ! -f ~/.tmux/plugins/tmux-open/LICENSE.md ] && git clone https://github.com/tmux-plugins/tmux-open.git ~/.tmux/plugins/tmux-open/
[ ! -f ~/.tmux/plugins/tpm/LICENSE.md ] && git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm/

#mv ~/.bashrc   ~/.dotfiles/.bash/.bashrc.native.orig
#cp ~/.dotfiles/.bash/.bashrc.for.home ~/.bashrc
#
[ ! -f ~/.dotfiles/.tmux/.tmux.conf.native.orig ] && mv ~/.tmux.conf ~/.dotfiles/.tmux/.tmux.conf.native.orig
cp ~/.dotfiles/.tmux/.tmux.conf.for.home ~/.tmux.conf

[ ! -f ~/.dotfiles/.vim/.vimrc.native.orig ] && mv ~/.vimrc ~/.dotfiles/.vim/.vimrc.native.orig
cp ~/.dotfiles/.vim/.vimrc.for.home ~/.vimrc
