

# EXTENDED FIG 6D,E
v.s6de <- c("SPP1", "CXCL9", "CXCL10", "CXCL11")

levels.tmp <- levels(luad.2018@meta.data$comut)
createBoxplots(plotVector = v.s6de, w = 3, h = 5,
               xVar = "comut", 
               comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x))[-6],
               numCol = 4, 
               plotDF = luad.2018@meta.data, 
               outfileName = "s6d")
