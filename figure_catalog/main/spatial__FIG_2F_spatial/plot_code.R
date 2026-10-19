data.path <- "./data/"
figures.dir <- "../../figures/"
system(paste0("mkdir -p ", figures.dir))

library(Seurat)
library(ggplot2)
library(ggpubr)

load(paste0(data.path, "spatial_list.Rda"))

spatial_list <- spatial_list[c(1:4, 7:16)]

obj <- spatial_list[[1]]

pdf(paste0(figures.dir, 'FIG_2F_spatial.pdf'), useDingbats = F, width = 10, height = 10)
SpatialFeaturePlot(obj, features=c("Glycolysis.Hypox", "CC.G2M", "Hypoxia", "pEMT"), min.cutoff=0, max.cutoff=0.25)
dev.off()
