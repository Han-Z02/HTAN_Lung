######################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
######################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ FIGURE 1 - EXTENDED DATA 1 - OVERALL PANELS
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

if (!file.exists(paste0(figures.dir,'Fig1_overview/'))){dir.create(paste0(figures.dir,'Fig1_overview/'), recursive=TRUE)}

######
source(paste0(data.path, "/R_utils/plotutils.R"))
source(paste0(data.path, "/R_utils/seuratutils.R"))
source(paste0(data.path, "/R_utils/seuratutilsV3.R"))
source(paste0(data.path, "/R_utils/color.R"))



#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 1C

##########
# load all obj
all = get(load("../zenodo_data/all.merge.Rda"))

# celltype_2: rename celltype
all$celltype_2 = all$celltype
all$celltype_2[which(all$celltype == "Cancer")] = "Malignant"
all$celltype_2[which(all$celltype == "Nonmalig")] = "Nonmalig Epi"
all$celltype_2[which(all$subtype == "Lymphatic")] = "Lymphatic"
all$celltype_2[which(all$subtype %in% c("CAF.ADH1B", "Myofibroblast", "CAF.Complement", 
                                        "CAF.COL", "CAF.Ribo", "CAF.Adventitial", 
                                        "CAF.APOE.IGFBP", "CAF.ISG", "CAF.Cycling"))] = "CAF"
all$celltype_2[which(all$subtype %in% c("Pericyte.EMT", "SmoothMuscle.Airway", "SmoothMuscle.Vascular"))] = "SmoothMuscle"

#
genes <- c("EPCAM", "KRT19", "KRT8", "SLPI", "FXYD3", "CYB5A", "LYZ", "TYROBP", "FCER1G", "TRAC", "CD3D", 
           "IL32", "GNLY", "NKG7", "GZMB", "VWF", "CLDN5", "PECAM1", "CCL21", "FABP4", "TFF3", 
           "LUM", "COL3A1", "COL1A1", "ACTA2", "TAGLN", "MYH11", "HIGD1B", "COX4I2", "PTN", 
           "CD79A", "MS4A1", "CD79B", "IGLC2", "IGKC", "IGHA1", "TPSB2", "TPSAB1", "CPA3")

all <- NormalizeData(all)
all <- FindVariableFeatures(all)
all <- ScaleData(all, features = unique(c(VariableFeatures(all), genes))) 


Idents(all) <- "celltype_2"
Idents(all) <- factor(Idents(all), levels = rev(c("Malignant", "Nonmalig Epi", "Myeloid", "Tcell", "NK", "Endothelial", "Lymphatic",
                                                  "CAF", "SmoothMuscle", "Pericyte", "Bcell", "Plasma", "Mast")))

#
set.seed(1)
data <- all[,sample(colnames(all), 500)][["RNA"]]@data[genes,]
data <- as.matrix(data)

pal <- gradient_n_pal(brewer_pal(palette = "Spectral", direction = -1)(7))

custom_color_scale <- scale_color_gradientn(
  colours = pal(c(0, rescale(seq_along(data)), 1)), 
  limits = c(0, 4), breaks = 0:4,
  na.value = "#9E0142",
  values = c(0,rescale(seq_along(data)),1) 
)


############ figure 1C
pdf(paste0(figures.dir, "Fig1_overview/Fig1C.pdf"), useDingbats = F, width = 12, height = 4)
p = DotPlot(object = all, features = genes, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
  scale_colour_gradient2(low = "navy", high = "firebrick") +
  geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
p
dev.off()
