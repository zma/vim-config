vim-config
==========

A Vim configuration I use by myself too with neovim on both Linux and macOS. It extends neovim/vim with plugins as follows.

- junegunn/vim-plug: for plugin management
- fholgado/minibufexpl.vim: show buffers on top
- iamcco/markdown-preview.nvim: for Markdown preview with `:MarkdownPreview`

## How to use these files

If you never configured Vim:

```
cd
ln -s /path/to/vim-config/.vimrc ~/
ln -s /path/to/vim-config/.vim ~/
ln -s /path/to/vim-config/.vim ~/config/nvim # for neovim
```

If you ever configured your Vim, you may need to merge my configurations to yours.

Then install the plugins by running the following command within vim/neovim:

```
:PlugInstall
```

Enjoy.

Eric Ma ( https://www.ericzma.com )

