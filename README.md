vim-config
==========

A Vim configuration I use by myself too with neovim on both Linux and macOS. It extends neovim/vim with plugins as follows.

- junegunn/vim-plug: for plugin management
- yegappan/taglist: show list of tags
- craigemery/vim-autotag: auto tags refresh/generation
- preservim/nerdtree: a file tree explorer
- Xuyuanp/nerdtree-git-plugin: show git status in nerdtree
- fholgado/minibufexpl.vim: show buffers on top
- neoclide/coc.nvim: Intellisense engine, full language server protocol support as VSCode
- vim-syntastic/syntastic: automatic syntactic checking
- bfrg/vim-cpp-modern: C++ modern indent style
- GoogleCppIndent function: indent C++ code in Google C++ style
- 2072/PHP-Indenting-for-VIm: PHP indent style
- stephpy/vim-php-cs-fixer: PHP/CSS improvement
- fatih/vim-go: Go indent style
- pangloss/vim-javascript: JavaScript indent style
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

### Additional configurations

#### TabNine AI based autocompletion for vim

To install it, run

```
:CocInstall coc-tabnine
```

The auto completion feature uses TabNine free plan which has a limitation on the size of the project. If your project is large, you may need to subscribe to the paid plans to make it work for your projects.

To enable semantic auto completion, in Vim, type `TabNine::sem`. You will need to install or enable the language specific tools/features by following the messages from TabNine when you edit files.

#### Language server support through Coc

**C++:**

```
:CocInstall coc-clangd
```

**Python:**

```
:CocInstall coc-python
```

**JSON:**

```
:CocInstall coc-json
```

Enjoy.

Eric Ma ( https://www.ericzma.com )

