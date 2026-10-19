
# EXTENDED FIG 3C
v.s3c <- c("p53_targets", "AT2", "CC.G2M")

levels.tmp <- levels(cptac.luad.prot@meta.data$DNE_LOFclass)
createBoxplots(plotVector = v.s3c, w = 3.5, h = 5,
               xVar = "DNE_LOFclass", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)),
               numCol = 3, 
               plotDF = cptac.luad.prot@meta.data, 
               outfileName = "s3cA")
