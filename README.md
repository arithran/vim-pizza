## Description
My initial attempt at trying to order pizza from within vim. 

## But Why?
After a long day's work of coding, you feel exhausted and all you want to do is eat pizza. But since you are a VIM user you wish that you had a key-binding within VIM to open your computer browser, point it at your favourite pizza and make an order. 

Also, you can brag about VIM ordering pizza at work(real reason for
developing this plug-in).

## Usage
	:OrderPizza

**If you are always hungry, add the following to your .vimrc to bind a key like F5**

	nnoremap <F5> :OrderPizza<CR>

**I always order Papa John's Pan Cheese, but this plug-in always takes me to the Pizza Hut homepage** (It can be any pizza URL you visit frequently)

	let g:vim_pizza_url ='https://www.papajohns.com/order/builder/productBuilderInfo?productGroupId=pan-cheese&productSKU.sku=1-296-3-83&quantity=1'


## Installation

This plugin follows the standard runtime path structure, and as such it can be installed with a variety of plugin managers:

| Plugin Manager | Install with... |
| ------------- | ------------- |
| [NeoBundle][12] | `NeoBundle 'arithran/vim-pizza'` |
| [Vundle][13] | `Plugin 'arithran/vim-pizza'` |
| [Plug][40] | `Plug 'arithran/vim-pizza'` |
| manual | copy all of the files into your `~/.vim` directory |

## License
Licensed under the [MIT License](LICENSE.txt).

## Want to collaborate?
I would like to create menus within VIM and integrate the plug-in with 3rd party APIs in the near future. Help is appreciated, PM me.

[12]: https://github.com/Shougo/neobundle.vim
[13]: https://github.com/gmarik/vundle
[40]: https://github.com/junegunn/vim-plug
