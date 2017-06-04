## for writing

* reedes/vim-wordy
* cespare/vim-toml
- spf13/vim-preview

- ctrlpvim/ctrlp.vim
- tacahiroy/ctrlp-funky
- terryma/vim-multiple-cursors
- luochen1990/rainbow

## settings 

```vim

" HTML {
        if count(g:spf13_bundle_groups, 'html')
            Bundle 'amirh/HTML-AutoCloseTag'
            Bundle 'hail2u/vim-css3-syntax'
            Bundle 'gorodinskiy/vim-coloresque'
            Bundle 'tpope/vim-haml'
            Bundle 'mattn/emmet-vim'
        endif
    " }
    
" AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

" TagBar {
        if isdirectory(expand("~/.vim/bundle/tagbar/"))
            nnoremap <silent> <leader>tt :TagbarToggle<CR>
        endif
    "}

    " Rainbow {
        if isdirectory(expand("~/.vim/bundle/rainbow/"))
            let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
        endif
    "}
```


