# EXTENDED FIG 5C
# # ----------------------------------------------------
# # new entropy plot with comut4 column
# # ----------------------------------------------------
# df <- luad.2018@meta.data
# df.krasSubsets <- df |> 
#     filter(comut3 != "unassigned") |>
#     mutate(comut4 = comut3) |>
#     select(ccat, comut4)
# df <- df |>
#     mutate(comut4 = comut2) |>
#     select(ccat, comut4)

# df <- bind_rows(df, df.krasSubsets)
# levels.comut4 <- c("WT", "EGFR", "KRAS", "KRAS-G12C", "KRAS-G12D", "KRAS-G12V", "TP53", "TP53_EGFR", "TP53_KRAS")
# df$comut4 <- factor(df$comut4, levels = levels.comut4)

# levels.tmp <- levels(df$comut4)
# p.new_entropy.comut4 <- createEntropyViolinplots(plotVar = "ccat", outfileName = "new_entropy.comut4",
#                                                  titleStr = NULL,
#                                                  plotDF = df, 
#                                                  xVar = "comut4", 
#                                                  comparisonList = lapply(setdiff(levels.tmp, "WT"), function(x) c("WT", x)))
                                                                         
# ggsave(filename = file.path(paste0(figures.dir, "new_entropy.comut4.pdf")), 
#        plot = p.new_entropy.comut4, 
#        device = "pdf", 
#        width = 5, 
#        height = 5)   
