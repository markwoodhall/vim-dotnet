if exists("current_compiler")
  finish
endif
let current_compiler = "msbuild-apk"

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
    silent echomsg 'Unable to find a .csproj file, either of which is required in order to call the `dotnet build` command.'
    finish
endif

let $buildPath =  projfiles[0]

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=msbuild-apk\ $buildPath
CompilerSet errorformat=\ %#%f(%l):\ %t%.%#:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
