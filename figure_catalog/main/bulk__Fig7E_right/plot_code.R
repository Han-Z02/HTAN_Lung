


##################### 7E (right)
##################### squamous + anti-pd1
se = which(clin$Agent_PD1 %in% c("Nivolumab", "Pembrolizumab") & clin$Histology_Harmonized == "Squamous")  ## sq+ anti-pd-1
clin.subset = clin[se,]

### mut of common genes
clin.subset1 = clin.subset[,c("EGFR_status", "STK11_status", "KEAP1_status", "KRAS_status", 
                              "TP53_status", "OS_Years", "PFS_Years", "OS_Status", "PFS_Status")]

sub = colnames(clin.subset1)[1:5]

survdiff.pvalOS = coxph.pvalOS = survdiff.pvalPFS = coxph.pvalPFS = rep(0, length(sub))
hrOS = hrPFS = lbOS = ubOS = lbPFS = ubPFS = num_high = num_low = rep(0, length(sub))

for (k in 2:length(sub))  ## egfr has no muts (pdl1), only 1 mut (all treatments)
{
  cat("\r", k)
  
  label = rep(NA, nrow(clin.subset1))
  se = which(clin.subset1[,k] == "Wildtype")
  label[se] = 0
  se = which(clin.subset1[,k] == "Mutants")
  label[se] = 1
  
  xx = cbind(clin.subset1, label)
  se = !is.na(xx$label)
  xx = xx[se,]
  
  a = table(label)
  num_high[k] = as.numeric(a[names(a)==1])
  num_low[k] = as.numeric(a[names(a)==0])
  
  mycox = coxph(Surv(OS_Years, OS_Status)~label, xx)
  mycox = summary(mycox)
  coxph.pvalOS[k] = mycox$coefficients[5]
  tmp = mycox$conf.int
  hrOS[k] = tmp[1]
  lbOS[k] = tmp[3]
  ubOS[k] = tmp[4]
  mycox = coxph(Surv(PFS_Years, PFS_Status)~label, xx)
  mycox = summary(mycox)
  coxph.pvalPFS[k] = mycox$coefficients[5]
  tmp = mycox$conf.int
  hrPFS[k] = tmp[1]
  lbPFS[k] = tmp[3]
  ubPFS[k] = tmp[4]
  
}

res.surv = data.frame(sub, num_high, num_low, coxph.pvalOS, hrOS, lbOS, ubOS, coxph.pvalPFS, hrPFS, lbPFS, ubPFS)
res.surv1 = res.surv

### mut of p53 specific subsets

se.list = list()
se.list[[1]] = which(clin.subset$Impact1 == 1)
se.list[[2]] = which(clin.subset$Impact2 == 1)
se.list[[3]] = which(clin.subset$DNE_LOFclass == "DNE_LOF")
se.list[[4]] = which(clin.subset$DNE_LOFclass == "notDNE_LOF")
se.list[[5]] = which(clin.subset$DNE_LOFclass == "notDNE_notLOF")
se.list[[6]] = grep("Missense_Mutation", clin.subset$TP53.all)
se.list[[7]] = grep("Nonsense_Mutation", clin.subset$TP53.all)
se.list[[8]] = grep("Splice_Site", clin.subset$TP53.all)
se.list[[9]] = which(clin.subset$TP53.all == "Splice_Site")
se.list[[10]] = grep("Frame_Shift_Ins|Frame_Shift_Del", clin.subset$TP53.all)


sub = c("Impact1", "Impact2", "DNE_LOF", "notDNE_LOF", "notDNE_notLOF",
        "Missense", "Nonsense", "Splice_Site_All", "Splice_Site_Unique", "Frameshift")

survdiff.pvalOS = coxph.pvalOS = survdiff.pvalPFS = coxph.pvalPFS = rep(0, length(sub))
hrOS = hrPFS = lbOS = ubOS = lbPFS = ubPFS = num_high = num_low = rep(0, length(sub))

