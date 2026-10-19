

#### F5G ####
all = get (load (file.path('../zenodo_data','all.merge.Rda')))

genes <- c("CXCR3", "CXCL11")

# all <- NormalizeData(all)

Idents(all) <- "celltype"
#Idents(all) = factor (Idents(all), levels = rev(c('Malignant','Nonmalig Epi','Endothelial','Mesenchymal','Pericyte','Mast','Bcell','Plasma','NK','Tcell','Myeloid')))
# Idents(all) <- "subtype"
pdf(file.path(figures.dir,'F5G.pdf'), useDingbats = F, width = 4, height = 4)
  dp = DotPlot(object = all, features = genes, scale = T) +
  theme(axis.text.x = element_text(angle = 45, hjust=1), panel.border = element_rect(colour = "black", fill=NA, size=0.5), panel.grid.major = element_line(colour = "gainsboro")) +
    scale_colour_gradient2(low = "navy", high = "firebrick") +
    geom_point(aes(size=pct.exp), shape = 21, colour="black", stroke=0.5)
    dp
dev.off()
