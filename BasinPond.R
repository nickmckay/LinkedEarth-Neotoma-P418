library(neotoma)
site <- get_site("Basin Pond")
L = neotoma2Lipd(site = site)

#estimate uncertainty from range
L$chronData[[2]]$measurementTable[[1]] = estimateUncertaintyFromRange(L$chronData[[2]]$measurementTable[[1]])

#
detach(geojson)
detach("package:geojson", character.only = TRUE) #avoid conflict with plotting
L = runBacon(L)


plotChron(L,chron.number = 2,model.num = 2,)


length(L$paleoData[[1]]$measurementTable[[1]]$depth$values)

L2 <- readLipd("http://wiki.linked.earth/wiki/index.php/Special:WTLiPD?op=export&lipdid=NAm-BasinPond.Gajewski.1988")
length(L2$paleoData[[1]]$measurementTable[[1]]$temperature$values)

L$paleoData[[1]]$measurementTable[[1]]$temperature <- L2$paleoData[[1]]$measurementTable[[1]]$temperature


L <- mapAgeEnsembleToPaleoData(L = L,which.chron = 2,which.paleo = 1,which.model = 2,which.ens = 1,which.pmt = 1)
