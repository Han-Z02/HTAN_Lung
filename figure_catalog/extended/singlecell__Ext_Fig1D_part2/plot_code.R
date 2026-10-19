
comp.df1 = comp.df

############ Extended 1D right (CD8 and CD4)
comp.df <- as.matrix(table(unsorted$orig.identSec, unsorted$celltype_3))  ## has t cell annotations
comp.df  <- prop.table(comp.df , 1)

comp.df <- comp.df[sampleids.filt,]

############
p53_status <- p53.status.filt
comp.df <- cbind(comp.df, p53_status)
comp.df = as.data.frame(comp.df)
comp.df$p53_status <- factor(comp.df$p53_status, levels = c("WT", "p53_mut"))


subtypes <- colnames(comp.df)[-16]
for (i in 1:(ncol(comp.df)-1))
{
  comp.df[,i] = as.numeric(comp.df[,i])
}

############
mean.plots <- list()

for (subtype in c("CD4_T", "CD8_T")){
  mean.plot <- ggboxplot(comp.df, x = "p53_status", y = subtype, color = "p53_status",
                         palette = c("#0091CA", "#D8423D"), add = "jitter",
                         title = subtype) +
    stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(comp.df[,subtype]))) +
    theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
  mean.plots[[subtype]] <- mean.plot
}

pdf(paste0(figures.dir, "Fig1_overview/Ext_Fig1D_part2.pdf"), width = 3, height = 6, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots, ncol=1)
dev.off()
