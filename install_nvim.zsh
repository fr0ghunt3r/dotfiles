BASE=$(pwd)

export GIT_SSL_NO_VERIFY=true

# download and install plug.vim
mkdir -p ~/.vim/autoload
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

# nvim
mkdir -p ~/.config/nvim/autoload
ln -sf ${BASE}/dotfiles/vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/

# apply to nvim
nvim +PlugInstall +qall

