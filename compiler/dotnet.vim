if exists("current_compiler")
  finish
endif
let current_compiler = "dotnet"

let filedir = expand('%:.:h')
let slnfiles = split(glob(filedir . '/*.sln'), '\n')
let search_for_sln = 1

while len(slnfiles) == 0 && search_for_sln
  let filedirparts = split(filedir, '/') 
  let search_for_sln = len(filedir) > 0
  let filedir = filedirparts[0]
  let slnfiles = split(glob(filedir . '/*.sln'), '\n')
endwhile

let $slnPath = slnfiles[0]

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=dotnet\ build\ $slnPath\ /nologo\ /property:GenerateFullPaths=true
CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m

let &cpo = s:cpo_save
unlet s:cpo_save


