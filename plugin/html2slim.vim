" vim-html2slim - easy convert HTML(erb) to Slim
" Author:       Anton Davydov <http://davydovanton.github.io/>
" Version:      0.1


function! HTML2slim() range
  let content = getline(a:firstline, a:lastline)

  ruby execute

  execute 'vnew'
  set syntax=slim
  call setline(1, slim_content)
endfunction
command! -buffer -bar -bang -range HTML2slim :<line1>,<line2>call HTML2slim()

ruby << EOF
# encoding: utf-8
require 'rubygems'
require 'html2slim'

def execute
  content = VIM::evaluate "content"
  slim = HTML2Slim.convert!(content.join, format = 'erb')
  slim = slim.to_s.split("\n")
  VIM::command("let slim_content = #{slim}")
rescue
  puts "Error with gem. Please install html2slim gem"
end
EOF
