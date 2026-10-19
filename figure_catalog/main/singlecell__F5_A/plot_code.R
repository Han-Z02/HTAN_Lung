library(Seurat)
library(RColorBrewer)
library(ggplot2)
library(scales)
library(ggpubr)
library(dplyr)
library(Matrix)
library(SeuratObject)
library(gplots)
library(ComplexHeatmap)
library(data.table)
library(pheatmap)
library(rlist)
library(circlize)
library(readxl)
library(tidyverse)

# my outputs
data.path <- "../data/"
figures.dir <- "../../figures/"


######
source(paste0(data.path, "/R_utils/plotutils.R"))
source(paste0(data.path, "/R_utils/seuratutils.R"))
source(paste0(data.path, "/R_utils/seuratutilsV3.R"))
source(paste0(data.path, "/R_utils/color.R"))

myeloid = get(load("../zenodo_data/myeloid.final.nodoublets.Rda"))
###

# Set sample groups
p53.filt <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
WT.filt <- c("14", "1174", "1176", "1183", "BW01", "BW04", "BW05", "BW09", "BW19", "BW23") 

sampleids.filt <- c(p53.filt, WT.filt)
p53.status.filt <- c(rep("p53_mut", 8), rep("WT", 10))

other <- c("19", "1181", "1179", "1170", "17")
total.samples <- c(p53.filt, WT.filt, other)


#### F5A ####
pdf(paste0(figures.dir, "F5_A.pdf"), useDingbats = F, width = 8)
DimPlot(myeloid, group.by = "subtype")
dev.off()
