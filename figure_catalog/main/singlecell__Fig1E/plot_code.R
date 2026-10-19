


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 1E
malig <- get(load("../zenodo_data/malig.Rda"))

maligv9.allsamples = malig

maligv9.scores.df <- maligv9.allsamples@meta.data[,c("orig.identSec", colnames(maligv9.allsamples@meta.data)[52:70])]

maligv9.scores.list <- split(maligv9.scores.df, f = maligv9.scores.df$orig.identSec)
maligv9.scores.list.avg <- lapply(maligv9.scores.list, function(x) {
  y <- colMeans(x[,2:ncol(x)])
  y
})
names(maligv9.scores.list.avg) <- names(maligv9.scores.list)

###
maligv9.scores.avg.rbind <- list.rbind(maligv9.scores.list.avg)
maligv9.scores.avg.rbind <- as.data.frame(maligv9.scores.avg.rbind)
maligv9.scores.avg.rbind <- maligv9.scores.avg.rbind[c(p53.filt, WT.filt),]

maligv9.scores.avg.rbind$p53_status <- p53.status.filt
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

### 1E plots only
mean.plots.2 = mean.plots[[19]] ## tp53 targets

pdf(paste0(figures.dir, "Fig1_overview/Fig1E.pdf"), width = 3, height = 4, useDingbats=FALSE)
mean.plots.2
dev.off()
