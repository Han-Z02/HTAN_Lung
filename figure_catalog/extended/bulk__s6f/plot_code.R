

# EXTENDED FIG 6f
fit <- survfit(Surv(Overall.Survival..Months., Overall.Survival.Status) ~ SPP1_top50_vs_bottom50, data = df.km)
p.s6f <- ggsurvplot(fit,
           # conf.int = TRUE,
           risk.table.col = "strata", # Change risk table color by groups
           linetype = "solid", # Change line type by groups
           surv.median.line = "h", # Specify median survival
           pval = T,
           pval.method = T,
           ggtheme = theme_classic(), # Change ggplot2 theme
           # palette = c("#E7B800", "#2E9FDF")
           censor = F)

p.s6f <- p.s6f$plot + 
    labs(color = NULL) +
    scale_color_manual(labels = c("Low SPP1", "High SPP1"),
                       values = c("#0091CA", "#D8423D")) +
    xlab("Time (months)")

ggsave(filename = file.path(figures.dir, "s6f.pdf"), 
       plot = p.s6f, device = "pdf", width = 3, height = 3.5)
