
comp.df2 = comp.df



#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended 1A
info = read.csv(paste0(data.path, "CNV_corr.csv"))   
rownames(info) = info[,1]
info = info[,-1]

############
pdf(paste0(figures.dir,"Fig1_overview/Ext_Fig1A.pdf"), width = 8, height = 8, useDingbats=F)
p<-pheatmap(info, cluster_rows = F, cluster_cols = F,
            breaks = seq(min(info), max(info), length.out = 100))
p
dev.off()
