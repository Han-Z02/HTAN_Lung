


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 2H
maligv9.scores.df <- get(load(paste0(data.path, "Ext_Fig2H_modulescore.Rda")))

maligv9.scores.list <- split(maligv9.scores.df, f = maligv9.scores.df$sampleID)
maligv9.scores.list.avg <- lapply(maligv9.scores.list, function(x) {
  y <- colMeans(x[,2:ncol(x)])
  y
})
names(maligv9.scores.list.avg) <- names(maligv9.scores.list)

###
p53.filt.val = c("3", "4", "6", "RU661_TUMOR", "RU1057", "RU1061", "p023t")
WT.filt.val = c("RU1128","RU1137","RU1038","SSN05","SSN24","SSN27","p034t","p031t","p032t","p024t","p019t","p018t","RU684_TUMOR","RU653_TUMOR","RU676_TUMOR")

maligv9.scores.avg.rbind <- list.rbind(maligv9.scores.list.avg)
maligv9.scores.avg.rbind <- as.data.frame(maligv9.scores.avg.rbind)
maligv9.scores.avg.rbind <- maligv9.scores.avg.rbind[c(p53.filt.val, WT.filt.val),]

maligv9.scores.avg.rbind$p53_status <- c(rep("p53_mut", length(p53.filt.val)), rep("WT", length(WT.filt.val)))
maligv9.scores.avg.rbind$p53_status <- factor(maligv9.scores.avg.rbind$p53_status, levels = c("WT", "p53_mut"))

###
comp.df = maligv9.scores.avg.rbind
colnames(comp.df) = gsub("1$", "", colnames(comp.df))

subtypes <- colnames(comp.df)[-20]
for (i in 1:(ncol(comp.df)-1))
{
  comp.df[,i] = as.numeric(comp.df[,i])
}

## update subtype names
subtypes[1] = "AT2.like"
subtypes[2] = "AT1.2.like"
subtypes[7] = "MHCII"
subtypes[10] = "StressResponse"
subtypes[11] = "Respiration.MT"

colnames(comp.df)[-20] = subtypes

##
mean.plots <- list()

for (subtype in subtypes){
  mean.plot <- ggboxplot(comp.df, x = "p53_status", y = subtype, color = "p53_status",
                         palette = c("#0091CA", "#D8423D"), add = "jitter",
                         title = subtype) +
    stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(comp.df[,subtype]))) +
    theme(plot.title = element_text(size = 12, face = "bold")) + NoLegend()
  mean.plots[[subtype]] <- mean.plot
}

############
mean.plots.2 = list()
mean.plots.2[[1]] = mean.plots[[19]] ## tp53 targets
mean.plots.2[[2]] = mean.plots[[1]]   ## AT2.like
mean.plots.2[[3]] = mean.plots[[3]]   ## CC.G2M
mean.plots.2[[4]] = mean.plots[[6]]   ## Glyco.hypox
mean.plots.2[[5]] = mean.plots[[14]]   ## PEMT

# 
pdf(paste0(figures.dir, "Ext_Fig2H.pdf"), width = 12, height = 4, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots.2, ncol=5)
dev.off()
