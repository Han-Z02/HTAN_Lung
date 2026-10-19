
####
my_comparisons <- list(c("Malignant", "Stromal"), c("Stromal", "Immune"))

pdf(paste0(figures.dir, "FIG_1G_stromal.pdf"), width = 6, height = 6, useDingbats=FALSE)
ggviolin(merged_df, x = "navin_annots_2", y = "Stromal", color = "navin_annots_2", width = 0.5,
          title = "Stromal", add = "boxplot", add.params = list(fill = "white")) +
  stat_compare_means(comparisons = my_comparisons) +
  theme(plot.title = element_text(size = 12, face = "bold")) + theme(legend.position = "none")
dev.off()
