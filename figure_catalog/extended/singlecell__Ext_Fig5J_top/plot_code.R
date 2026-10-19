


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 5J_top
genes <- c("CCL2", "ITGA8", "ITGB1", "TGFBR2", "PTPRK", "COPA", "TNFRSF1A", "TGFB3", "VEGFB", "ITGA1", "NRP1", "ACVR1", "COL16A1", "NOTCH2", "FBN1", "PGF",
           "NOTCH3", "AXL", "FN1", "TNC", "ITGA5", "COL15A1", "NAMPT", "VEGFA", "PLAUR", "COL12A1")

mes <- get(load("../zenodo_data/mes.final.nodoublets.Rda"))
DefaultAssay(mes) <- "RNA"
mes <- NormalizeData(mes)
mes <- FindVariableFeatures(mes)
mes <- ScaleData(mes, features = unique(VariableFeatures(mes), genes))

names<-c("CAF.ADH1B","Myofibroblast","CAF.Ribo","Pericyte","Pericyte.EMT","SmoothMuscle.Vascular",
         "CAF.ISGs","CAF.Complement","CAF.Adventitial","SmoothMuscle.Airway","CAF.APOE","CAF.COLs","CAF.Cycling")

Idents(mes) <- 'subtype'
Idents(mes) <- factor(Idents(mes), levels = rev(names)) 

pdf(paste0(figures.dir, "Ext_Fig5J_top.pdf"), useDingbats = F, width = 14, height = 5)
p = DotPlot(object = mes, features = genes, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
  scale_colour_gradient2(low = "navy", high = "firebrick") +
  geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
p
dev.off()
