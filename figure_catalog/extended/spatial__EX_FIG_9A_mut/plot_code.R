
mut_spatial_list <- spatial_list[1:4]

mut_patient.corr.list <- list()
for (i in 1:length(mut_spatial_list)) { # filtered - no BW16, etc.
  obj <- mut_spatial_list[[i]]@meta.data
  # change this for every cell type I'm looking at
  corr <- cor(obj[,c(14:24)], obj[,c(14:24)]) # 2v4 high lvl only
  mut_patient.corr.list[[i]] <- corr
}

avg.mtx <- Reduce("+", mut_patient.corr.list) / length(mut_patient.corr.list)

order <- c("Cancer", "Nonmalig", "Plasma", "Lymphoid", "Bcell", "Mesenchymal", "Pericyte", "Endothelial", "Mast", "Myeloid", "NK")
# avg corr all slides
range <- 0.3

pdf(file = paste0(figures.dir, "EX_FIG_9A_mut.pdf"), useDingbats = F, width = 4, height = 3.5)
pheatmap(avg.mtx[order,order], breaks = seq(-range, range, length.out = 100), cluster_cols = F, cluster_rows = F)
dev.off()