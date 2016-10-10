let s:other_file_type = {"cpp": "h", "h": "cpp"}

" Given a cpp file (ending in .h or .cpp), returns its other half
function! GetAlternateCppFile(file_name)
    let l:dot_separated_words = split(a:file_name, '\.')
    let l:num_words = len(l:dot_separated_words)

    if l:num_words >= 2
        let l:file_name_without_extension_words_list = l:dot_separated_words[:l:num_words-2]
        let l:file_name_without_extension = join(l:file_name_without_extension_words_list, '.')
        let l:file_extension = tolower((l:dot_separated_words[l:num_words-1:])[0])

        if has_key(s:other_file_type, l:file_extension)
            return l:file_name_without_extension . "." . s:other_file_type[l:file_extension]
        endif
    return ""
    endif
endfunction

" Opens the current cpp buffers alternate file, allowing fast
" switching between source and header files
function! EditCurrentBuffersAlternateCppFile()
    let l:other_file = GetAlternateCppFile(bufname("%"))
    if !empty(l:other_file)
        execute ':e' l:other_file
    endif
endfunction
