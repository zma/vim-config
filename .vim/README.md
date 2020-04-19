ocp-indent
vim-nerdtree-tab

--
old ones

Update log:

vim-scala-dist/indent/scala.vim:

bug for 

if (str(pos) == '(') { 

in 

scala.vim

add

  " also handle '('
  let line = substitute(line, "'('", '', 'g')

