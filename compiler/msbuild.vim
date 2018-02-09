if exists("current_compiler")
  finish
endif
let current_compiler = "msbuild"

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true
CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %t%.%#:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save


