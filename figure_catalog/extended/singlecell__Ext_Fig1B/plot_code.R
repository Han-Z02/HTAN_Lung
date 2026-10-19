
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 1B
all = get(load("../zenodo_data/all.merge.Rda"))

############
pdf(file = paste0(figures.dir, "Fig1_overview/Ext_Fig1B.pdf"), useDingbats = F, width = 8)
DimPlot(all, group.by = "orig.identSec")
dev.off()
