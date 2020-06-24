This zhenlong's Vimrc.
=========================
Here is my Vim configurations and plugins which I use in my daily job,
Vim-plug helps me manage all my plugins.

## Usage

### Installation and Requisites and link the vimrc to .vim/vimrc

* Backup original vimrc and clone files to your home directory:

   ```bash
   mv ~/.vimrc ~/.vimrc.original
   git clone https://github.com/zhenlonghe/Vimrc.git ~/.vim && \
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
   ln -s .vim/vimrc .vimrc
   ```
* Open vim and execute the `:PlugInstall` to get latest version modules.


## Update

* Update Plugs `:PlugUpdate`

* Update vim-plug self `:PlugUpgrade`

## Contact

Enjoy it, and if you have any question or comment, feel free to contact me.
Happy Coding :)
