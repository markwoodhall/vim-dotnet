if exists("current_compiler")
  finish
endif
let current_compiler = "dotnet"

let filedir = expand('%:p:h')
let slnfiles = split(glob(filedir . '/*.sln'), '\n')
let search_for_sln = 1

while len(slnfiles) == 0 && search_for_sln
  let filedirparts = split(filedir, '/') 
  let search_for_sln = len(filedirparts) > 1
  let filedir = '/'.join(filedirparts[0:-2], '/')
  let slnfiles = split(glob(filedir . '/*.sln'), '\n')
endwhile

let projfiles = []

if len(slnfiles) == 0
  let filedir = expand('%:p:h')
  let projfiles = split(glob(filedir . '/*.csproj'), '\n')
  let search_for_csproj = 1

  while len(projfiles) == 0 && search_for_csproj
    let filedirparts = split(filedir, '/') 
    let search_for_csproj = len(filedirparts) > 1
    let filedir = '/'.join(filedirparts[0:-2], '/')
    let projfiles = split(glob(filedir . '/*.csproj'), '\n')
  endwhile

  if len(projfiles) == 0
      silent echomsg 'Unable to find a .sln or .csproj file, either of which is required in order to call the `dotnet build` command.'
      finish
  endif
endif

let $buildPath = len(slnfiles) > 0 ? slnfiles[0] : projfiles[0]

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=dotnet\ build\ $buildPath\ /nologo\ /property:GenerateFullPaths=true
CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m

let &cpo = s:cpo_save
unlet s:cpo_save


