""" 自动提示
" <<< 'prabirshrestha/asyncomplete.vim'
" 'prabirshrestha/asyncomplete-lsp.vim'
" 'prabirshrestha/async.vim'


let g:asyncomplete_auto_popup = 1
let g:asyncomplete_min_chars=1
let g:asyncomplete_auto_completeopt = 1


function! s:my_asyncomplete_preprocessor(options, matches) abort
    let l:visited = {}
    let l:items = []
    for [l:source_name, l:matches] in items(a:matches)
        for l:item in l:matches['items']
            if stridx(l:item['word'], a:options['base']) == 0
                if !has_key(l:visited, l:item['word'])
                    call add(l:items, l:item)
                    let l:visited[l:item['word']] = 1
                endif
            endif
        endfor
    endfor

    call asyncomplete#preprocess_complete(a:options, l:items)
endfunction

let g:asyncomplete_preprocessor = [function('s:my_asyncomplete_preprocessor')]

function! s:sort_by_priority_preprocessor(options, matches) abort
    let l:items = []
    for [l:source_name, l:matches] in items(a:matches)
        for l:item in l:matches['items']
            if stridx(l:item['word'], a:options['base']) == 0
                let l:item['priority'] =
                            \ get(asyncomplete#get_source_info(l:source_name),'priority',0)
                call add(l:items, l:item)
            endif
        endfor
    endfor
    let l:items = sort(l:items, {a, b -> b['priority'] - a['priority']})
    call asyncomplete#preprocess_complete(a:options, l:items)
endfunction
let g:asyncomplete_preprocessor = [function('s:sort_by_priority_preprocessor')]







