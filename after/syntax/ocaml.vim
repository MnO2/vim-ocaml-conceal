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
<<<<<<< HEAD
    iab ∘ @@
=======

    " Greek letters. Some are missing, please contribute!
    syntax match irpf90NiceOperator "\C\<Delta\>" conceal cchar=Δ
    syntax match irpf90NiceOperator "\C\<Lambda\>" conceal cchar=Λ
    syntax match irpf90NiceOperator "\C\<Pi\>" conceal cchar=Π
    syntax match irpf90NiceOperator "\C\<Sigma\>" conceal cchar=Σ
    syntax match irpf90NiceOperator "\C\<Psi\>" conceal cchar=Ψ
    syntax match irpf90NiceOperator "\C\<Omega\>" conceal cchar=Ω
    syntax match irpf90NiceOperator "\C\<alpha\>" conceal cchar=α
    syntax match irpf90NiceOperator "\C\<beta\>" conceal cchar=β
    syntax match irpf90NiceOperator "\C\<gamma\>" conceal cchar=γ
    syntax match irpf90NiceOperator "\C\<delta\>" conceal cchar=δ
    syntax match irpf90NiceOperator "\C\<epsilon\>" conceal cchar=ε
    syntax match irpf90NiceOperator "\C\<zeta\>" conceal cchar=ζ
    syntax match irpf90NiceOperator "\C\<theta\>" conceal cchar=θ
    syntax match irpf90NiceOperator "\C\<eta\>" conceal cchar=η
    syntax match irpf90NiceOperator "\C\<lambda\>" conceal cchar=λ
    syntax match irpf90NiceOperator "\C\<mu\>" conceal cchar=μ
    syntax match irpf90NiceOperator "\C\<nu\>" conceal cchar=ν
    syntax match irpf90NiceOperator "\C\<pi\>" conceal cchar=π
    syntax match irpf90NiceOperator "\C\<rho\>" conceal cchar=ρ
    syntax match irpf90NiceOperator "\C\<sigma\>" conceal cchar=σ
    syntax match irpf90NiceOperator "\C\<tau\>" conceal cchar=τ
    syntax match irpf90NiceOperator "\C\<phi\>" conceal cchar=φ
    syntax match irpf90NiceOperator "\C\<nabla\>" conceal cchar=∇
    syntax match irpf90NiceOperator "\C\<chi\>" conceal cchar=χ
    syntax match irpf90NiceOperator "\C\<psi\>" conceal cchar=ψ
    syntax match irpf90NiceOperator "\C\<omega\>" conceal cchar=ω

>>>>>>> feature/greek
endif

hi link ocamlNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
