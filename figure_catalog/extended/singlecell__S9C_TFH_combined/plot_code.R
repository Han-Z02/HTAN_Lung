
#write.csv (do.call (cbind, lapply (mean.plots[c('T.Exhausted','TFH')], function(x) x$data)), file.path (projdir, 'S8_C.csv'))

comp.df = rbind (comp.df_disc[,c('p53_status','TFH')], comp.df[,c('p53_status','TFH')])
comp.df$p53_status[comp.df$p53_status == 'mut']= 'p53_mut'


subtype= 'TFH'
  mean.plot <- ggboxplot(comp.df, x = "p53_status", y = subtype, color = "p53_status",
               palette = c("#0091CA", "#D8423D"), add = "jitter",
               title = subtype) +
               # ylim(-.5,.5) +
               stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(comp.df[,subtype]))) +
               # stat_compare_means(label.x = 0.9, label.y = max(module.scores[,module])*(9.0/10), method = "t.test") +
               theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
  #ggsave(paste0(figures.dir.p53, "median.module.scores.v3.top20.png"), width = 6, height = 6, type="cairo")
  #mean.plots[[subtype]] <- mean.plot

        
pdf(file.path(figures.dir,'S9C_TFH_combined.pdf'), width = 3, height = 3.5)
mean.plot
dev.off()
