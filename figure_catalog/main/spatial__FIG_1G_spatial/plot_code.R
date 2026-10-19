data.path <- "./data/"
navin.dir <- paste0(data.path, "navin_annots_final/")
figures.dir <- "../../figures/"
system(paste0("mkdir -p ", figures.dir))

library(Seurat)
library(ggplot2)
library(ggpubr)

load(paste0(data.path, "spatial_list.Rda"))

obj <- spatial_list[[1]]

pdf(paste0(figures.dir, 'FIG_1G_spatial.pdf'), useDingbats = F, width = 10, height = 10)
SpatialFeaturePlot(obj, features=c("Cancer", "Mesenchymal", "Lymphoid", "Endothelial"), min.cutoff=0, max.cutoff=1)
dev.off()
