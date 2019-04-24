" ============================================================================
" vim-pizza: Order pizza from within Vim.
"
" Author:     Arithran Thurairetnam
" Maintainer: https://github.com/arithran/vim-pizza
" Version:    0.2.0
" ============================================================================
if exists("g:pizza#loaded")
	finish
endif

let s:DEFAULT_PIZZA_URL = "pizza hut"
let s:INVALID_PIZZERIA = ""

if !exists('g:pizza#default_pizzeria')
	let g:pizza#default_pizzeria = s:DEFAULT_PIZZA_URL
endif

if !exists('g:pizza#pizzerias')
	let g:pizza#pizzerias = { 'pizza hut'  : 'https://www.pizzahut.com',
	                        \ 'ph'         : 'https://www.pizzahut.com',
	                        \ 'papa johns' : 'https://www.papajohns.com',
	                        \ 'pj'         : 'https://www.papajohns.com',
	                        \ 'papa johns pan cheese' : 'https://www.papajohns.com/
	                                                   \ order/builder/productBuilderInfo?
	                                                   \ productGroupId=pan-cheese&productSKU.sku
	                                                   \ =1-296-3-83&quantity=1',
	                        \ 'dominos'    : 'https://www.dominos.com',
	                        \ }
endif

" Attempt to get a key's corresponding value in a dictionary. If the key does
" not exist in the dictionary, return the default value instead.
"
" @param[in] Dictionary dict     to get value from
" @param[in] String     key      corresponding to the value to return
" @param[in] String     default  value to return if key does not exist in the
"                                specified map
function! s:GetValueOrDefault(dict, key, default) abort
	return has_key(a:dict, a:key) ? a:dict[a:key] : a:default
endfunction


" Order pizza from the specified pizzeria
"
" @param[in] List<String> a:000    pizzeria name, with each element as a word
function! OrderPizza(...)
	let s:pizzeria = s:GetValueOrDefault(g:pizza#pizzerias,
	                                   \ join(a:000, " "),
	                                   \ g:pizza#pizzerias[g:pizza#default_pizzeria])
	call s:OpenURL(s:pizzeria)
endfunction

" Open the specified URL in a browser window.
"
" @param[in] String url    specified to open
function! s:OpenURL(url) abort
	let haskdeinit = system("ps -e") =~ 'kdeinit'
	let hasdarwin = system("uname -s") =~ 'Darwin'


	if has("gui_running")
		let args = shellescape(a:url,1)." &"
	else
		let args = shellescape(a:url,1)." > /dev/null"
	end

	if has("unix") && executable("gnome-open") && !haskdeinit
		exe "silent !gnome-open ".args
	elseif has("unix") && executable("kde-open") && haskdeinit
		exe "silent !kde-open ".args
	elseif has("unix") && executable("open") && hasdarwin
		exe "silent !open ".args
	elseif has("unix") && executable("xdg-open")
		exe "silent !xdg-open ".args
	elseif has("win32") || has("win64")
		exe "silent !start explorer ".shellescape(a:url,1)
	end
	redraw!
endfunction

command! -nargs=* OrderPizza call OrderPizza(<q-args>)

nnoremap <silent> <Plug>(pizza#order) :call OrderPizza()<Return>

let g:pizza#loaded = 1
