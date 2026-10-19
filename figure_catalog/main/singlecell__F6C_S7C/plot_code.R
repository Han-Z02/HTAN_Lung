#ggsave(file.path(figures.dir, "F6B.png"), width = 15, height = 15)



#### F6C_S7C ####
p53 <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
WT <- c("14", "1174", "1176", "1183", "BW01", "BW04", "BW05", "BW09", "BW19", "BW23")
p53.filt <- c("1172", "1173", "1175", "1182", "BW16", "BW11", "BW14", "BW06")
WT.filt <- c("14", "1174", "1176", "1183", "BW01", "BW04", "BW05", "BW09", "BW19", "BW23") # no 1170

comp.df_disc <- as.matrix(table(tcell$orig.identSec, tcell$subtype))
p53.status.filt <- c(rep("WT", 10), rep("p53_mut", 8))# no 1170
comp.df_disc <- comp.df_disc[c(WT.filt, p53.filt), ]
comp.df_disc  <- prop.table(comp.df_disc , 1)
comp.df_disc <- as.data.frame.matrix(comp.df_disc)
comp.df_disc$p53_status <- p53.status.filt
comp.df_disc$p53_status <- factor(comp.df_disc$p53_status, levels = c("WT", "p53_mut"))

subtypes <- colnames(comp.df_disc)


mean.plots <- list()

for (subtype in subtypes){
  mean.plot <- ggboxplot(comp.df_disc, x = "p53_status", y = subtype, color = "p53_status",
               palette = c("#0091CA", "#D8423D"), add = "jitter",
               title = subtype) +
               # ylim(-.5,.5) +
               stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(comp.df_disc[,subtype]))) +
               # stat_compare_means(label.x = 0.9, label.y = max(module.scores[,module])*(9.0/10), method = "t.test") +
               theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
  #ggsave(paste0(figures.dir.p53, "median.module.scores.v3.top20.png"), width = 6, height = 6, type="cairo")
  mean.plots[[subtype]] <- mean.plot
}

            
pdf(file.path(figures.dir,'F6C_S7C.pdf'), width = 18, height = 7.5, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots, ncol=8)
dev.off()
