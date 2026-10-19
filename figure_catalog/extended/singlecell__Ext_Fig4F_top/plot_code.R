


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 4F_top
end <- get(load("../zenodo_data/end.final.nodoublets.Rda"))

genes <- c('PGF', 'FN1','ITGA9','TNFRSF10D','HAVCR2','COL6A2','TNFRSF10B','NAMPT','NRP2','ITGB1','BAG6','NRP1','NOTCH1','COPA','CD55','FLT1','PODXL',
           'ENTPD1','EFNA1','KDR','TGFBR3','ITGA2','PLXNA2','ITGA10','TNFRSF10A','EFNB2','EFNB1','LGALS9','CD46','NOTCH4','ACKR1')

DefaultAssay(end) <- "RNA"
end <- NormalizeData(end)
end <- FindVariableFeatures(end)
end <- ScaleData(end, features = unique(VariableFeatures(end), genes))

names<-c("VEC.Cycling", "VEC.IFN","Aerocyte", "VEC.COL4A1","Capillary", "Pulmonary.Venous", "Systemic.Venous", "Arterial", "Lymphatic")

Idents(end) <- 'subtype'
Idents(end) <- factor(Idents(end), levels = rev(names)) 

###########
pdf(paste0(figures.dir, "Ext_Fig4F_top.pdf"), useDingbats = F, width = 14, height = 5)
p = DotPlot(object = end, features = genes, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
  scale_colour_gradient2(low = "navy", high = "firebrick") +
  geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
p
dev.off()
