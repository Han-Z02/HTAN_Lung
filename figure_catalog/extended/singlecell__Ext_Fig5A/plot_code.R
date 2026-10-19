



#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
########## Extended 5A
mes <- get(load("../zenodo_data/mes.final.nodoublets.Rda"))

genes <- c("PTGDS", "ADH1B", "RGCC", "TIMP1", "RGS2", "APOE", "CCDC80", "C7", "C3", "COL1A2", "COL3A1", "COL1A1", "TMEM176B", "TMEM176A", "CYP1B1", "TUBA1B", "STMN1",
           "MKI67", "ISG15", "IL32", "IFI6", "RPS19", "RPS17", "RPS4Y1", "ELN", "MT1X", "ACTG2", "HIGD1B", "COX4I2", "PTN", "COL18A1", "PLXDC1", "KCNJ8", "TAGLN", "DSTN",
           "MYH11", "ACTA2", "ID4", "FILIP1L")

DefaultAssay(mes) <- "RNA"
mes <- NormalizeData(mes)
mes <- FindVariableFeatures(mes)
mes <- ScaleData(mes, features = unique(VariableFeatures(mes), genes))

names<-c("CAF.ADH1B","CAF.APOE","CAF.Adventitial","CAF.COLs","CAF.Complement","CAF.Cycling","CAF.ISGs",
         "CAF.Ribo","Myofibroblast","Pericyte","Pericyte.EMT","SmoothMuscle.Airway","SmoothMuscle.Vascular")

Idents(mes) <- 'subtype'
Idents(mes) <- factor(Idents(mes), levels = rev(names)) 

pdf(paste0(figures.dir, "Ext_Fig5A.pdf"), useDingbats = F, width = 14, height = 5)
p = DotPlot(object = mes, features = genes, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
  scale_colour_gradient2(low = "navy", high = "firebrick") +
  geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
p
dev.off()
