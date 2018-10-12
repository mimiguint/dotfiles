# dotfiles

## Setup
```
git clone https://github.com/ponpocont/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

Install vim-plug (https://github.com/junegunn/vim-plug#installation)
```
# Vim (Unix)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Then exec `:PlugInstall` in Vim
```
