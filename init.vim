set number
set termguicolors
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set clipboard+=unnamedplus
set nowrap

" neocide configuration
if exists("g:neovide")
    set guifont=FiraCode\ Nerd\ Font:h9
    let g:neovide_hide_mouse_when_typing = v:true
    " let g:neovide_refresh_rate = 144
    " let g:neovide_refresh_rate_idle = 60
    let g:neovide_no_idle = v:true
    let g:neovide_cursor_vfx_mode = "pixiedust"
    let g:neovide_cursor_vfx_mode = "sonicboom"

    let g:neovide_scale_factor = 1.0
    function! ChangeScaleFactor(delta)
      let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
    endfunction
    nnoremap <expr><C-=> ChangeScaleFactor(1.25)
    nnoremap <expr><C--> ChangeScaleFactor(1/1.25)
endif

lua require('plugins')

lua require('_catppuccin')
colorscheme catppuccin

lua require('_lualine')
lua require('_telescope')
lua require('_notify')
lua require('_noice')
lua require('_neo_tree')
lua require('_treesitter')

lua require('_mason')
lua require('_lsp_config')
lua require('_dap')
lua require('_dap_ui')
lua require('_null_ls')
lua require('_cmp')
lua require('_saga')

lua require('_trouble')
lua require('_comment')
lua require('_autopairs')
lua require('_autotag')
lua require('_rainbow')
lua require('_indent')
lua require('_gitsigns')
lua require('_colorizer')
lua require('_navic')
lua require('_aerial')
lua require('_whichkey')
lua require('_toggleterm')
lua require('_spectre')
lua require('_mini')

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
nnoremap <C-`> :b#<CR>

" for go template syntax highlighting
function DetectGoHtmlTmpl()
    if expand('%:e') == "html" && search("{{") != 0
        setfiletype gohtmltmpl
    endif
endfunction

augroup filetypedetect
    " gohtmltmpl
    au BufRead,BufNewFile *.html call DetectGoHtmlTmpl()
augroup END

