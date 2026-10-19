
############ 1D left
all$p53_status <- "WT"
all$p53_status[all$orig.identSec %in% p53.filt] <- "p53_mut"
all$p53_status[all$orig.identSec %in% other] <- "other"

Idents(all) <- "p53_status"
Idents(all) <- factor(Idents(all), levels = c("WT", "p53_mut", "other"))
colors <- c("#0091CA", "#D8423D", "gray")
pdf(file = paste0(figures.dir, "Fig1_overview/Fig1D.right.pdf"), useDingbats = F, width = 8)
DimPlot(all, cols = colors)
dev.off()
