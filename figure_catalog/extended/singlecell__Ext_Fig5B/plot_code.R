


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 5B
mes <- get(load("../zenodo_data/mes.final.nodoublets.Rda"))

DefaultAssay(mes) <- "RNA"
mes <- NormalizeData(mes)

##
pal <- gradient_n_pal(brewer_pal(palette = "Spectral", direction = -1)(7))

genes <- c("COL1A1", "MYH11", "COX4I2", "PTN", "ISG15", "MKI67", "ADH1B", "FGFR4", "SCX", "PI16", "IGFBP6", "TNFSF13B")

set.seed(1)
data <- mes[,sample(colnames(mes), 500)][["RNA"]]@data[genes,]
data <- as.matrix(data)

p <- FeaturePlot(mes, features = genes, combine = FALSE, pt.size = 0.01)

custom_color_scale <- scale_color_gradientn(
  colours = pal(c(0, rescale(seq_along(data)), 1)), 
  limits = c(0, 4), breaks = 0:4,
  na.value = "#9E0142",
  values = c(0,rescale(seq_along(data)),1) 
) 

p <- lapply(p, function (x) x + custom_color_scale)
for(i in 1:length(p)) {p[[i]] <- p[[i]] + NoAxes()}

pdf(paste0(figures.dir, "Ext_Fig5B.pdf"), width = 15, height = 10, useDingbats = F)
cowplot::plot_grid(plotlist = p, ncol=4)
dev.off()
