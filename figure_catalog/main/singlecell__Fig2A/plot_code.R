######################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
######################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ FIGURE 2+3 - EXTENDED DATA 2+3 - MALIGNANT PANELS
library(ggplot2)
library(Seurat)
library(SeuratObject)
library(dplyr)
library(Matrix)
library(RColorBrewer)
library(scales)
library(gplots)
library(ComplexHeatmap)
library(data.table)
library(pheatmap)
library(rlist)
library(ggpubr)
library(circlize)
library(readxl)

######
# filtered
p53.filt <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
WT.filt <- c("14", "1174", "1176", "1183", "BW01", "BW04", "BW05", "BW09", "BW19", "BW23") 

sampleids.filt <- c(p53.filt, WT.filt)
p53.status.filt <- c(rep("p53_mut", 8), rep("WT", 10))

other <- c("19", "1181", "1179", "1170", "17")
total.samples <- c(p53.filt, WT.filt, other)

# my outputs
data.path <- "../data/"
figures.dir <- "../../figures/"


######
source(paste0(data.path, "/R_utils/plotutils.R"))
source(paste0(data.path, "/R_utils/seuratutils.R"))
source(paste0(data.path, "/R_utils/seuratutilsV3.R"))
source(paste0(data.path, "/R_utils/color.R"))



#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 2A
malig <- get(load("../zenodo_data/malig.Rda"))

Idents(malig)  <- "subtype"
malig.names<-c("AT2.like", "AT1.2.like", "CC.G2M", "CC.S", "Ciliated", 
                 "Glycolysis.Hypox", "MHCII", "Hypoxia", "IFNG", "StressResponse", 
                 "Respiration.MT", "Metallothionein", "OxPhos", "PEMT", "Ribosome", 
                 "Secretory", "Senescence", "TNFA.NFKB")
Idents(malig) <- factor(Idents(malig), levels = malig.names)

###########
pdf(paste0(figures.dir, "Fig2A.pdf"), useDingbats = F, width = 10)
p = DimPlot(malig)
p
dev.off()
