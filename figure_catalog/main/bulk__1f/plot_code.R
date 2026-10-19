######################################################
#################### TSANKOV LAB #####################
######################################################
# ----------------------------------------------------
# load the libraries
# ----------------------------------------------------
library(Seurat)
library(tidyverse)
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
cptac.luad.prot <- readRDS(file.path(data.path, "cptac.luad.prot.processed.rds"))
# ----------------------------------------------------
# load the dataframe
# ----------------------------------------------------
df.pvals.tcga <- read_csv(file.path(data.path, "tcga.regression_plots.p53_kras_egfr_stk11_CancerProp.filtered.csv")) |>
    select(-"...1")
# ----------------------------------------------------
# custom function
# ----------------------------------------------------
createBoxplots <- function(plotVector, 
                           plotDF, 
                           outfileName, 
                           xVar = "p53_status", 
                           comparisonList = list(c("WT", "mut")), 
                           df.pvals = NULL,
                           numCol = 4, 
                           w = 3.5, 
                           h = 3) {
    plotlist <- list()

    for (plotVar in plotVector) {
        plotVar.clean <- str_remove_all(string = plotVar, pattern = "`")
        if (!plotVar.clean %in% colnames(plotDF)) {
            message(paste0(plotVar.clean, " not found in plotDF!"))
            next
        }
        message(paste0("Adding plot and saving csv file for ", plotVar, "..."))
        saveDF <- plotDF |>
            drop_na(all_of(xVar)) |>
            select(all_of(c(xVar, plotVar.clean)))
        # write.csv(saveDF, file.path(paste0(data.path, outfileName, ".", make.names(plotVar.clean), ".csv")))
        
        if (length(levels(plotDF[[xVar]])) == 2) {
            
            if (is.null(df.pvals)) {
                # for cptac
                plotlist[[plotVar]] <- plotDF |>
                    drop_na(all_of(xVar)) |>
                    ggboxplot(x = xVar, 
                              y = plotVar,
                              color = xVar, 
                              palette = c("#0091CA", "#D8423D"),
                              title = plotVar) +
                    stat_compare_means(comparisons = comparisonList) +
                    scale_x_discrete(labels = function(x) paste0(x, "\n(n = ", table(plotDF[[xVar]])[x], ")")) +
                    rotate_x_text(0) +
                    xlab(NULL) +
                    theme(plot.title = element_text(size = 12, face = "bold"), legend.position = "none")
            } else {
                # for tcga
                pvals_vector <- setNames(df.pvals$pval, df.pvals$program)
                pvals_manual <- pvals_vector[[plotVar.clean]]
                plotlist[[plotVar]] <- plotDF |>
                    drop_na(all_of(xVar)) |>
                    ggboxplot(x = xVar, 
                              y = plotVar,
                              color = xVar, 
                              palette = c("#0091CA", "#D8423D"),
                              title = plotVar) +
                    # stat_compare_means(comparisons = comparisonList) +
                    scale_x_discrete(labels = function(x) paste0(x, "\n(n = ", table(plotDF[[xVar]])[x], ")")) +
                    rotate_x_text(0) +
                    xlab(NULL) +
                    theme(plot.title = element_text(size = 12, face = "bold"), legend.position = "none") +
                    ggsignif::geom_signif(comparisons = list(c("WT", "mut")),  # Replace "WT" and "mut" with actual levels if different
                                          annotations = paste0("p = ", signif(pvals_manual, digits = 3)),
                                          y_position = max(plotDF[[plotVar.clean]], na.rm = TRUE) * 1.1,  # Adjust as needed
                                          tip_length = 0.02,  # Adjust the length of the horizontal line tips
                                          textsize = 3)
            }
        } else {
            plotlist[[plotVar]] <- plotDF |>
                drop_na(all_of(xVar)) |>
                ggboxplot(x = xVar, 
                          y = plotVar,
                          color = xVar, 
                          title = plotVar) +
                stat_compare_means(comparisons = comparisonList) +
                scale_x_discrete(labels = function(x) paste0(x, "\n(n = ", table(plotDF[[xVar]])[x], ")")) +
                rotate_x_text(90) +
                xlab(NULL) +
                theme(plot.title = element_text(size = 12, face = "bold"), legend.position = "none")
        }
    }
    
    ggsave(filename = file.path(paste0(figures.dir, outfileName, ".pdf")), 
           plot = patchwork::wrap_plots(plotlist, ncol = numCol), 
           device = "pdf", 
           width = w * numCol, 
           height = h * ceiling(length(plotlist) / 4))
}

# ----------------------------------------------------
# generate figures
# ----------------------------------------------------
# FIG 1F
v.1f <- c("Endothelial", "Pericytes")

createBoxplots(plotVector = v.1f, w = 3, h = 4, df.pvals = df.pvals.tcga,
               xVar = "p53_status", 
               comparisonList = list(c("WT", "mut")),
               numCol = 2, 
               plotDF = luad.2018@meta.data, 
               outfileName = "1f")
