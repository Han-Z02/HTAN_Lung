
annots_BW11C<-read.csv(paste0(navin.dir, "BW11.C_new.csv"), header = T, fill = T)
rownames(annots_BW11C) <- annots_BW11C[,1]
annots_BW11C[,1] <- NULL
colnames(annots_BW11C) <- c("annots")
obj$navin_annots <- annots_BW11C$annots
obj$navin_annots_2 <- obj$navin_annots
obj$navin_annots_2[obj$navin_annots_2 == 'Adenocarcinoma_lepidic'] = 'Malignant'
obj$navin_annots_2[obj$navin_annots_2 == 'Smooth muscle' | obj$navin_annots_2 == 'Endothelial cell' | obj$navin_annots_2 == 'Fibroblasts'] = 'Stromal'
obj$navin_annots_2[obj$navin_annots_2 == 'Immune cells_lymphocytes'] = 'Immune'

pdf(paste0(figures.dir, 'FIG_1G_spatial_patho.pdf'), useDingbats = F, width = 10, height = 10)
SpatialDimPlot(obj, group.by='navin_annots_2', cols=c('white', 'blue', 'red', 'green'))
dev.off()
