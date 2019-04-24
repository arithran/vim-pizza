" ============================================================================
" vim-pizza: Order pizza from within Vim.
"
" Author:     Arithran Thurairetnam
"             Evan Quan
" Maintainer: https://github.com/arithran/vim-pizza
" Version:    0.3.1
" ============================================================================
if exists("g:pizza#loaded")
	finish
endif

let s:DEFAULT_PIZZA_URL = "pizza hut"

if !exists('g:pizza#default_pizzeria')
	let g:pizza#default_pizzeria = s:DEFAULT_PIZZA_URL
endif

" In order to prevent the defaults from overriding user-specified values,
" we only create the map if it doesn't exist and add default key:value pairs
" if they are not already defined.
if !exists('g:pizza#pizzerias')
	let g:pizza#pizzerias = {}
endif

if !has_key(g:pizza#pizzerias, 'pizza hut')
let g:pizza#pizzerias['pizza hut'] = s:DEFAULT_PIZZA_URL
endif
if !has_key(g:pizza#pizzerias, 'ph')
let g:pizza#pizzerias['ph'] = s:DEFAULT_PIZZA_URL
endif
if !has_key(g:pizza#pizzerias, 'papa johns')
let g:pizza#pizzerias['papa johns'] = 'https://www.papajohns.com'
endif
if !has_key(g:pizza#pizzerias, 'pj')
let g:pizza#pizzerias['pj'] = 'https://www.papajohns.com'
endif
if !has_key(g:pizza#pizzerias, 'papa johns pan cheese')
let g:pizza#pizzerias['papa johns pan cheese'] = 'https://www.papajohns.com/
                                                \ order/builder/productBuilderInfo?
                                                \ productGroupId=pan-cheese&productSKU.sku
                                                \ =1-296-3-83&quantity=1'
endif
if !has_key(g:pizza#pizzerias, 'dominos')
let g:pizza#pizzerias['dominos'] = 'https://www .dominos.com'
endif

" Attempt to get a key's corresponding value in a dictionary. If the key does
" not exist in the dictionary, return the default value instead.
"
" @param[in] Dictionary dict     to get value from
" @param[in] String     key      corresponding to the value to return
" @param[in] String     default  value to return if key does not exist in the
"                                specified map
"
" @return String the value or default
"
function! s:GetValueOrDefault(dict, key, default) abort
	return has_key(a:dict, a:key) ? a:dict[a:key] : a:default
endfunction


" Order pizza from the specified pizzeria
"
" @param[in] List<String> a:000    pizzeria name, with each element as a word
"
function! OrderPizza(...)
	let s:pizzeria = s:GetValueOrDefault(g:pizza#pizzerias,
	                                   \ join(a:000, " "),
	                                   \ g:pizza#pizzerias[g:pizza#default_pizzeria])
	call s:OpenURL(s:pizzeria)
endfunction

" Open the specified URL in a browser window.
"
" @param[in] String url    specified to open
"
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

let g:pizza#loaded = 1
