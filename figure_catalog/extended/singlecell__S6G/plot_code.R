

#### S6G ####
gene = 'SPP1'
gene_cor = cor (t(as.matrix(myeloid@assays$RNA@counts[gene,, drop=F])), as.matrix(t(myeloid@assays$RNA@counts)))
gene_cor = as.data.frame (t(gene_cor))
top_cor_genes = head (gene_cor[order (-gene_cor[,1]),, drop=F],16)
top_cor_genes = top_cor_genes[rownames(top_cor_genes) != gene,,drop=F]
top_cor_genes$gene = factor (rownames(top_cor_genes), levels = rev(rownames(top_cor_genes)))
bp = ggplot (top_cor_genes, aes (x = SPP1, y = gene)) + geom_bar(stat = 'identity') + theme_classic()

pdf (file.path (figures.dir, 'S6G.pdf'))
bp
dev.off()
