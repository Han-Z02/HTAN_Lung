#ggsave(file.path(figures.dir, "F6A.png"), width = 7, height = 7)



colors <- material.heat(11)
colors <- jet.colors(100)
colors<-c("#191970","#121285","#0C0C9A","#0707B0","#0101C5","#0014CF","#0033D3","#0053D8","#0072DD","#0092E1","#00B2E6",
            "#00D1EB","#23E8CD","#7AF17B","#D2FA29","#FFEB00","#FFC300","#FF9B00","#FF8400","#FF7800","#FF6B00","#FF5F00","#FF5300",
            "#FF4700","#F73B00","#EF2E00","#E62300","#DD1700","#D50B00","#CD0000") # Carolyn Porter's color palette


pal <- gradient_n_pal(rev(c("#D53E4F", "#FC8D59", "#FEE08B", "#3288BD", "#0060a4")))
genes <- c("CD8A", "CD4", "MKI67", "GNLY", "FOXP3", "HAVCR2", "CTLA4", "PDCD1", "TIGIT")
data <- tcell[,sample(colnames(tcell), 500)][["RNA"]]@data[genes,]
data <- as.matrix(data)

data <- as.matrix(tcell[["RNA"]]@data[genes,])

p <- FeaturePlot(tcell, features = c("CD8A", "CD4", "MKI67", "GNLY", "FOXP3", "HAVCR2", "CTLA4", "PDCD1", "TIGIT"), combine = FALSE, pt.size = 0.001)
# custom_color_scale <- scale_color_gradientn(colours = colors, limits = c(0,4))

custom_color_scale <- scale_color_gradientn(
    colours = pal(c(0, rescale(seq_along(data)), 1)), # <- extra 0, 1 for out-of-bounds
    limits = c(0, 6), breaks = 0:6,
    na.value = "#9E0142",
    values = c(0,rescale(seq_along(data)),1) # <- extra 0, 1 again # also try changing to 7
) ### what is different about this?

p <- lapply(p, function (x) x + custom_color_scale)
for(i in 1:length(p)) {p[[i]] <- p[[i]] + NoLegend() + NoAxes()}

pdf(paste0(figures.dir, "F6B.pdf"), useDingbats = F, width = 15, height = 15)
cowplot::plot_grid(plotlist = p, ncol=3)
dev.off()
