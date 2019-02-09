# dotfiles

## Setup
```
git clone https://github.com/ponpocont/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

Install `vim-plug` (https://github.com/junegunn/vim-plug#installation)
```
# Vim (Unix)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim (Windows PowerShell)
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)

# Then exec `:PlugInstall` in Vim
```
