

############ Extended 1D left
mean.plots.2 = list()
mean.plots.2[[1]] = mean.plots[[1]] 
mean.plots.2[[2]] = mean.plots[[2]]   
mean.plots.2[[3]] = mean.plots[[5]] 
mean.plots.2[[4]] = mean.plots[[6]] 
mean.plots.2[[5]] = mean.plots[[7]] 
mean.plots.2[[6]] = mean.plots[[8]] 
mean.plots.2[[7]] = mean.plots[[12]] 
mean.plots.2[[8]] = mean.plots[[13]] 

pdf(paste0(figures.dir, "Fig1_overview/Ext_Fig1D.pdf"), width = 12, height = 6, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots.2, ncol=4)
dev.off()
