
subset <- spatial_factor14_highlvl[spatial_factor14_highlvl$cellpair %in% "Endothelial:Cancer",]
df.t <- t(subset[,c(2:15)])
colnames(df.t) <- c("End_Cancer")
df.t <- as.data.frame(df.t)
df.t$p53_status <- c(rep("p53_mut", 4), rep("WT", 10))

df.t$p53_status  <- factor(df.t$p53_status , levels = c("WT", "p53_mut"))

# spatial boxplots
pdf(paste0(figures.dir, "FIG_8B_end_cancer.pdf"), width = 3, height = 3, useDingbats=FALSE)
ggboxplot(df.t, x = "p53_status", y = "End_Cancer", color = "p53_status",
                       palette = c("#0091CA", "#D8423D"), add = "jitter",
                       title = "End_Cancer") +
stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(df.t[,"End_Cancer"]))) +
theme(plot.title = element_text(size = 12, face = "bold")) + theme(legend.position = "none")
dev.off()