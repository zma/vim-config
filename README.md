vim-config
==========

My Vim configurations.

## How to use these files

    cd /path/to/vim-config/
    git submodule update --init --recursive

If you never configured Vim:

    cd
    ln -s /path/to/vim-config/.vimrc ./
    ln -s /path/to/vim-config/.vim ./

If you ever configured your Vim, you may need to merge my configurations to yours.

Then install plugins by

    vim +PluginInstall

You will need to install `ruby` needed by LustyJuggler.

### Additional configurations

YouCompleteMe needs pre compilation. Make sure you have `python-devel g++` and other needed packages installed. You need to install Go 1.11+ (one tutorial for Ubuntu 18.04 - https://www.systutorials.com/how-to-install-go-1-13-x-on-ubuntu-18-04/ ). 

Then, build YouCompleteMe by

    cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --clang-completer --go-completer --enable-coverage

If you just want to add support to some more languages, check the `install.py --help` info.

Enjoy.

Eric Ma ( https://www.ericzma.com )

