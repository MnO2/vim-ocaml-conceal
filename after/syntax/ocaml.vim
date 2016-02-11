" ocaml.vim - vim conceal enhanvement for ocaml
" Original Maintainer:  Paul Meng <mno2.csie@gmail.com>
" Current Maintainer:   Anthony Scemama <scemama@gmail.com>
" Version:      1.1

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
    syntax match ocamlNiceOperator ":>" conceal cchar=≻
    iab ≻ :>
    syntax match ocamlNiceOperator "|>" conceal cchar=↦
    "iab ↦ |>
    syntax match ocamlNiceOperator "@@" conceal cchar=∘
    iab ∘ @@

    " Greek letters. Some are missing, please contribute!
    syntax match ocamlNiceOperator "\C\<Delta\>" conceal cchar=Δ
    syntax match ocamlNiceOperator "\C\<Lambda\>" conceal cchar=Λ
    syntax match ocamlNiceOperator "\C\<Pi\>" conceal cchar=Π
    syntax match ocamlNiceOperator "\C\<Sigma\>" conceal cchar=Σ
    syntax match ocamlNiceOperator "\C\<Psi\>" conceal cchar=Ψ
    syntax match ocamlNiceOperator "\C\<Omega\>" conceal cchar=Ω
    syntax match ocamlNiceOperator "\C\<alpha\>" conceal cchar=α
    syntax match ocamlNiceOperator "\C\<beta\>" conceal cchar=β
    syntax match ocamlNiceOperator "\C\<gamma\>" conceal cchar=γ
    syntax match ocamlNiceOperator "\C\<delta\>" conceal cchar=δ
    syntax match ocamlNiceOperator "\C\<epsilon\>" conceal cchar=ε
    syntax match ocamlNiceOperator "\C\<zeta\>" conceal cchar=ζ
    syntax match ocamlNiceOperator "\C\<theta\>" conceal cchar=θ
    syntax match ocamlNiceOperator "\C\<eta\>" conceal cchar=η
    syntax match ocamlNiceOperator "\C\<lambda\>" conceal cchar=λ
    syntax match ocamlNiceOperator "\C\<mu\>" conceal cchar=μ
    syntax match ocamlNiceOperator "\C\<nu\>" conceal cchar=ν
    syntax match ocamlNiceOperator "\C\<pi\>" conceal cchar=π
    syntax match ocamlNiceOperator "\C\<rho\>" conceal cchar=ρ
    syntax match ocamlNiceOperator "\C\<sigma\>" conceal cchar=σ
    syntax match ocamlNiceOperator "\C\<tau\>" conceal cchar=τ
    syntax match ocamlNiceOperator "\C\<phi\>" conceal cchar=φ
    syntax match ocamlNiceOperator "\C\<nabla\>" conceal cchar=∇
    syntax match ocamlNiceOperator "\C\<chi\>" conceal cchar=χ
    syntax match ocamlNiceOperator "\C\<psi\>" conceal cchar=ψ
    syntax match ocamlNiceOperator "\C\<omega\>" conceal cchar=ω

endif

hi link ocamlNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
