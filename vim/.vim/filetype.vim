augroup filetypedetect
	au BufRead,BufNewFile *.py setfiletype python
	au BufRead,BufNewFile *.rb setfiletype ruby
	au BufRead,BufNewFile *.yml,*.yaml setfiletype yaml
augroup END
