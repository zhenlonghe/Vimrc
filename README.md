This zhenlong's Vimrc.
=========================
My personal Vim configurations and plugins which I use in my daily job,
and it compatibles with Windows, Linux and OS X. Vim-plug helps me manage all my plugins.

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

Enjoy it, and if you have any question or comment, feel free to contact me know.
Happy Coding :)
