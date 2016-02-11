ocaml.vim
============

Vim 7.3 comes with a new feature called "conceal."
One application of it is dynamically displaying unicode glyph of a given combination of patterns or keywords.
For instance, we can display unicode right arrow  →  on the screen with ascii right arrow in the buffer.
There has been vim coneal syntax files for differenc programming langauges, like

* [haskell](https://github.com/vim-scripts/Haskell-Conceal)
* [perl](https://github.com/c9s/perl-conceal.vim)
* [ruby](http://ithaca.arpinum.org/2010/11/06/vim-conceal-for-ruby.html)
* [latex](http://b4winckler.wordpress.com/2010/08/07/using-the-conceal-vim-feature-with-latex/)

This one is a conceal syntax defition for OCaml.


Installation
------------

Drop the ocaml.vim to ~/.vim/after/syntax (Linux/Mac OS X/BSD) or ~/vimfiles/after/syntax folder (Windows) 


Screenshot
----------

![screenshot for ocaml.vim](https://lh3.googleusercontent.com/-_oDSlkueuJk/Ts4-0evDpYI/AAAAAAAADbk/x0DTp6kTdTU/s912/vim-ocaml-conceal.png)

License
-------

Copyright (c) Paul Meng.  Distributed under the same terms as Vim itself.
See `:help license`.
