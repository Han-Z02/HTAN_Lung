######################################################
#################### TSANKOV LAB #####################
######################################################
# ----------------------------------------------------
# load the libraries
# ----------------------------------------------------
library(tidyverse)
library(Seurat)
library(survival)
library(survminer)
library(ggpubr)
# ----------------------------------------------------
# set directories
# ----------------------------------------------------
data.path <- "../data/"
figures.dir <- "../../figures/"
system(paste0("mkdir -p ", figures.dir))
# ----------------------------------------------------
# KM-curves for EXTENDED FIG 2d, 2e, 7g ------------------
# ----------------------------------------------------
df.km <- read_csv(file.path(data.path, "df.km.csv")) |> column_to_rownames("...1")
# ----------------------------------------------------
# generate figures
# ----------------------------------------------------
# EXTENDED FIG 2e ------------------------------------
# ----------------------------------------------------
# EXTENDED FIG 2eA
fit <- survfit(Surv(Overall.Survival..Months., Overall.Survival.Status) ~ pEMT_top25_vs_mid50_vs_bottom25, data = df.km)

p.s2eA <- ggsurvplot(fit,
                     risk.table.col = "strata",
                     linetype = "solid",
                     surv.median.line = "h",
                     pval = T,
                     pval.method = T,
                     ggtheme = theme_classic(),
                     censor = F)
p.s2eA <- p.s2eA$plot + 
    labs(color = NULL) +
    scale_color_discrete(labels = c("Low", "Medium", "High")) +
    xlab("Time (months)")

# EXTENDED FIG 2eB
fit <- survfit(Surv(Overall.Survival..Months., Overall.Survival.Status) ~ Glycolysis.Hypox_top25_vs_mid50_vs_bottom25, data = df.km)

p.s2eB <- ggsurvplot(fit,
                     risk.table.col = "strata",
                     linetype = "solid",
                     surv.median.line = "h",
                     pval = T,
                     pval.method = T,
                     ggtheme = theme_classic(),
                     censor = F)
p.s2eB <- p.s2eB$plot + 
    labs(color = NULL) +
    scale_color_discrete(labels = c("Low", "Medium", "High")) +
    xlab("Time (months)")

# EXTENDED FIG 2eC
fit <- survfit(Surv(Overall.Survival..Months., Overall.Survival.Status) ~ CC.G2M_top25_vs_mid50_vs_bottom25, data = df.km)

p.s2eC <- ggsurvplot(fit,
                     risk.table.col = "strata",
                     linetype = "solid",
                     surv.median.line = "h",
                     pval = T,
                     pval.method = T,
                     ggtheme = theme_classic(),
                     censor = F)
p.s2eC <- p.s2eC$plot + 
    labs(color = NULL) +
    scale_color_discrete(labels = c("Low", "Medium", "High")) +
    xlab("Time (months)")

# patchwork for EXTENDED FIG 2e
p.s2e <- p.s2eA + p.s2eB + p.s2eC + 
    patchwork::plot_layout(axis_titles = "collect_y", guides = "collect")

ggsave(filename = file.path(figures.dir, "s2e.pdf"), 
       plot = p.s2e, device = "pdf", width = 3.5 * 3, height = 3)
