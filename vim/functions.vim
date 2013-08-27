function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight for tab number and &modified
    let s .= '%#TabLineSel#'
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ':'
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0  " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLine#'
    else
      let s .= '%#TabLineSel#'
    endif
    " add buffer names
    let s .= n
    " switch to no underlining and add final space to buffer list
    let s .= '%#TabLineSel#' . ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction

" function! RunTests(filename)
"     " Write the file and run tests for the given filename
"     :w
"     :silent !echo;echo;echo;echo;echo
"     exec ":!bundle exec rspec " . a:filename
" endfunction
" 
" function! SetTestFile()
"     " Set the spec file that tests will be run for.
"     let t:grb_test_file=@%
" endfunction
" 
" function! RunTestFile(...)
"     if a:0
"         let command_suffix = a:1
"     else
"         let command_suffix = ""
"     endif
" 
"     " Run the tests for the previously-marked file.
"     let in_spec_file = match(expand("%"), '_spec.rb$') != -1
"     if in_spec_file
"         call SetTestFile()
"     elseif !exists("t:grb_test_file")
"         return
"     end
"     call RunTests(t:grb_test_file . command_suffix)
" endfunction
" 
" function! RunNearestTest()
"     let spec_line_number = line('.')
"     call RunTestFile(":" . spec_line_number)
" endfunction

" Copy selected lines to the system clipboard
" *******************************************
" Copy the selected lines to the system pasteboard
" function SystemClipboardCopy() range
"   echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| pbcopy')
" endfunction
"
" com -range=% -nargs=0 SystemClipboardCopy :<line1>,<line2>call SystemClipboardCopy()

" Evaluate the selected lines w. ruby and print output
" ****************************************************
" function EvalRuby() range
"   let 
"   let ruby_code = join(getline(a:firstline, a:lastline), "\n")
"   let ruby_output = system('echo '.shellescape(ruby_code).'| ruby ')
" 
"   " execute "normal " . a:lastline . "G"
"   " execute "normal o# => " . ruby_code . "\<Esc>ddk"
"   execute "normal o# => " . ruby_code . "\<Esc>ddk"
" endfunction
" 
" com -range=% -nargs=0 EvalRuby :<line1>,<line2>call EvalRuby()
