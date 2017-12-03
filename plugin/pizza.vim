if !exists("*OrderPizza")
	function OrderPizza()
		let haskdeinit = system("ps -e") =~ 'kdeinit'
		let hasdarwin = system("uname -s") =~ 'Darwin'

		if !exists('g:vim_pizza_url')
			let g:vim_pizza_url = 'https://www.pizzahut.com'
		endif


		if has("gui_running")
			let args = shellescape(g:vim_pizza_url,1)." &"
		else
			let args = shellescape(g:vim_pizza_url,1)." > /dev/null"
		end

		if has("unix") && executable("gnome-open") && !haskdeinit
			exe "silent !gnome-open ".args
		elseif has("unix") && executable("kde-open") && haskdeinit
			exe "silent !kde-open ".args
		elseif has("unix") && executable("kde-open5") && haskdeinit5
			exe "silent !kde-open5 ".args
		elseif has("unix") && executable("open") && hasdarwin
			exe "silent !open ".args
		elseif has("win32") || has("win64")
			exe "silent !start explorer ".shellescape(g:vim_pizza_url,1)
		end
		redraw!
	endfunction
endif
command! OrderPizza call OrderPizza()
