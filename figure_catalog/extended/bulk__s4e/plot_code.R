
# EXTENDED FIG 4E
v.s4e <- c("Aerocyte", "Arterial")

createBoxplots(plotVector = v.s4e, w = 3, h = 4, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 2, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s4e")
