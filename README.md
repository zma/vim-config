vim-config
==========

My Vim configurations.

## How to use these files

If you never configured Vim:

    cd
    ln -s /path/to/vim-config/.vimrc ./
    ln -s /path/to/vim-config/.vim ./

If you ever configured your Vim, you may need to merge my configurations to yours.

Then install plugins by

    vim +PlugInstall

### Additional configurations

#### Enable TabNine

Run

```
:CocInstall coc-tabnine
```

The auto completion feature uses TabNine free plan which has a limitation on the size of the project. If your project is large, you may need to subscribe to the paid plans to make it work for your projects.

To enable semantic auto completion, in Vim, type `TabNine::sem`. You will need to install or enable the language specific tools/features by following the messages from TabNine when you edit files.

#### Enable C++ language server support with clangd

Run

```
:CocInstall coc-clangd
```

#### Other useful tools

Run

```
:CocInstall coc-json
```


Enjoy.

Eric Ma ( https://www.ericzma.com )

