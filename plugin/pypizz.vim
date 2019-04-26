if !has('python')
	finish
endif

function! Pizza()
if !exists('g:vim_pizza_url')
	let g:vim_pizza_url = 'https://www.pizzahut.com'
endif
python << endpy
import vim
import webbrowser
s = vim.eval("g:vim_pizza_url")
webbrowser.open(s, new=0, autoraise=True)
endpy
endfunction
command! PyPizz call Pizza()
