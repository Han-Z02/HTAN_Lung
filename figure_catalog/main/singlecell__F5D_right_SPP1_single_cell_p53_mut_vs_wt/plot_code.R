


#### F5D SPP1 proportion ####
p53 <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
WT <- c("14", "1174", "1176", "1183", "BW01", "BW04", "BW05", "BW09", "BW19", "BW23")
p53.filt <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
sampleids.filt <- c(WT, p53)


genes <- c("SPP1")
for (gene in genes) {

  # if gene, uncomment line below
#   df <- data.frame(sample = factor(broad$orig.identSec, levels = sampleids.filt), subtype = broad$subtype, value = broad[["RNA"]]@counts[gene,])
  df <- data.frame(
    sample = factor(myeloid$orig.identSec, levels = sampleids.filt), 
    subtype = myeloid$subtype,
    p53_status = ifelse (myeloid$orig.identSec %in% p53.filt, 'p53_mut','WT'),
    value = myeloid[["RNA"]]@counts[gene,])
  df = aggregate (df$value, by = list(sampleID= df$sample, subtype = df$subtype, p53_status = df$p53_status), mean)
  df$x = log10(df$x +1)

subtypes = unique (df$subtype)
  mean.plots <- list()
  print(head(df))
  for (subtype in subtypes) {
    mean.plot <- ggboxplot(df[df$subtype == subtype,], x = "p53_status", y = 'x', color = "p53_status",
                 palette = c("#0091CA", "#D8423D"), add = "jitter",
                 title = subtype) +
                 # ylim(-.5,.5) +
                 stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(df[df$subtype == subtype,'x']), na.rm = T), na.rm = T) +
                 # stat_compare_means(label.x = 0.9, label.y = max(module.scores[,module])*(9.0/10), method = "t.test") +
                 theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
    #ggsave(paste0(figures.dir.p53, "median.module.scores.v3.top20.png"), width = 6, height = 6, type="cairo")
    mean.plots[[subtype]] <- mean.plot
  }


  pdf(file.path(figures.dir,'F5D_right_SPP1_single_cell_p53_mut_vs_wt.pdf'), width = 15, height = 6, useDingbats=FALSE)

  print(cowplot::plot_grid(plotlist = mean.plots, ncol=6))
  dev.off()
