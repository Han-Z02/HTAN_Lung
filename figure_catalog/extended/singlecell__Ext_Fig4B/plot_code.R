


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 4B
end <- get(load("../zenodo_data/end.final.nodoublets.Rda"))

genes <- c("HPGD", "EDNRB", "S100A4", "IGFBP3", "DKK2", "FBLN5", "FCN3", "CD36", "IL7R", "CCL21", "TFF3", "FABP4", "CPE", "C7", "CLU", "SPRY1", "ZNF385D",
           "OLFM1", "COL4A1", "PLVAP", "ESM1", "STMN1", "TOP2A", "MKI67", "ISG15", "CXCL10", "CXCL11")   

DefaultAssay(end) <- "RNA"
end <- NormalizeData(end)
end <- FindVariableFeatures(end)
end <- ScaleData(end, features = unique(VariableFeatures(end), genes))

names<-c("Aerocyte", "Arterial", "Capillary", "Lymphatic", "Pulmonary.Venous", "Systemic.Venous", "VEC.COL4A1", "VEC.Cycling", "VEC.IFN")

Idents(end) <- 'subtype'
Idents(end) <- factor(Idents(end), levels = rev(names)) 

###########
pdf(paste0(figures.dir, "Ext_Fig4B.pdf"), useDingbats = F, width = 14, height = 5)
p = DotPlot(object = end, features = genes, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
  scale_colour_gradient2(low = "navy", high = "firebrick") +
  geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
p
dev.off()
