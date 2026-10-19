


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 3A
maligv9.scores.df <- get(load(paste0(data.path, "addmodulescore.maligprog.A549celllines.Rda")))  

############ kras
my_color_palette <- c("#0091CA", "#8DCEE7", "#9E9AC8", "#756BB1", "#54278F", "#3F007D") # kras impact

my_comparisons <- list( c("WT KRAS", "WT-like KRAS"), c("WT KRAS", "Impactful I KRAS"), c("WT KRAS", "Impactful II KRAS"),
                        c("WT KRAS", "Impactful III KRAS"), c("WT KRAS", "Impactful IV KRAS"))

maligv9.scores.df.subset = maligv9.scores.df[grep("_kras", rownames(maligv9.scores.df)),]
maligv9.scores.df.subset = maligv9.scores.df.subset[which(maligv9.scores.df.subset$impact %in% c("WT KRAS", "WT-like KRAS", "Impactful I KRAS", "Impactful II KRAS", "Impactful III KRAS", "Impactful IV KRAS")),]

comp.df = maligv9.scores.df.subset
colnames(comp.df) = gsub("1$", "", colnames(comp.df))

subtypes <- colnames(comp.df)[-20]
for (i in 1:(ncol(comp.df)-1))
{
  comp.df[,i] = as.numeric(comp.df[,i])
}

comp.df$impact = factor(comp.df$impact, levels = c("WT KRAS", "WT-like KRAS", "Impactful I KRAS", "Impactful II KRAS", "Impactful III KRAS", "Impactful IV KRAS"))

## update subtype names
c("AT.SFTPA2.1", "AT.SFTPC", "CC.G2M", "CC.S", "Ciliated", "Glycolysis.Hypox", 
  "HLA.D.AT2", "Hypoxia", "IFNG", "JUN.FOS", "MT.respiration", 
  "Metallothionein", "OxPhos", "PEMT", "Ribosome", "Secretory", 
  "Senescence", "TNFA.NFKB", "p53_targets")
subtypes[1] = "AT2.like"
subtypes[2] = "AT1.2.like"
subtypes[7] = "MHCII"
subtypes[10] = "StressResponse"
subtypes[11] = "Respiration.MT"

colnames(comp.df)[-20] = subtypes

###
mean.plots <- list()

for (subtype in subtypes){
  mean.plot <- ggviolin(comp.df, x = "impact", y = subtype, color = "black", fill = "impact",
                        title = subtype, palette = my_color_palette,
                        add = "boxplot", add.params = list(fill = "white"))+
    rotate_x_text(angle = 45) + NoLegend() +
  stat_compare_means(comparisons = my_comparisons)
  mean.plots[[subtype]] <- mean.plot
}

###
mean.plots.2 = list()
mean.plots.2[[1]] = mean.plots[[19]] ## tp53 targets
mean.plots.2[[2]] = mean.plots[[1]]   ## AT2.like
mean.plots.2[[3]] = mean.plots[[3]]   ## CC.G2M

###
pdf(paste0(figures.dir, "Ext_Fig3A.pdf"), width = 12, height = 5, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots.2, ncol=3)
dev.off()
