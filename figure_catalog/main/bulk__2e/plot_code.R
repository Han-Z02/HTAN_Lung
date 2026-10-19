
# FIG 2E
v.2e <- c("p53_targets", "AT2", "CC.G2M", "`Glycolysis/Hypox`", "pEMT")

createBoxplots(plotVector = v.2e, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 5, 
               plotDF = luad.2018@meta.data, 
               outfileName = "2e")
