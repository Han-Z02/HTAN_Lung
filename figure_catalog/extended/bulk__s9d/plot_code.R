
# EXTENDED FIG 9D
v.s9d <- c("T.Exhausted", "CD8.GZMK")

createBoxplots(plotVector = v.s9d, w = 3, h = 4, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 2, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s9d")
