


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3N
ccat.df <- get(load(paste0(data.path, "ccat.df.tp53.celllines.Rda")))

#
ccat.df$impact <- factor(ccat.df$impact, levels = c("WT TP53", "WT-like TP53", "Impactful I TP53", "Impactful II TP53",
                                                    "R280K TP53 I", "R158L TP53 II", "H179R TP53 II", "Y205C TP53 II", "S241F TP53 II"))

my_comparisons <- list(c("WT TP53", "WT-like TP53"), c("WT TP53", "Impactful I TP53"),
                       c("WT TP53", "Impactful II TP53"), c("WT TP53", "R280K TP53 I"),
                       c("WT TP53", "R158L TP53 II"), c("WT TP53", "H179R TP53 II"),
                       c("WT TP53", "Y205C TP53 II"), c("WT TP53", "S241F TP53 II"))

my_color_palette <- c("#0091CA", "#8DCEE7", "#F2C0BE", "#EBA09E", "#E1716D", "#C63C37", "#A2312D", "#7E2623", "#6C211E") 

############
pdf(paste0(figures.dir, "Fig3N.pdf"), width = 4.5, height = 4.5)  
ggviolin(ccat.df, x = "impact", y = "ccat.v", fill = "impact",
         palette = my_color_palette,
         add = "boxplot", add.params = list(fill = "white"))+
  rotate_x_text(angle = 45) + NoLegend() +
  stat_compare_means(comparisons = my_comparisons)
dev.off()
