
subset <- spatial_signif[spatial_signif$cellpair %in% "pEMT:Hypoxia",]
df.t <- t(subset[,c(2:15)])
df.t <- as.data.frame(df.t)
df.t$p53_status <- c(rep("p53_mut", 4), rep("WT", 10))
df.t$p53_status  <- factor(df.t$p53_status , levels = c("WT", "p53_mut"))
colnames(df.t) <- c("pEMT_Hypoxia", "p53_status")

pdf(paste0(figures.dir, "FIG_2F_pemt_hyp.pdf"), width = 3, height = 3, useDingbats=FALSE)
ggboxplot(df.t, x = "p53_status", y = "pEMT_Hypoxia", color = "p53_status",
                       palette = c("#0091CA", "#D8423D"), add = "jitter",
                       title = "pEMT_Hypoxia Spatial Corr") +
stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(df.t[,"pEMT_Hypoxia"]))) +
theme(plot.title = element_text(size = 12, face = "bold")) + theme(legend.position = "none")
dev.off()