
# ----------------------------------------------------
# FIG 2d ---------------------------------------------
# ----------------------------------------------------
df <- read_csv(file.path(data.path, "survival_maligv9_pvals_tp53_status_top50_vs_bottom50.csv")) |>
    column_to_rownames("...1")
df$info <- rownames(df)
df <- df |> 
    mutate(outcome = case_when(posneg == -1 ~ "Worse", posneg == 1 ~ "Improved", .default = NA), 
           neglog10pval = -log10(pvals) * posneg) |>
    mutate(classification = case_when(str_detect(string = info, pattern = "top50_vs_bottom50") ~ "top50_vs_bottom50", 
                                      str_detect(string = info, pattern = "top25_vs_bottom25") ~ "top25_vs_bottom25", 
                                      str_detect(string = info, pattern = "top25_vs_mid50_vs_bottom25") ~ "top25_vs_mid50_vs_bottom25", 
                                      .default = NA)) |> 
    mutate(name = str_remove_all(string = info, pattern = paste0("_", classification)))  |> 
    filter(classification == "top50_vs_bottom50") |>
    select(all_of(c("pvals", "neglog10pval", "name", "outcome")))|> 
    filter(!name == "SPP1") |> 
    mutate(name = case_when(name == "HLA_D.AT2" ~ "MHCII", 
                            name == "AT.SFTPA2.1" ~ "AT2-like", 
                            name == "AT.SFTPC" ~ "AT1/2-like", 
                            name == "S100A.KRT.Trachea.ECM.KRASup" ~ "Senescence", 
                            .default = name))

p.2d <- ggdotchart(df, x = "name", y = "neglog10pval",
           color = "outcome",  # Color by groups
           palette = c("#0091CA", "#D8423D"),  # Custom color palette
           sorting = "descending",  # Sort value in descending order
           add = "segments",  # Add segments from y = 0 to dots
           add.params = list(color = "lightgray", size = 2),  # Change segment color and size
           group = "outcome",  # Order by groups
           dot.size = 8,  # Large dot size
           label = round(df$neglog10pval,1),  # Add mpg values as dot labels
           font.label = list(color = "white", size = 8, 
                             vjust = 0.5),  # Adjust label parameters
           ggtheme = theme_pubr()  # ggplot2 theme
  ) +
  geom_hline(yintercept = 0, linetype = 1, color = "black") +
  geom_hline(yintercept = -1.3, linetype = 2, color = "lightgray") +
  geom_hline(yintercept = 1.3, linetype = 2, color = "lightgray") +
    xlab(NULL)

ggsave(filename = file.path(figures.dir, "2d.pdf"), 
       plot = p.2d, device = "pdf", width = 7, height = 7)
