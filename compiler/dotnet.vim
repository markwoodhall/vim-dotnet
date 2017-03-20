
if exists("current_compiler")
  finish
endif
let current_compiler = "dotnet"

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=dotnet\ build\ /nologo\ /property:GenerateFullPaths=true
CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
