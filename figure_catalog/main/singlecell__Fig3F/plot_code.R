


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3F
maligv9.scores.df <- get(load(paste0(data.path, "addmodulescore.maligprog.A549celllines.Rda")))  

############ tp53
my_color_palette <- c("#0091CA", "#8DCEE7", "#F2C0BE", "#EBA09E", "#E1716D", "#C63C37", "#A2312D", "#7E2623", "#6C211E") # p53 impact
my_comparisons <- list( c("WT TP53", "WT-like TP53"), c("WT TP53", "Impactful I TP53"), c("WT TP53", "Impactful II TP53"),
                        c("WT TP53", "R280K TP53 I"), c("WT TP53", "R158L TP53 II"), c("WT TP53", "H179R TP53 II"), c("WT TP53", "Y205C TP53 II"),
                        c("WT TP53", "S241F TP53 II"))

maligv9.scores.df.subset = maligv9.scores.df[grep("_tp53", rownames(maligv9.scores.df)),]
maligv9.scores.df.subset = maligv9.scores.df.subset[which(maligv9.scores.df.subset$impact != "na"),]


comp.df = maligv9.scores.df.subset
colnames(comp.df) = gsub("1$", "", colnames(comp.df))

subtypes <- colnames(comp.df)[-20]
for (i in 1:(ncol(comp.df)-1))
{
  comp.df[,i] = as.numeric(comp.df[,i])
}

comp.df$impact = factor(comp.df$impact, levels = c("WT TP53", "WT-like TP53", "Impactful I TP53", "Impactful II TP53", "R280K TP53 I", "R158L TP53 II",
                                                   "H179R TP53 II", "Y205C TP53 II", "S241F TP53 II"))

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
mean.plots.2[[2]] = mean.plots[[1]]   ## AT.SFTPA2.1
mean.plots.2[[3]] = mean.plots[[3]]   ## CC.G2M
mean.plots.2[[4]] = mean.plots[[6]]   ## Glyco.hypox
mean.plots.2[[5]] = mean.plots[[14]]   ## PEMT

# 
pdf(paste0(figures.dir, "Fig3F.pdf"), width = 22, height = 5, useDingbats=FALSE)
cowplot::plot_grid(plotlist = mean.plots.2, ncol=5)
dev.off()
