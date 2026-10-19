


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Figure 3H (leftmost)
ccat.df <- get(load(paste0(data.path, "ccat.df.sc.nonmalig.wt.mut.subset.Rda"))) 

ccat.df$p53_status <- as.character(ccat.df$p53_status)
ccat.df$p53_status[ccat.df$p53_status %in% "nonmalig"] <- "Normal"
ccat.df$p53_status <- factor(ccat.df$p53_status, levels = c("Normal", "WT", "p53_mut"))
my_comparisons <- list(c("Normal", "WT"), c("WT", "p53_mut"), c("Normal", "p53_mut"))

############ 
pdf(paste0(figures.dir, "Fig3H_left.pdf"), width = 4, height = 4)
ggviolin(ccat.df, x = "p53_status", y = "ccat.v", color = "black", fill = "p53_status",
         title = "Single cell entropy", palette = c("grey", "#0091CA", "#D8423D"),
         add = "boxplot", add.params = list(fill = "white")) +
  NoLegend() +
  stat_compare_means(comparisons = my_comparisons)
dev.off()
