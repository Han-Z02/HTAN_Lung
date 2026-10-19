}


#### F5D pathway enrichment ####
q_values <- c(11.60205999,
11.60205999,
10.31695296,
9.024108864,
6.514278574,
6.514278574,
5.321481621,
5.1123827,
4.247183569,
3.32330639)

names <- c('HALLMARK_EPITHELIAL_MESENCHYMAL_TRANSITION',

'HALLMARK_HYPOXIA',
'HALLMARK_GLYCOLYSIS',
'HALLMARK_MTORC1_SIGNALING',
'HALLMARK_COMPLEMENT',
'HALLMARK_INFLAMMATORY_RESPONSE',
'HALLMARK_KRAS_SIGNALING_UP',
'HALLMARK_COAGULATION',
'HALLMARK_IL2_STAT5_SIGNALING',
'HALLMARK_PROTEIN_SECRETION')


mydf <- data.frame(A=names, B=q_values)

pdf (file.path(figures.dir,'F4D_enrichment.pdf'))
par(mar=c(6,16,4,4))
barplot(rev(mydf$B), main="SPP1 Correlated Genes", horiz=TRUE,
 names.arg=rev(names), las = 1, cex.names=0.6,
col = ifelse(rev(mydf$B) < 0, "#b0002c", "#2463ac"), xlab = "Log q value", cex.axis=1)
dev.off()
