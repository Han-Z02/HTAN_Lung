


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 4B
end <- get(load("../zenodo_data/end.final.nodoublets.Rda"))

comp.df <- as.matrix(table(end$orig.identSec, end$subtype))
comp.df  <- prop.table(comp.df , 1)

comp.df <- comp.df[sampleids.filt,]

###
p53_status <- p53.status.filt
comp.df <- cbind(comp.df, p53_status)
comp.df = as.data.frame(comp.df)
comp.df$p53_status <- factor(comp.df$p53_status, levels = c("WT", "p53_mut"))

###
subtypes <- colnames(comp.df)[-10]
for (i in 1:(ncol(comp.df)-1))
{
  comp.df[,i] = as.numeric(comp.df[,i])
}

### all plots
mean.plots <- list()

for (subtype in subtypes){
  mean.plot <- ggboxplot(comp.df, x = "p53_status", y = subtype, color = "p53_status",
                         palette = c("#0091CA", "#D8423D"), add = "jitter",
                         title = subtype) +
    stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(comp.df[,subtype]))) +
    theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
  mean.plots[[subtype]] <- mean.plot
}

### 3B plots only
mean.plots.2 = list()
mean.plots.2[[1]] = mean.plots[[1]] ## Aerocyte
mean.plots.2[[2]] = mean.plots[[2]]   ## Arterial

pdf(paste0(figures.dir, "Fig4B.pdf"), width = 6, height = 3, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots.2, ncol=2)
dev.off()
