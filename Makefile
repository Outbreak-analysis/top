current: target
-include target.mk

##################################################################

## Screens

## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vmt"

######################################################################

## Directories

projdirs += start
start: 
	git clone https://github.com/Outbreak-analysis/startingPoints.git $@

projdirs += corona
corona: dir=rhdir/git_wzmli_corona

rprojdirs += Canada
Canada:
	git clone https://github.com/wzmli/COVID19-Canada.git $@

rprojdirs += Korea
Korea:
	git clone https://github.com/parksw3/Korea-analysis.git $@

projdirs += park
park:
	git clone https://github.com/parksw3/wuhan.git $@

projdirs += ccall
ccall:
	git clone https://github.com/cfshi/coronavirus.git $@

projdirs += sims
sims:
	git clone https://github.com/dushoff/Ebola_sims.git $@

projdirs += li_data
li_data:
	git clone https://github.com/wzmli/curate_coronadata.git $@

## Mike Li, sort-of-aborted forecasting thing; come back to it
rprojdirs += special
special:
	git clone https://github.com/Outbreak-analysis/ncov_cihr.git $@

## Manual project directories

rprojdirs += rabies_R0
rabies_R0:
	git clone https://github.com/wzmli/$@.git

rprojdirs += lunchbox
lunchbox:
	git clone https://github.com/wzmli/hybridx.git $@

Ignore += $(resourcedirs)
alldirs += $(resourcedirs)

######################################################################

## Resource repos

datarepos/JHU:
	$(MAKE) datarepos
	git clone https://github.com/CSSEGISandData/COVID-19.git $@

Ignore += datarepos
datarepos:
	$(mkdir)

######################################################################
### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/dirdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk
## -include makestuff/repohome.mk
