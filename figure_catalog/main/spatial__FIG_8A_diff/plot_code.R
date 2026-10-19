
patient.corr.list2 <- list()
for (i in 1:length(spatial_list)) { # filtered - no BW16, etc.
  obj <- spatial_list[[i]]@meta.data
  corr <- cor(obj[,c(14:24)], obj[,c(14:24)]) # 2v4 high lvl
  patient.corr.list2[[i]] <- as.data.frame(t(as.data.frame(unmatrix(corr))))
}

rbind.df <- t(rbindlist(patient.corr.list2))
pvals.list <- apply(rbind.df, 1, function(x) {
  pval <- wilcox.test(x[1:4], x[5:14])$p.value
  pval <- -log10(pval)
})

avg.mtx <- t(avg.mtx) # not for x vs factors
avg.mtx.melt <- reshape2::melt(avg.mtx)
avg.mtx.melt$pvals <- pvals.list

meandiff.list <- apply(rbind.df, 1, function(x) {
  meandiff <- mean(x[1:4], na.rm = T) - mean(x[5:14], na.rm = T)
})

avg.mtx.melt$meandiff <- meandiff.list
avg.mtx.melt$signif <- ""
avg.mtx.melt$signif[avg.mtx.melt$pvals >= 1.3] <- "*"

avg.mtx.melt2 <- avg.mtx.melt
avg.mtx.melt2 <- reshape2::dcast(avg.mtx.melt2, Var1 ~ Var2, value.var = "meandiff") # why does it change...
rownames(avg.mtx.melt2) <- avg.mtx.melt2$Var1
avg.mtx.melt2$Var1 <- NULL

avg.mtx.melt3 <- avg.mtx.melt
avg.mtx.melt3 <- reshape2::dcast(avg.mtx.melt3, Var1 ~ Var2, value.var = "signif")
rownames(avg.mtx.melt3) <- avg.mtx.melt3$Var1
avg.mtx.melt3$Var1 <- NULL

avg.mtx.melt2 <- t(avg.mtx.melt2)
avg.mtx.melt3 <- t(avg.mtx.melt3)

range <- 0.3

avg.mtx.melt2 <- avg.mtx.melt2[order,order]
avg.mtx.melt3 <- avg.mtx.melt3[order,order]

pdf(file = paste0(figures.dir, "FIG_8A_diff.pdf"), useDingbats = F, width = 4, height = 3.3)
pheatmap(avg.mtx.melt2, display_numbers = avg.mtx.melt3, border_color="gray", breaks = seq(-range, range, length.out = 100), cluster_cols = F, cluster_rows = F)
dev.off()
