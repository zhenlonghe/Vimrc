This zhenlong's vimrc.


My personal Vim configurations and some plugins which I used in my daily job.

## Usage

### Installation and Requisites:

1. BACKUP your `.vim` directory and `.vimrc` first.(IMPORTANT!)

2. `cd ~` to change directory to your home directory.

3. copy files to your home directory:

   ```shell
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

4. cd to `zhenlong-vimrc` directory and execute the `:BundleInstall!  ` to get latest version modules:

5. link the vimrc to

   ```Shell
   ln -s .vim/vimrc .vimrc
   ```


### Update:

1. init
   ```shell
    `:PlugInstall`
   ```

2. update
   ```shell
    `:PlugUpdate`
   ```

## Contact

Enjoy it, and if there's any question or comment, feel free to let me know :)
