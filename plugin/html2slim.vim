" vim-html2slim - easy convert HTML(erb) to Slim
" Author:       Anton Davydov <http://davydovanton.github.io/>
" Version:      0.1

function! s:HTML2slim() range
  let content = getline(a:firstline, a:lastline)

  ruby execute

  execute 'vnew'
  execute 'vertical resize ' . vertical_size
  set syntax=slim
  call setline(1, slim_content)
endfunction
command -range HTML2slim :<line1>,<line2>call s:HTML2slim()

function! s:HTML2slimExtract(root, name) range
  let content = getline(a:firstline, a:lastline)

  ruby execute

  execute 'vnew'
  execute 'vertical resize ' . vertical_size
  set syntax=slim
  call setline(1, slim_content)
endfunction

function! s:HTML2slimRailsExtract(name) range
  let content = getline(a:firstline, a:lastline)
  execute a:firstline.','.a:lastline.'delete_'
  let indent = get(sort(map(filter(copy(content), '!empty(v:val)'), 'len(matchstr(v:val, "^ \\+"))')), 0, 0)
  if indent
    call map(content, 's:sub(v:val, "^".repeat(" ", indent), "  ")')
  endif
  call append(a:firstline-1, repeat(' ', indent).'include '.rails#camelize(a:name))
  let out = rails#app().path(a:root, a:name . '.rb')
  silent %delete_
  call setline(1, ['module '.rails#camelize(a:name)] + a:before + content + ['end'])


  if filereadable(out) && !a:bang
    return s:error('E13: File exists (add ! to override)')
  endif
  if !isdirectory(fnamemodify(out, ':h'))
    call mkdir(fnamemodify(out, ':h'), 'p')
  endif
  execute 'split '.s:fnameescape(out)



  let b:rails_root = root
  let content = getline(a:firstline, a:lastline)

  ruby execute

  execute 'vnew'
  execute 'vertical resize ' . vertical_size
  set syntax=slim
  call setline(1, slim_content)
endfunction

ruby << EOF
# encoding: utf-8
require 'rubygems'
require 'html2slim'

def execute
content = VIM::evaluate "content"

slim = HTML2Slim.convert!(content.join, format = 'erb')
slim = slim.to_s.split("\n")

VIM::command("let slim_content = #{slim}")
VIM::command("let vertical_size = #{verticat_size(slim)}")
rescue
puts "Error with gem. Please install html2slim gem"
end

def verticat_size(slim)
max_string_size = 0
slim.dup.each { |str| max_string_size = str.size if str.size > max_string_size }

case max_string_size
when 1..25
25
when 26..75
max_string_size + 7
  else
    60
  end
end
EOF
