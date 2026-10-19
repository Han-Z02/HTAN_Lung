


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3L
res = get(load(paste0(data.path, "ccat.df.malig.subset.Rda")))

#
subtype = unique(res$subtype)
res.ann = matrix(nrow=length(subtype), ncol = 2)
rownames(res.ann) = subtype
colnames(res.ann) = c("ccat.v", "subtype")

for (i in 1:length(subtype))
{
  tmp = res[which(res$subtype == subtype[i]),]
  res.ann[i,1] = mean(tmp[,1])
  res.ann[i,2] = subtype[i]  
}

dat = as.numeric(res.ann[,1])
dat.plot = matrix(dat, ncol = 1)
rownames(dat.plot) = rownames(res.ann)

#############
pdf(paste0(figures.dir, "Fig3L.pdf"), width = 3, height = 4)
p<-Heatmap(dat.plot, cluster_rows = T, cluster_columns = F)
p
dev.off()
