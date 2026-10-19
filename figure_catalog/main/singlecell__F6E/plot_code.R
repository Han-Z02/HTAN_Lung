# ----------------------------------------------------




#### F6E ####   
names <- c("TIGIT+CTLA4-PDCD1-",
  "TIGIT+CTLA4+PDCD1-",
  "TIGIT+CTLA4-PDCD1+",
  "TIGIT+CTLA4+PDCD1+",
  "TIGIT-CTLA4+PDCD1-",
  "TIGIT-CTLA4-PDCD1+",
  "TIGIT-CTLA4+PDCD1+")
  # "CTLA-PDCD1-TIGIT-")
tcell$CTLA4 <- tcell[["RNA"]]@counts["CTLA4",] > 0
tcell$PDCD1 <- tcell[["RNA"]]@counts["PDCD1",] > 0
tcell$TIGIT <- tcell[["RNA"]]@counts["TIGIT",] > 0
tcell@meta.data[,"TIGIT+CTLA4+PDCD1+"] <- (tcell$TIGIT==T & tcell$CTLA4 ==T & tcell$PDCD1==T)
tcell@meta.data[,"TIGIT+CTLA4+PDCD1-"] <- (tcell$TIGIT==T & tcell$CTLA4 ==T & tcell$PDCD1==F)
tcell@meta.data[,"TIGIT+CTLA4-PDCD1+"] <- (tcell$TIGIT==T & tcell$CTLA4 ==F & tcell$PDCD1==T)
tcell@meta.data[,"TIGIT+CTLA4-PDCD1-"] <- (tcell$TIGIT==T & tcell$CTLA4 ==F & tcell$PDCD1==F)
tcell@meta.data[,"TIGIT-CTLA4+PDCD1+"] <- (tcell$TIGIT==F & tcell$CTLA4 ==T & tcell$PDCD1==T)
tcell@meta.data[,"TIGIT-CTLA4+PDCD1-"] <- (tcell$TIGIT==F & tcell$CTLA4 ==T & tcell$PDCD1==F)
tcell@meta.data[,"TIGIT-CTLA4-PDCD1+"] <- (tcell$TIGIT==F & tcell$CTLA4 ==F & tcell$PDCD1==T)
tcell@meta.data[,"TIGIT-CTLA4-PDCD1-"] <- (tcell$TIGIT==F & tcell$CTLA4 ==F & tcell$PDCD1==F)

tcell$p53_status <- "WT"
tcell$p53_status[tcell$orig.identSec %in% p53.filt] <- "p53_mut"
#tcell$p53_status[tcell$orig.identSec %in% other] <- "other"

Idents(tcell) <- "p53_status"
tcell.p53 <- subset(tcell, idents = "p53_mut")
tcell.wt <- subset(tcell, idents = "WT")
sums.p53 <- c()
sums.wt <- c()
for (name in names) {
  sums.p53  <- c(sums.p53 , (sum(tcell.p53@meta.data[,name])/(nrow(tcell.p53@meta.data))))
  sums.wt <- c(sums.wt , (sum(tcell.wt@meta.data[,name])/(nrow(tcell.wt@meta.data))))
}
sums.p53
sums.wt

sums <- cbind(sums.wt, sums.p53)
colnames(sums) <- c("WT", "p53_mut")
rownames(sums) <- names
sums <- as.data.frame(sums)
sums <- sums[order(sums$p53_mut),]
sums <- sums[rev(names),]

sequential <- brewer.pal(7, "Spectral")
         
pdf(file.path(figures.dir, "F6E.pdf"), useDingbats = F, width = 5, height = 6)
barplot(as.matrix(sums),
 # names.arg = wide$Seed, # x-axis labels
 cex.names = 1, # makes x-axis labels small enough to show all
 col = sequential, # colors
 las=2,
 # xlab = "Seed Source",
 # ylab = "Height, Feet",
 xlim = c(0,10), # these two lines allow space for the legend
 ylim = c(0,0.5),
 width = 1) # these two lines allow space for the legend
legend("bottomright",
 legend = rev(rownames(sums)), #in order from top to bottom
 fill = sequential[7:1])#, # 6:1 reorders so legend order matches graph
 #title = "Years")
dev.off()
