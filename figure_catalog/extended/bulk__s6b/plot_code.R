

# EXTENDED FIG 6B
v.s6b <- c("TAM.CXCL")

createBoxplots(plotVector = v.s6b, w = 3, h = 4, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 1, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s6b")
