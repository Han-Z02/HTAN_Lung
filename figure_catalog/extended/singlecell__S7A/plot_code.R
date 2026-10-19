


#### S7A ####            

genes <- c(
  "IL7R", 
  "CCR7", 
  "S100A4", 
  "CD52", 
  "GZMK", 
  "EOMES",
  "ISG15", 
  "IFI6", 
  "ZNF683",
  "CD8B",
  "KLRC1",
  "AREG",
  "FGFBP2",
  "SPON2",
  "KLRC2",
  "STMN1", 
  "MKI67", 
  "LAG3", 
  "HAVCR2", 
  "HSPA1A", 
  "JUN", 
  "CXCL13", 
  "NR3C1", 
  "IL32", 
  "FOXP3")
#genes <- unique(markers$gene)

tcell = get(load("../zenodo_data/tcell.final.nodoublets.Rda"))
tcell <- FindVariableFeatures(tcell)
tcell <- ScaleData(tcell, features = unique(c(VariableFeatures(tcell), genes))) # add genes of interest to the heatmap

data <- tcell[,sample(colnames(tcell), 500)][["RNA"]]@data[genes,]
data <- as.matrix(data)

Idents(tcell) <- "subtype"
Idents(tcell) = factor (Idents(tcell), levels = rev (c('CD4.Naive.CM','CD4.TRM','CD8.GZMK','CD8.IFN','CD8.TRM','NK.CD56.bright','NK.CD56.dim','NKT','T.Cycling','T.Exhausted','TFH','T.Stress','Treg')))
dp = DotPlot(object = tcell, features = genes, scale = T, assay = "RNA") +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) + 
    scale_color_gradientn(colours = rev(brewer.pal(11,"Spectral"))) +
    geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)

pdf(file.path(figures.dir,"S7A.pdf"), useDingbats = F, width = 15, height = 6)
dp
dev.off()
