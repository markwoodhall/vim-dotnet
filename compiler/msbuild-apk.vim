if exists("current_compiler")
  finish
endif
let current_compiler = "msbuild-apk"

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=msbuild-apk
CompilerSet errorformat=\ %#%f(%l):\ %t%.%#:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save


