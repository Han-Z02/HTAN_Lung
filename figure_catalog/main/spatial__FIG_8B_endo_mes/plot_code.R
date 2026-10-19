data.path <- "./data/"
figures.dir <- "../../figures/"
system(paste0("mkdir -p ", figures.dir))

library(Seurat)
library(ggplot2)
library(ggpubr)

spatial_factor14_highlvl <- read.csv(file = paste0(data.path, "spatial_list_factor14_highlvl.corr.df.csv"), check.names = F)
colnames(spatial_factor14_highlvl)[1] <- "cellpair"
subset <- spatial_factor14_highlvl[spatial_factor14_highlvl$cellpair %in% "Endothelial:Mesenchymal",]

df.t <- t(subset[,c(2:15)])
colnames(df.t) <- c("End_Mes")
df.t <- as.data.frame(df.t)
df.t$p53_status <- c(rep("p53_mut", 4), rep("WT", 10))

df.t$p53_status  <- factor(df.t$p53_status , levels = c("WT", "p53_mut"))

# spatial boxplots
pdf(paste0(figures.dir, "FIG_8B_endo_mes.pdf"), width = 3, height = 3, useDingbats=FALSE)
ggboxplot(df.t, x = "p53_status", y = "End_Mes", color = "p53_status",
                       palette = c("#0091CA", "#D8423D"), add = "jitter",
                       title = "End_Mes") +
stat_compare_means(label.x = 0.9, label.y = .9 * max(as.numeric(df.t[,"End_Mes"]))) +
theme(plot.title = element_text(size = 12, face = "bold")) + theme(legend.position = "none")
dev.off()
