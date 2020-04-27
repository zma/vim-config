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

### Additional configurations

The auto completion feature uses TabNine free plan which has a limitation on the size of the project. If your project is large, you may need to subscribe to the paid plans to make it work for your projects.

Enjoy.

Eric Ma ( https://www.ericzma.com )

