


#### S7E_left ####      
genes <- c(
  "CXCL13", 
  "KLRB1", 
  "KLRC1", 
  "ITGB2", 
  "TGFB1", 
  "CTLA4",
  "IFNG", 
  "CXCR3", 
  "TNF",
  "ITGAL",
  "ADGRE5",
  "CD96",
  "CD47",
  "CLEC2D",
  "CD44",
  "SELL", 
  "LAMP1", 
  "TNFRSF14", 
  "TIGIT", 
  "HAVCR2", 
  "PDCD1")
#genes <- unique(markers$gene)

tcell = get(load("../zenodo_data/tcell.final.nodoublets.Rda"))
tcell <- FindVariableFeatures(tcell)
tcell <- ScaleData(tcell, features = unique(c(VariableFeatures(tcell), genes))) # add genes of interest to the heatmap

data <- tcell[,sample(colnames(tcell), 500)][["RNA"]]@data[genes,]
data <- as.matrix(data)
Idents(tcell) = tcell$subtype
Idents(tcell) = factor (Idents(tcell), levels = rev (c('NK.CD56.dim','NK.CD56.bright','T.Stress','CD4.Naive.CM','CD8.GZMK','T.Cycling','T.Exhausted','Treg','TFH','NKT','CD8.TRM','CD8.IFN','CD4.TRM')))
   
pdf(file.path(figures.dir,"S7E_left.pdf"), useDingbats = F, width = 10, height = 5)
 dp = DotPlot(object = tcell, features = genes, scale = T, assay = "RNA") +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
    scale_color_gradientn(colours = rev(brewer.pal(11,"Spectral"))) +
    geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
    dp
dev.off()
