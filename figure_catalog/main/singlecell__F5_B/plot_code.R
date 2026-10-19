


#### F5B ####            
pal <- gradient_n_pal(brewer_pal(palette = "Spectral", direction = -1)(7))
genes <- c("RETN", "AZU1", "S100A12", "LILRB2", "CLEC9A", "FCER1A", "LAMP3", "MKI67", "APOE", "CXCL10", "CCL4", "FABP4", "FOLR2", "SPP1", "TREM2","LILRA4","TPSB2")

data <- myeloid[,sample(colnames(myeloid), 500)][["RNA"]]@data[genes,]
data <- as.matrix (data)

DefaultAssay (myeloid) = 'RNA'
p <- FeaturePlot(myeloid, features = genes, combine = FALSE, pt.size = 0.01)

custom_color_scale <- scale_color_gradientn(
    colours = pal(c(0, rescale(seq_along(data)), 1)), # <- extra 0, 1 for out-of-bounds
    limits = c(0, 4), breaks = 0:4,
    na.value = "#9E0142",
    values = c(0,rescale(seq_along(data)),1) # <- extra 0, 1 again # also try changing to 7
) ### what is different about this?

p <- lapply(p, function (x) x + custom_color_scale)
for(i in 1:length(p)) {p[[i]] <- p[[i]] + NoLegend() + NoAxes()}

pdf(paste0(figures.dir, "F5_B.pdf"), useDingbats = F, width = 14, height = 7)
cowplot::plot_grid(plotlist = p, ncol=6)
dev.off()
