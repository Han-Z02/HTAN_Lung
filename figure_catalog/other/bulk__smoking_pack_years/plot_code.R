# ----------------------------------------------------
# smoking pack years
# ----------------------------------------------------
smoking_comparison_p53 <- read_csv(file.path(data.path, "smoking_comparison_p53.csv"))
p53.filt <- c("MGH1172", "MGH1173", "MGH1175", "MGH1182", "BWH16", "BWH11", "BWH14", "BWH06")
WT.filt <- c("P14", "MGH1174", "MGH1176", "MGH1183", "BWH01", "BWH04", "BWH05", "BWH09", "BWH19", "BWH23") # no MGH1170


xVar <- "p53_status"
plotVar <- "pack_yrs"
comparisonList = list(c("WT", "mut"))
plotDF <- smoking_comparison_p53 |>
#     mutate(p53_status = case_when(Patient %in% c(p53.filt, "P17", "P19", "MGH1181") ~ "mut", Patient %in% c(WT.filt, "MGH1179") ~ "WT", .default = NA)) |>
    mutate(p53_status = case_when(Patient %in% p53.filt ~ "mut", Patient %in% WT.filt ~ "WT", .default = NA)) |>
    rename("pack_yrs" = "Pack yrs")

p.smoking_pack_yrs <- plotDF |>
    drop_na(all_of(xVar)) |>
    ggboxplot(x = xVar, 
              y = plotVar,
              color = xVar, 
              palette = c("#0091CA", "#D8423D"),
              add = "jitter",
              title = plotVar) +
    stat_compare_means(comparisons = comparisonList) +
    scale_x_discrete(labels = function(x) paste0(x, "\n(n = ", table(plotDF[[xVar]])[x], ")")) +
    rotate_x_text(0) +
    xlab(NULL) +
    ylab("Pack years") +
    theme(plot.title = element_text(size = 12, face = "bold"), legend.position = "none")
p.smoking_pack_yrs

ggsave(filename = file.path(paste0(figures.dir, "smoking.pack_years.pdf")), 
       plot = p.smoking_pack_yrs, 
       device = "pdf",
       width = 3, 
       height = 4)
