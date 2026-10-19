# ----------------------------------------------------
# EXTENDED FIG 2g
# ----------------------------------------------------
fit <- survfit(Surv(Overall.Survival..Months., Overall.Survival.Status) ~ p53_status2, data = df.km)
print(fit)

p.s2g <- ggsurvplot(fit, 
           # conf.int = TRUE,
           risk.table.col = "strata", # Change risk table color by groups
           pval = T,
           pval.method = T,
           ggtheme = theme_classic(), # Change ggplot2 theme
           )
p.s2g <- p.s2g$plot + 
    labs(color = NULL) +
    scale_color_manual(labels = c("TP53 WT", "TP53 mut"),
                       values = c("#0091CA", "#D8423D")) +
    xlab("Time (months)")

ggsave(filename = file.path(figures.dir, "s2g.pdf"), 
       plot = p.s2g, device = "pdf", width = 3, height = 3.5)
