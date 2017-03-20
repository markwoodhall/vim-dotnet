if exists("current_compiler")
  finish
endif
let current_compiler = "dotnettest"

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=dotnet\ test
CompilerSet errorformat=%.%#\ at\ %m\ in\ %f:line\ %l

let &cpo = s:cpo_save
unlet s:cpo_save
