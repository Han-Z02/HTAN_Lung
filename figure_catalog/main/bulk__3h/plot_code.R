######################################################
#################### TSANKOV LAB #####################
######################################################
# ----------------------------------------------------
# load the libraries
# ----------------------------------------------------
library(tidyverse)
library(Seurat)
library(scuttle)
library(SCENT)
library(ggpubr)
# ----------------------------------------------------
# set directories
# ----------------------------------------------------
data.path <- "../data/"
figures.dir <- "../../figures/"
system(paste0("mkdir -p ", figures.dir))
# ----------------------------------------------------
# load the objects
# ----------------------------------------------------
luad.2018 <- readRDS(file.path(data.path, "luad.2018.processed.rds"))
combined.luad.2018 <- readRDS(file.path(data.path, "combined.luad.2018.rds"))
cptac.luad.prot <- readRDS(file.path(data.path, "cptac.luad.prot.processed.rds"))
# ----------------------------------------------------
print(combn(levels(combined.luad.2018@meta.data$p53_status), m = 2, simplify = F))
# ----------------------------------------------------
# custom function
# ----------------------------------------------------
createEntropyViolinplots <- function(plotVar, 
                                     plotDF,
                                     titleStr = "Bulk entropy TCGA",
                                     ylabStr = "Entropy",
                                     xVar = "p53_status", 
                                     outfileName = "noFigName",
                                     comparisonList = list(c("WT", "mut"))) {
    # Check if plotVar exists in plotDF columns
    if (!str_remove_all(string = plotVar, pattern = "`") %in% colnames(plotDF)) {
        return (message(paste0(plotVar, "doesn't exist in plotting data... Try again!")))
    }
    message(paste0("Adding plot and saving csv file for ", plotVar, "..."))
    saveDF <- plotDF |>
        drop_na(all_of(xVar)) |>
        select(all_of(c(xVar, plotVar)))
    # write.csv(saveDF, file.path(paste0(data.path, outfileName, ".", make.names(plotVar), ".csv")))
    
    # Determine the color palette based on xVar levels
    if (length(unique(plotDF[[xVar]])) < 4) {
        if (length(unique(plotDF[[xVar]])) == 2) {
            tmpPalette <- c("#00AFBB", "#FC4E07")
        } else if (length(unique(plotDF[[xVar]])) == 3) {
            tmpPalette <- c("grey", "#00AFBB", "#FC4E07")
        }

        # Generate the violin plot
        plot <- plotDF |>
            drop_na(all_of(xVar)) |>
            ggviolin(
                x = xVar, 
                y = plotVar, 
                fill = xVar, 
                title = titleStr,
                palette = tmpPalette,
                scale = "width",
                add = "boxplot", 
                add.params = list(fill = "white")
            ) +
            rotate_x_text(angle = 0) +
            stat_compare_means(comparisons = comparisonList) +
            scale_x_discrete(labels = function(x) {
                paste0(x, "\n(n = ", table(plotDF[[xVar]])[x], ")")
            }) +
            theme(legend.position = "none") +
            ylab(ylabStr) +
            xlab(NULL)
    } else {
        # Generate the violin plot without specifying a color palette
        plot <- plotDF |>
            drop_na(all_of(xVar)) |>
            ggviolin(
                x = xVar, 
                y = plotVar, 
                fill = xVar, 
                title = titleStr,
                scale = "width",
                add = "boxplot", 
                add.params = list(fill = "white")
            ) +
            rotate_x_text(angle = 90) +
            stat_compare_means(comparisons = comparisonList) +
            scale_x_discrete(labels = function(x) {
                paste0(x, "\n(n = ", table(plotDF[[xVar]])[x], ")")
            }) +
            theme(legend.position = "none") +
            ylab(ylabStr) +
            xlab(NULL)
    }

    return (plot)
}
# ----------------------------------------------------
# generate figures
# ----------------------------------------------------
# FIG 3H
p.3h.tcga <- createEntropyViolinplots(plotVar = "ccat", outfileName = "3h.tcga",
                         plotDF = combined.luad.2018@meta.data, 
                         xVar = "p53_status", 
                         comparisonList = combn(levels(combined.luad.2018@meta.data[["p53_status"]]), m = 2, simplify = FALSE))
p.3h.cptac <- createEntropyViolinplots(plotVar = "ccat.v", outfileName = "3h.cptac",
                         plotDF = cptac.luad.prot@meta.data, 
                         titleStr = "Bulk entropy CPTAC", 
                         xVar = "p53_status", 
                         comparisonList = list(c("WT", "mut")))
p.3h.tcga + p.3h.cptac
ggsave(filename = file.path(paste0(figures.dir, "3h.pdf")), 
       plot = (p.3h.tcga + p.3h.cptac), 
       device = "pdf", 
       width = 3 * 2, 
       height = 4)
