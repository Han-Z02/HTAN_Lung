data.path <- "./data/"
figures.dir <- "../../figures/"
system(paste0("mkdir -p ", figures.dir))

source(paste0(data.path, "/R_utils/plotutils.R"))
source(paste0(data.path, "/R_utils/seuratutils.R"))
source(paste0(data.path, "/R_utils/seuratutilsV3.R"))
source(paste0(data.path, "/R_utils/color.R"))

library(ggplot2)
library(ggpubr)
library(ComplexHeatmap)
library(gdata)
library(data.table)

load(paste0(data.path, "spatial_list.Rda"))

spatial_list <- spatial_list[c(1:4, 7:16)]

patient.corr.list <- list()
for (i in 1:length(spatial_list)) { # filtered - no BW16, etc.
  obj <- spatial_list[[i]]@meta.data
  # change this for every cell type I'm looking at
  corr <- cor(obj[,c(14:24)], obj[,c(14:24)]) # 2v4 high lvl only
  patient.corr.list[[i]] <- corr
}

avg.mtx <- Reduce("+", patient.corr.list) / length(patient.corr.list)

order <- c("Cancer", "Nonmalig", "Plasma", "Lymphoid", "Bcell", "Mesenchymal", "Pericyte", "Endothelial", "Mast", "Myeloid", "NK")
# avg corr all slides
range <- 0.3

pdf(file = paste0(figures.dir, "FIG_8A_mean.pdf"), useDingbats = F, width = 4, height = 3.5)
pheatmap(avg.mtx[order,order], breaks = seq(-range, range, length.out = 100), cluster_cols = F, cluster_rows = F)
dev.off()
