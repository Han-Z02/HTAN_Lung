

# EXTENDED FIG 6C
v.s6c <- c("CXCL9", "CXCL10", "CXCL11")

createBoxplots(plotVector = v.s6c, w = 3, h = 4, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 3, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s6c")
