


#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
#####################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
##################### Extended Figure 2B
library(clusterProfiler)
library(msigdbr)
library(org.Hs.eg.db)

#####
degs <- read.csv(paste0(data.path, "Top100.Cancer.subtype.markers.wilcox.rankedlogfc.csv"))
deg.epi = degs
deg.epi$X <- NULL
se = which(is.na(deg.epi$cluster))
deg.epi = deg.epi[-se,]

### set up the gene set
H_t2g <- msigdbr(species = "Homo sapiens", category = "H") %>%
  dplyr::select(gs_name, gene_symbol)
head(H_t2g)

########### 
deg.epi$cluster <- gsub("\\.", "_", deg.epi$cluster)

xx <- compareCluster(gene ~ cluster, data = deg.epi, fun = enricher,
                     TERM2GENE=H_t2g)

########### 
p <- dotplot(xx, x="cluster") + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
                                      axis.text.y = element_text(size = 6, vjust = 0.5, hjust=1))
pdf(paste0(figures.dir, "Ext_Fig2B.pdf"), useDingbats = F, width = 8, height = 10)
print(p)
dev.off()
