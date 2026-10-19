library(Seurat)
library(RColorBrewer)
library(ggplot2)
library(scales)
library(dplyr)
library(ggpubr)
library(tidyverse)
library(data.table)
library(pheatmap)

# my outputs
data.path <- "../data/"
figures.dir <- "../../figures/"


######
source(paste0(data.path, "/R_utils/plotutils.R"))
source(paste0(data.path, "/R_utils/seuratutils.R"))
source(paste0(data.path, "/R_utils/seuratutilsV3.R"))
source(paste0(data.path, "/R_utils/color.R"))

### Load data ####
tcell = get(load("../zenodo_data/tcell.final.nodoublets.Rda"))
load(file = file.path ('../zenodo_data', 'bcell.final.nodoublets.Rda')) # bplasma
tnk <- get(load(file.path('../zenodo_data','tnk.validation.Rda'))) # validation cohort



#### F6AB ####
pdf(paste0(figures.dir, "F6A.pdf"), useDingbats = F, width = 7, height = 7)
dp = DimPlot (tcell, group.by = 'subtype')
dp
dev.off()
