

# EXTENDED FIG 3B
v.s3b <- c("p53_targets", "AT2", "CC.G2M", "Glycolysis.Hypox", "pEMT")
createBoxplots(plotVector = v.s3b, 
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 5, 
               plotDF = cptac.luad.prot@meta.data, 
               outfileName = "s3b")
