## This is outbreak, a screens container (the top directory of Outbreak-analysis)

current: target
-include target.mk

##################################################################

## Screens

projdirs += corona
## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vmt"

######################################################################

## Directories

corona: dir=rhdir/git_wzmli_corona

## Manual project directories

resourcedirs += rabies_R0
rabies_R0:
	git clone https://github.com/wzmli/$@.git

resourcedirs += lunchbox
lunchbox:
	git clone https://github.com/wzmli/hybridx.git $@

Ignore += $(resourcedirs)
alldirs += $(resourcedirs)

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk
-include makestuff/dirdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk
