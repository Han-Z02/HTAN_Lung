
spatial_signif <- read.csv(file = paste0(data.path, "spatial_list_factor14_subtypelvl_sigs.corr.df.csv"), check.names = F)
colnames(spatial_signif)[1] <- "cellpair"

subset <- spatial_signif[spatial_signif$cellpair %in% "CC.G2M:Glycolysis.Hypox",]
df.t <- t(subset[,c(2:15)])
df.t <- as.data.frame(df.t)
df.t$p53_status <- c(rep("p53_mut", 4), rep("WT", 10))
df.t$p53_status  <- factor(df.t$p53_status , levels = c("WT", "p53_mut"))
colnames(df.t) <- c("CC.G2M_Gylcolysis", "p53_status")

pdf(paste0(figures.dir, "FIG_2F_ccg2m_gyl.pdf"), width = 3, height = 3, useDingbats=FALSE)
ggboxplot(df.t, x = "p53_status", y = "CC.G2M_Gylcolysis", color = "p53_status",
                       palette = c("#0091CA", "#D8423D"), add = "jitter",
                       title = "CC.G2M_Gylcolysis Spatial Corr") +
stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(df.t[,"CC.G2M_Gylcolysis"]))) +
theme(plot.title = element_text(size = 12, face = "bold")) + theme(legend.position = "none")
dev.off()
