
# EXTENDED FIG 7F
v.s7f <- c("CD274", "CD86", "PVR", "PDCD1", "CTLA4", "TIGIT")

createBoxplots(plotVector = v.s7f, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 6, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s7f")
