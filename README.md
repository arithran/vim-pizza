## Description
My initial attempt at trying to order pizza from within Vim. 

## But Why?
After a long day's work of coding, you feel exhausted and all you want to do
is eat pizza. But since you are a Vim user you wish that you had a key-binding
within Vim to open your computer browser, point it at your favourite pizza and
make an order.

Also, you can brag about Vim ordering pizza at work (the real reason for
developing this plug-in).

## Usage
```vim
:OrderPizza
```
**If you are always hungry, add the following to your .vimrc to bind a key
like F5**
```vim
nnoremap <F5> :OrderPizza<CR>
```
**I always order Papa John's Pan Cheese, but this plug-in always takes me to
the Pizza Hut homepage** (It can be any pizza URL you visit frequently)
```vim
let g:pizza#default_pizzeria ='https://www.papajohns.com/order/builder/productBuilderInfo?productGroupId=pan-cheese&productSKU.sku=1-296-3-83&quantity=1'
```

Checkout `:help pizza` for more information.

## Installation

This plugin follows the standard runtime path structure, and as such it can be
installed with a variety of plugin managers:

Plugin Manager  | Install with...
--------------- | --------------------------------------------------
[NeoBundle][12] | `NeoBundle 'arithran/vim-pizza'`
[Vundle][13]    | `Plugin 'arithran/vim-pizza'`
[Plug][40]      | `Plug 'arithran/vim-pizza'`
[Pathogen][14]  | `git clone https://github.com/arithran/vim-pizza ~/.vim/bundle`
Manual          | Copy all of the files into your `~/.vim` directory

## License
Licensed under the [MIT License](LICENSE.txt).

## Want to collaborate?
I would like to create menus within Vim and integrate the plug-in with 3rd
party APIs in the near future. Help is appreciated, PM me.

[12]: https://github.com/Shougo/neobundle.vim
[13]: https://github.com/gmarik/vundle
[40]: https://github.com/junegunn/vim-plug
[14]: https://github.com/tpope/vim-pathogen
