


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3I
ccat.df <- get(load(paste0(data.path, "ccat.df_smartseq2.Rda")))

ccat.df = ccat.df[which(ccat.df$timesimple %in% c("01_T_early_ND", "05_K_30w_ND", "08_KP_30w_ND")),]

ccat.df$K_vs_KP <- as.character(ccat.df$K_vs_KP)
ccat.df$K_vs_KP[ccat.df$K_vs_KP %in% "T"] <- "Normal"
ccat.df$K_vs_KP <- factor(ccat.df$K_vs_KP, levels = c("Normal", "K", "KP"))
my_comparisons <- list(c("Normal", "K"), c("K", "KP"), c("Normal", "KP"))

############
pdf(paste0(figures.dir, "Fig3I.pdf"), width = 4, height = 4)
ggviolin(ccat.df, x = "K_vs_KP", y = "ccat.v", color = "black", fill = "K_vs_KP",
         title = "K vs KP mouse entropy", palette = c("grey", "#0091CA", "#D8423D"),
         add = "boxplot", add.params = list(fill = "white")) +
  NoLegend() +
  stat_compare_means(comparisons = my_comparisons)
dev.off()
