" Vim plugin for writing prose
" Last Change: 2013-02-23
" Maintainer: Gianluca Fiore <forod.g@gmail.com>
" License: BSD license

if exists("g:writing_enabled")
    finish
endif

let g:writing_enabled = 1
let g:writing_on = 0

let s:save_cpo = &cpo
set cpo&vim

let s:font = &guifont
let s:numbers = &number
let s:relative = &relativenumber
let s:spacing = &linespace
let s:cursor = &cursorline
let s:width = &textwidth
let s:status = &laststatus

function s:Toggle()
    if has('gui')
        if (g:writing_on == 0)
            set guifont=Liberation\ Mono\ 12
			set formatoptions+=wqnl
			set noexpandtab
            set nonumber
            set norelativenumber
            set linespace=5
            set nocursorline
            set laststatus=0
			set complete+=kspell
            let g:writing_on = 1
        else
            exe ":set guifont=" . s:font
            exe ":set linespace=" . s:spacing
            exe ":set laststatus=" . s:status
            if (s:numbers == 0)
                set number
            endif
            if (s:relative == 0)
                set relativenumber
            endif
            if (s:cursor == 0)
                set cursorline
            endif
			set formatoptions+=wqnl
			set noexpandtab
			set complete+=kspell
            let g:writing_on = 0
        endif
    else
		if (g:writing_on == 0)
			set formatoptions+=wqnl
			set noexpandtab
            set nonumber
            set norelativenumber
            set nocursorline
            set laststatus=0
			set complete+=kspell
            let g:writing_on = 1
		else
            exe ":set laststatus=" . s:status
            if (s:numbers == 0)
                set number
            endif
            if (s:relative == 0)
                set relativenumber
            endif
            if (s:cursor == 0)
                set cursorline
            endif
			set formatoptions+=wqnl
			set noexpandtab
			set complete+=kspell
            let g:writing_on = 0
        endif
    endif
endfunction

if !exists(":WritingModeToggle")
    command -nargs=0 WritingModeToggle :call s:Toggle()
endif

let &cpo = s:save_cpo
