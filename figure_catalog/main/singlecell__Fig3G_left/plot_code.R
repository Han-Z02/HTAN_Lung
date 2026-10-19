


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3G (left-programs)
maligv9.scores.df <- get(load(paste0(data.path, "addmodulescore.maligprog.KPmouse.smartseq.Rda")))

comp.df = maligv9.scores.df
colnames(comp.df) = gsub("1$", "", colnames(comp.df))

subtypes <- colnames(comp.df)[-20]
for (i in 1:(ncol(comp.df)-1))
{
  comp.df[,i] = as.numeric(comp.df[,i])
}

colnames(comp.df)[20] = "status"
comp.df$status = as.character(comp.df$status)
comp.df$status[which(comp.df$status == "T")] = "Normal"
comp.df$status = factor(comp.df$status, levels = c("Normal", "K", "KP"))

#######
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
my_comparisons = list(c("Normal", "K"), c("Normal", "KP"), c("K", "KP"))
mean.plots <- list()

for (subtype in subtypes){
  mean.plot <- ggviolin(comp.df, x = "status", y = subtype, color = "black", fill = "status",
                        title = subtype, palette = c("grey", "#0091CA", "#D8423D"),
                        add = "boxplot", add.params = list(fill = "white"))+
    rotate_x_text(angle = 45) + NoLegend() +
    stat_compare_means(comparisons = my_comparisons)
  mean.plots[[subtype]] <- mean.plot
}

############ 
mean.plots.2 = list()
mean.plots.2[[1]] = mean.plots[[19]] ## tp53 targets
mean.plots.2[[2]] = mean.plots[[1]]   ## AT.SFTPA2.1
mean.plots.2[[3]] = mean.plots[[4]]   ## CC.S
mean.plots.2[[4]] = mean.plots[[6]]   ## Glyco.hypox
mean.plots.2[[5]] = mean.plots[[8]]   ## Hypox
mean.plots.2[[6]] = mean.plots[[14]]   ## PEMT

# 
pdf(paste0(figures.dir, "Fig3G_left.pdf"), width = 20, height = 5, useDingbats=FALSE) 
cowplot::plot_grid(plotlist = mean.plots.2, ncol=6)
dev.off()
