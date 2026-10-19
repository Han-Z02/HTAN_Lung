
df.t <- end.df

pdf(paste0(figures.dir, "FIG_1H_endo.pdf"), width = 3, height = 3, useDingbats=FALSE)
ggboxplot(df.t, x = "p53_status", y = "Endothelial", color = "p53_status", outlier.shape = NA,
                       palette = c("#0091CA", "#D8423D"),
                       title = "Endothelial") +
stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(df.t[,"Endothelial"]))) +
theme(plot.title = element_text(size = 12, face = "bold")) + theme(legend.position = "none")
dev.off()