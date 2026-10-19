
# EXTENDED FIG 1D
v.s1d <- c("B.cells", "Fibroblast", "Cancer", "Mast", "`T.CD4+`", # row 1
           "Myeloid", "NK.cells", "Smooth.muscle", "T.cells", "`T.CD8+`") # row 2

createBoxplots(plotVector = v.s1d, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 5, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s1d")
