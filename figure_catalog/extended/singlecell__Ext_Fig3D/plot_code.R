


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 3D
ccat.df = get(load(paste0(data.path,'ccat.df.kras.celllines.Rda')))

#
ccat.df$impact <- factor(ccat.df$impact, levels = c("WT KRAS", "WT-like KRAS",
                                                    "Impactful I KRAS", "Impactful II KRAS",
                                                    "Impactful III KRAS", "Impactful IV KRAS"))

my_comparisons <- list(c("WT KRAS", "WT-like KRAS"), c("WT KRAS", "Impactful I KRAS"),
                       c("WT KRAS", "Impactful II KRAS"), c("WT KRAS", "Impactful III KRAS"),
                       c("WT KRAS", "Impactful IV KRAS"))

my_color_palette <- c("#0091CA", "#8DCEE7", "#9E9AC8", "#756BB1", "#54278F", "#3F007D") # kras impact

############
pdf(paste0(figures.dir, "Ext_Fig3D.pdf"), width = 5, height = 5)  
ggviolin(ccat.df, x = "impact", y = "ccat.v", fill = "impact",
         palette = my_color_palette,
         add = "boxplot", add.params = list(fill = "white"))+
  rotate_x_text(angle = 45) + NoLegend() +
  stat_compare_means(comparisons = my_comparisons)
dev.off()