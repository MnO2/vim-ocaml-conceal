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
    iab Δ Delta
    syntax match ocamlNiceOperator "\C\<Lambda\>" conceal cchar=Λ
    iab Λ Lambda
    syntax match ocamlNiceOperator "\C\<Pi\>" conceal cchar=Π
    iab Π Pi
    syntax match ocamlNiceOperator "\C\<Sigma\>" conceal cchar=Σ
    iab Σ Sigma
    syntax match ocamlNiceOperator "\C\<Psi\>" conceal cchar=Ψ
    iab Ψ Psi
    syntax match ocamlNiceOperator "\C\<Omega\>" conceal cchar=Ω
    iab Ω Omega
    syntax match ocamlNiceOperator "\C\<alpha\>" conceal cchar=α
    iab α alpha
    syntax match ocamlNiceOperator "\C\<beta\>" conceal cchar=β
    iab β beta
    syntax match ocamlNiceOperator "\C\<gamma\>" conceal cchar=γ
    iab γ gamma
    syntax match ocamlNiceOperator "\C\<delta\>" conceal cchar=δ
    iab δ delta
    syntax match ocamlNiceOperator "\C\<epsilon\>" conceal cchar=ε
    iab ε epsilon
    syntax match ocamlNiceOperator "\C\<zeta\>" conceal cchar=ζ
    iab ζ zeta
    syntax match ocamlNiceOperator "\C\<theta\>" conceal cchar=θ
    iab θ theta
    syntax match ocamlNiceOperator "\C\<eta\>" conceal cchar=η
    iab η eta
    syntax match ocamlNiceOperator "\C\<lambda\>" conceal cchar=λ
    iab λ lambda
    syntax match ocamlNiceOperator "\C\<mu\>" conceal cchar=μ
    iab μ mu
    syntax match ocamlNiceOperator "\C\<nu\>" conceal cchar=ν
    iab ν nu
    syntax match ocamlNiceOperator "\C\<pi\>" conceal cchar=π
    iab π pi
    syntax match ocamlNiceOperator "\C\<rho\>" conceal cchar=ρ
    iab ρ rho
    syntax match ocamlNiceOperator "\C\<sigma\>" conceal cchar=σ
    iab σ sigma
    syntax match ocamlNiceOperator "\C\<tau\>" conceal cchar=τ
    iab τ tau
    syntax match ocamlNiceOperator "\C\<phi\>" conceal cchar=φ
    iab φ phi
    syntax match ocamlNiceOperator "\C\<nabla\>" conceal cchar=∇
    iab ∇ nabla
    syntax match ocamlNiceOperator "\C\<chi\>" conceal cchar=χ
    iab χ chi
    syntax match ocamlNiceOperator "\C\<psi\>" conceal cchar=ψ
    iab ψ psi
    syntax match ocamlNiceOperator "\C\<omega\>" conceal cchar=ω
    iab ω omega

endif

hi link ocamlNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
