" ocaml.vim - vim conceal enhanvement for ocaml
" Maintainer:   Paul Meng <mno2.csie@gmail.com>
" Version:      1.0

" Install in ~/.vim/after/syntax (Linux/Mac OS X/BSD) or ~/vimfiles/after/syntax folder (Windows) 
"
" :set foldmethod=marker
if exists('g:no_ocaml_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

" vim: set fenc=utf-8:
syntax keyword ocamlNiceOperator fun conceal cchar=λ
iab λ fun
syntax keyword ocamlNiceOperator rec conceal cchar=Γ
iab Γ rec
syntax match ocamlNiceOperator "<-" conceal cchar=←
iab ← <-
syntax match ocamlNiceOperator "->" conceal cchar=→
iab → ->
syntax match ocamlNiceOperator "\<sqrt\>" conceal cchar=√ 
iab √  sqrt
syntax match ocamlNiceOperator "==" conceal cchar=≡
iab ≡ ==
syntax match ocamlNiceOperator "<>" conceal cchar=≠
iab ≠ <>
syntax match ocamlNiceOperator "||" conceal cchar=∨
iab ∨ ||
syntax match ocamlNiceOperator "@" conceal cchar=⊕
iab ⊕ @
syntax match ocamlNiceOperator "*" conceal cchar=×
iab × *
syntax match ocamlNiceOperator ";;" conceal cchar=♢
iab ♢ ;;

let s:extraConceal = 1
" Some windows font don't support some of the characters,
" so if they are the main font, we don't load them :)
if has("win32")
    let s:incompleteFont = [ 'Consolas'
                        \ , 'Lucida Console'
                        \ , 'Courier New'
                        \ ]
    let s:mainfont = substitute( &guifont, '^\([^:,]\+\).*', '\1', '')
    for s:fontName in s:incompleteFont
        if s:mainfont ==? s:fontName
            let s:extraConceal = 0
            break
        endif
    endfor
endif

if s:extraConceal
    " Match greater than and lower than w/o messing with Kleisli composition
    syntax match ocamlNiceOperator "<=\ze[^<]" conceal cchar=≤
    iab ≤ <=
    syntax match ocamlNiceOperator ">=\ze[^>]" conceal cchar=≥
    iab ≥ >=
    syntax match ocamlNiceOperator "=>" conceal cchar=⇒
    iab ⇒ ="
    syntax match ocamlNiceOperator "\:\:" conceal cchar=∷
    iab ∷ ::
    syntax match ocamlNiceOperator "++" conceal cchar=⧺
    iab ⧺ ++
    syntax match ocamlNiceOperator "\<for_all\>" conceal cchar=∀
    iab ∀ for_all
    syntax match ocamlNiceOperator ":>" conceal cchar=≻
    iab ≻ :>
    syntax match ocamlNiceOperator "|>" conceal cchar=↦
    iab ↦ |>
    syntax match ocamlNiceOperator "@@" conceal cchar=∘
    iab ∘ @@
endif

hi link ocamlNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
