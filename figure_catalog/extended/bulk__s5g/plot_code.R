
# EXTENDED FIG 5G
v.s5g <- c("CAF.ADH1B")

createBoxplots(plotVector = v.s5g, w = 3, h = 4, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 1, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s5g")
