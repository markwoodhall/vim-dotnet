if exists("current_compiler")
  finish
endif
let current_compiler = "nunit"

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=nunit
CompilerSet errorformat=%m\ in\ %f:line\ %l

let &cpo = s:cpo_save
unlet s:cpo_save
