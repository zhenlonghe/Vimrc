This zhenlong's Vimrc.
=========================

My personal Vim configurations and some plugins which I used in my daily job.
I use vim-plug to manage all my plugins, and this config compatible with
Windows, Linux and OS X.

## Usage

### Installation and Requisites:

* copy files to your home directory:

   ```
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

* link the vimrc to

   ```
   ln -s .vim/vimrc .vimrc
   ```

* open vim and execute the `:PlugInstall` to get latest version modules:


### Update

* init or add new plugin

   ```
    :PlugInstall
   ```

* update

   ```
    :PlugUpdate
   ```

* update vim-plug self

    ```
    :PlugUpgrade
    ```

## Contact

Enjoy it, and if there's any question or comment, feel free to let me know.
Happy Coding :)
