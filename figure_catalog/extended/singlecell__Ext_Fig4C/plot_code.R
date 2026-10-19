


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 4C
end <- get(load("../zenodo_data/end.final.nodoublets.Rda"))

DefaultAssay(end) <- "RNA"
end <- NormalizeData(end)

###
pal <- gradient_n_pal(brewer_pal(palette = "Spectral", direction = -1)(7))

genes <- c("PECAM1", "ACKR1", "GJA5", "PLVAP", "CCL21", "MKI67", "EDNRB", "CA4", "COL4A1")

set.seed(1)
data <- end[,sample(colnames(end), 500)][["RNA"]]@data[genes,]
data <- as.matrix(data)

p <- FeaturePlot(end, features = genes, combine = FALSE, pt.size = 0.01)

custom_color_scale <- scale_color_gradientn(
  colours = pal(c(0, rescale(seq_along(data)), 1)), 
  limits = c(0, 4), breaks = 0:4,
  na.value = "#9E0142",
  values = c(0,rescale(seq_along(data)),1) 
) 

p <- lapply(p, function (x) x + custom_color_scale)
for(i in 1:length(p)) {p[[i]] <- p[[i]] + NoAxes()}

pdf(paste0(figures.dir, "Ext_Fig4C.pdf"), width = 15, height = 10, useDingbats = F)
cowplot::plot_grid(plotlist = p, ncol=3)
dev.off()
