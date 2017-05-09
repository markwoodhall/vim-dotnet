if exists("current_compiler")
  finish
endif
let current_compiler = "rmsb"

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=rmsb
CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m

let &cpo = s:cpo_save
unlet s:cpo_save


