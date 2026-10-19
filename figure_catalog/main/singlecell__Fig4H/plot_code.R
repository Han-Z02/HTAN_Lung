


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 4H
mes <- get(load("../zenodo_data/mes.final.nodoublets.Rda"))

comp.df <- as.matrix(table(mes$orig.identSec, mes$subtype))
comp.df  <- prop.table(comp.df , 1)

comp.df <- comp.df[sampleids.filt,]

###
p53_status <- p53.status.filt
comp.df <- cbind(comp.df, p53_status)
comp.df = as.data.frame(comp.df)
comp.df$p53_status <- factor(comp.df$p53_status, levels = c("WT", "p53_mut"))

###
subtypes <- colnames(comp.df)[-14]
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

### 3H plots only
mean.plots.2 = list()
mean.plots.2[[1]] = mean.plots[[10]] ## Pericyte
mean.plots.2[[2]] = mean.plots[[1]]   ## CAF.ADH1B

pdf(paste0(figures.dir, "Fig4H.pdf"), width = 6, height = 3, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots.2, ncol=2)
dev.off()
