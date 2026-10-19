

# FIG 5D
v.5d <- c("SPP1")

createBoxplots(plotVector = v.5d, w = 3, h = 4, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 1, 
               plotDF = luad.2018@meta.data, 
               outfileName = "5d")
