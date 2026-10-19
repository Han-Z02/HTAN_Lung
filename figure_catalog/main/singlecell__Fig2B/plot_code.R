


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 2B
malig <- get(load("../zenodo_data/malig.Rda"))

genes <- c("SFTPA2", "SFTPA1", "SFTPC", "AKR1C1", "PTTG1", "CDKN3", "HIST1H4C", "PCNA", "CAPS", "CETN2", "PKM", "LDHA", "HLA-DRA", "HLA-DPA1", 'NDRG1',
           "SLC2A1", "ISG15", "IFI6", "HSPA1A", "JUN", "MT-ND5", "MT-ND6", "MT2A", "MT1X", "ATP5I", "SEPP1", "LAMC2", "VIM", "RPL32", "RPL29","LCN2", "SLPI", "S100A4", "KRT19", "NFKBIA", "CXCL2")

DefaultAssay(malig) <- "RNA"
malig <- NormalizeData(malig)
malig <- FindVariableFeatures(malig)
malig <- ScaleData(malig, features = unique(VariableFeatures(malig), genes))

#
Idents(malig)  <- "subtype"

malig.names<-c("AT2.like", "AT1.2.like", "CC.G2M", "CC.S", "Ciliated", 
                 "Glycolysis.Hypox", "MHCII", "Hypoxia", "IFNG", "StressResponse", 
                 "Respiration.MT", "Metallothionein", "OxPhos", "PEMT", "Ribosome", 
                 "Secretory", "Senescence", "TNFA.NFKB")

Idents(malig) <- factor(Idents(malig), levels = rev(malig.names)) 


###########
pdf(paste0(figures.dir, "Fig2B.pdf"), useDingbats = F, width = 14, height = 5)
p = DotPlot(object = malig, features = genes, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
  scale_colour_gradient2(low = "navy", high = "firebrick") +
  geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
p
dev.off()
