


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 2A
malig <- get(load("../zenodo_data/malig.Rda"))

###########
pdf(paste0(figures.dir, "Ext_Fig2A.pdf"), useDingbats = F, width = 10)
p = DimPlot(malig, group.by = "orig.identSec")
p
dev.off()
