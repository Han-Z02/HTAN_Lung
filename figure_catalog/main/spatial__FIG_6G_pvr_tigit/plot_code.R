
spatial_signif_lr <- read.csv(file = paste0(data.path, "spatial_list_u50_lig_rec.corr.df.csv"), check.names = F)
spatial_signif_lr <- spatial_signif_lr[spatial_signif_lr$int %in% "PVR-TIGIT",]

df.t <- t(spatial_signif_lr[,c(2:5,8:17)])
df.t <- as.data.frame(df.t)
df.t$p53_status <- c(rep("p53_mut", 4), rep("WT", 10))
df.t$p53_status  <- factor(df.t$p53_status , levels = c("WT", "p53_mut"))
colnames(df.t) <- c("PVR_TIGIT", "p53_status")

pdf(paste0(figures.dir, "FIG_6G_pvr_tigit.pdf"), width = 3, height = 3, useDingbats=FALSE)
ggboxplot(df.t, x = "p53_status", y = "PVR_TIGIT", color = "p53_status",
                       palette = c("#0091CA", "#D8423D"), add = "jitter",
                       title = "PVR_TIGIT Spatial Corr") +
stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(df.t[,"PVR_TIGIT"]))) +
theme(plot.title = element_text(size = 12, face = "bold")) + theme(legend.position = "none")
dev.off()