for (k in 1:length(sub))
{
  cat("\r", k)
  
  label = rep(NA, nrow(clin.subset))
  se = which(clin.subset$TP53.all == "Wildtype")
  label[se] = 0
  se = se.list[[k]]
  label[se] = 1
  
  xx = cbind(clin.subset, label)
  se = !is.na(xx$label)
  xx = xx[se,]
  
  a = table(label)
  num_high[k] = as.numeric(a[names(a)==1])
  num_low[k] = as.numeric(a[names(a)==0])
  
  mycox = coxph(Surv(OS_Years, OS_Status)~label, xx)
  mycox = summary(mycox)
  coxph.pvalOS[k] = mycox$coefficients[5]
  tmp = mycox$conf.int
  hrOS[k] = tmp[1]
  lbOS[k] = tmp[3]
  ubOS[k] = tmp[4]
  mycox = coxph(Surv(PFS_Years, PFS_Status)~label, xx)
  mycox = summary(mycox)
  coxph.pvalPFS[k] = mycox$coefficients[5]
  tmp = mycox$conf.int
  hrPFS[k] = tmp[1]
  lbPFS[k] = tmp[3]
  ubPFS[k] = tmp[4]
  
}

res.surv = data.frame(sub, num_high, num_low, coxph.pvalOS, hrOS, lbOS, ubOS, coxph.pvalPFS, hrPFS, lbPFS, ubPFS)
res.surv2 = res.surv

###
res.surv = rbind(res.surv1, res.surv2)

##
coxph.pvalPFS = res.surv$coxph.pvalPFS
lbPFS = res.surv$lbPFS
hrPFS = res.surv$hrPFS
ubPFS = res.surv$ubPFS
sub = res.surv$sub
num_high =  res.surv$num_high
num_low = res.surv$num_low

coxph.pvalPFS.ann = NULL
for (i in 1:length(coxph.pvalPFS))
{
  tmp = coxph.pvalPFS[i]
  coxph.pvalPFS.ann[i] = as.character(cut(tmp,
                                          breaks = c(-Inf, 0.001, 0.1, Inf),
                                          labels = c(paste("p =", formatC(tmp, 1, format = "e")), 
                                                     paste("p =", formatC(signif(tmp, 2), 2, flag = "#")), 
                                                     "p > 0.1")))
}

sub2 = c("EGFR", "STK11", "KEAP1", "KRAS", "TP53", "  Impactful 1", "  Impactful 2", "  DNE,LOF", "  notDNE,LOF", "  notDNE,notLOF",
         "  Missense", "  Nonsense", "  Splice Site", "  Unique Splice Site", "  Frameshift")
sub2 = paste0(sub2, " (", num_high, ")")

res1 = data.frame(lbPFS, hrPFS, ubPFS)
res2 = data.frame(sub2, coxph.pvalPFS.ann)

##
res1 = res1[-1,]
res2 = res2[-1,]

## set range hr >17 -> 17
res1.mod = res1
se = which(res1.mod[,"ubPFS"] > 17)
res1.mod[se,"ubPFS"] = 17


##############
pdf(paste0(figures.dir, "Fig7E_right.pdf"), useDingbats = F, 9, 9)
forestplot(res2, as.matrix(res1.mod), graph.pos = 2, new_page = F,
           xlab = "Hazard ratio",
           xticks = c(0, 1, 5, 10, 15, 17),
           graphwidth = unit(90, "mm"),
           vertices = TRUE,
           col = fpColors(lines = "black"),
           boxsize = 0.3,
           txt_gp = fpTxtGp(xlab = gpar(cex = 2.25), 
                            ticks = gpar(cex = 1.75),
                            title = gpar(cex = 2.5, fontface = "bold"),
                            cex = 1.5),
           align = c("l", "l"),
           zero = 1)
dev.off()
