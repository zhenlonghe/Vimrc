This zhenlong's vimrc


My personal Vim configurations and some plugins which I used in my daily job.

I put Vim related settings in `plugin/settings/Settings.vim`, and isolate other plugins' settings in `plugin/settings` directory.



## Usage

### Installation and Requisites:

1. BACKUP your `.vim` directory and `.vimrc` first.(IMPORTANT!)

2. `cd ~` to change directory to your home directory.

3. copy files to your home directory:

        git clone vundle

4. cd to `zhenlong-vimrc` directory and execute the `:BundleInstall!  ` to get latest version modules:

5. link the vimrc to

        ln -s .vim/vimrc .vimrc


### Update:

1. init
        `:BundleInstall`

2. update
        `:BundleInstall!`

### Key Mappings:

    - `<F1>`                        to toggle a Calendar window on and off.

    - `<F2>`                        to toggle NERDTree on and off.

    - `<F4>`                        to toggle Taglist window.

    - `<F5>`                        is the script runner, according to it's filetype, it will run Ruby(*.rb) ,Python(*.py) or Javascript(*.js) file(SpiderMonkey is needed), even CoffeeScript(*.coffee, but you may have to install CoffeeScript first). If the filetype is VimScript, `<F5>` will run `:source %` for you.

    - `<ctrl>p`                     will launch a quick window to match keywords from your current working directory, not only file name, but also path name. And `<ctrl>w u` will match from your MRU(Mostly Recent Used) files, which is also frequently used.

    - `<leader>v`                   to open `.vimrc` in a new tab.

    - `<leader>0`                   to edit or create `README.md` in current working directory.

    - `<leader>0`                   open README.md file for the vim conf.

    - `<leader>s`                   for ack search

    - `<leader>f`                   for nohlsearch

    - `<leader>da`                  insert the data today.

    - `<leader>ti`                  insert the current time.

    - `<leader>ee`                  edit setting.vim.

    - `<leader>n`                   add a space line.

    - `<leader>sa`                  set mouse=a.

    - `<leader>sv`                  set mouse=a

    - `<leader>ta`                  tabularize

    - `<leader>v`                   open vimrc file.

    - `<leader>z`                   Toggle between working mode and presentation mode by , but font only work in GUI version Vim.

    - `FF`                          Ack Search.
    - `jj`                         map jj for ESC

## Contact

Enjoy it, and if there's any question or comment, feel free to let me know :)
