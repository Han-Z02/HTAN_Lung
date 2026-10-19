# 代码覆盖清单

扫描三个分析目录中全部 R/Python 脚本，覆盖 pdf、ggsave、createBoxplots、savefig 和 Scanpy save。共享保存函数按调用展开，已知循环按每次迭代展开；未保存的 Figure 6F 和明确的占位/注释历史另行收录。不是对未提供的论文完整图版的覆盖承诺。

| 原脚本 | 条目数（含历史和缺失项） | 现行输出命令行号 |
| --- | --- | --- |
| [bulk_analysis/codes/boxplots.R](../bulk_analysis/codes/boxplots.R) | 25 | 118, 128, 140, 148, 156, 167, 178, 188, 199, 207, 218, 226, 236, 246, 257, 265, 276, 287, 299, 307, 315, 325, 335, 344, 382 |
| [bulk_analysis/codes/entropy.R](../bulk_analysis/codes/entropy.R) | 5 | 114, 149, 213 |
| [bulk_analysis/codes/regressionModel.R](../bulk_analysis/codes/regressionModel.R) | 4 | 159, 178 |
| [bulk_analysis/codes/statistical_tests_on_pathological_variables.R](../bulk_analysis/codes/statistical_tests_on_pathological_variables.R) | 0 | 无保存命令，见支持脚本说明 |
| [bulk_analysis/codes/surv.su2c.R](../bulk_analysis/codes/surv.su2c.R) | 4 | 196, 358, 528, 698 |
| [bulk_analysis/codes/survival.R](../bulk_analysis/codes/survival.R) | 4 | 79, 102, 123, 167 |
| [singlecell_analysis/codes/code_Extended5D_pyscenic.py](../singlecell_analysis/codes/code_Extended5D_pyscenic.py) | 1 | 32 |
| [singlecell_analysis/codes/code_endo_panels.R](../singlecell_analysis/codes/code_endo_panels.R) | 8 | 46, 93, 129, 159, 198, 224, 251, 334 |
| [singlecell_analysis/codes/code_lymphoid_panels.R](../singlecell_analysis/codes/code_lymphoid_panels.R) | 16 | 30, 65, 104, 133, 155, 220, 299, 355, 505, 526, 589, 597, 638, 724 |
| [singlecell_analysis/codes/code_malig_panels.R](../singlecell_analysis/codes/code_malig_panels.R) | 21 | 56, 88, 111, 182, 223, 291, 353, 379, 396, 419, 452, 470, 496, 512, 547, 566, 596, 665, 705, 768, 791 |
| [singlecell_analysis/codes/code_mesenchymal_panels.R](../singlecell_analysis/codes/code_mesenchymal_panels.R) | 11 | 46, 75, 101, 148, 175, 214, 242, 271, 306, 335, 421 |
| [singlecell_analysis/codes/code_myeloid_panels.R](../singlecell_analysis/codes/code_myeloid_panels.R) | 12 | 44, 70, 108, 150, 184, 297, 330, 350, 437, 485, 543, 562 |
| [singlecell_analysis/codes/code_overall_panels.R](../singlecell_analysis/codes/code_overall_panels.R) | 10 | 93, 121, 134, 198, 273, 289, 326, 342, 354, 397 |
| [spatial_analysis/codes/EX_FIG_1E.R](../spatial_analysis/codes/EX_FIG_1E.R) | 1 | 28 |
| [spatial_analysis/codes/EX_FIG_1E_bottom.py](../spatial_analysis/codes/EX_FIG_1E_bottom.py) | 1 | 30 |
| [spatial_analysis/codes/EX_FIG_1F.R](../spatial_analysis/codes/EX_FIG_1F.R) | 1 | 31 |
| [spatial_analysis/codes/EX_FIG_1G.R](../spatial_analysis/codes/EX_FIG_1G.R) | 1 | 31 |
| [spatial_analysis/codes/EX_FIG_1H.R](../spatial_analysis/codes/EX_FIG_1H.R) | 1 | 113 |
| [spatial_analysis/codes/EX_FIG_4G.R](../spatial_analysis/codes/EX_FIG_4G.R) | 2 | 15, 28 |
| [spatial_analysis/codes/EX_FIG_5F.R](../spatial_analysis/codes/EX_FIG_5F.R) | 1 | 32 |
| [spatial_analysis/codes/EX_FIG_9A.R](../spatial_analysis/codes/EX_FIG_9A.R) | 2 | 36, 56 |
| [spatial_analysis/codes/EX_FIG_9B.R](../spatial_analysis/codes/EX_FIG_9B.R) | 2 | 47, 99 |
| [spatial_analysis/codes/EX_FIG_9C.R](../spatial_analysis/codes/EX_FIG_9C.R) | 1 | 19 |
| [spatial_analysis/codes/FIG_1G.R](../spatial_analysis/codes/FIG_1G.R) | 5 | 14, 28, 83, 93, 103 |
| [spatial_analysis/codes/FIG_1H.R](../spatial_analysis/codes/FIG_1H.R) | 2 | 30, 40 |
| [spatial_analysis/codes/FIG_2F.R](../spatial_analysis/codes/FIG_2F.R) | 3 | 15, 29, 44 |
| [spatial_analysis/codes/FIG_4D.R](../spatial_analysis/codes/FIG_4D.R) | 2 | 15, 28 |
| [spatial_analysis/codes/FIG_4I.R](../spatial_analysis/codes/FIG_4I.R) | 2 | 15, 28 |
| [spatial_analysis/codes/FIG_5I.R](../spatial_analysis/codes/FIG_5I.R) | 2 | 15, 28 |
| [spatial_analysis/codes/FIG_6G.R](../spatial_analysis/codes/FIG_6G.R) | 2 | 15, 28 |
| [spatial_analysis/codes/FIG_7B.R](../spatial_analysis/codes/FIG_7B.R) | 1 | 22 |
| [spatial_analysis/codes/FIG_7C.R](../spatial_analysis/codes/FIG_7C.R) | 1 | 28 |
| [spatial_analysis/codes/FIG_7D.R](../spatial_analysis/codes/FIG_7D.R) | 1 | 31 |
| [spatial_analysis/codes/FIG_8A.R](../spatial_analysis/codes/FIG_8A.R) | 2 | 34, 81 |
| [spatial_analysis/codes/FIG_8B.R](../spatial_analysis/codes/FIG_8B.R) | 3 | 21, 38, 55 |
| [spatial_analysis/codes/FIG_8C.R](../spatial_analysis/codes/FIG_8C.R) | 1 | 31 |
| [spatial_analysis/codes/FIG_8D.R](../spatial_analysis/codes/FIG_8D.R) | 1 | 15 |
| [spatial_analysis/codes/FIG_8E.R](../spatial_analysis/codes/FIG_8E.R) | 3 | 20, 35, 50 |
| [spatial_analysis/codes/FIG_8G.R](../spatial_analysis/codes/FIG_8G.R) | 1 | 24 |
| [spatial_analysis/codes/all_spatial_plots.R](../spatial_analysis/codes/all_spatial_plots.R) | 14 | 18 |
| [spatial_analysis/codes/run_infercnv.py](../spatial_analysis/codes/run_infercnv.py) | 5 | 62 |

`statistical_tests_on_pathological_variables.R` 只做统计检验，不生成图；`boxplots.R:105` 为共享函数中的保存命令，由 24 次 createBoxplots 调用覆盖。重复的注释 PNG 保存行、被注释的调试保存行不重复建目录。R_utils 作为共享工具由原路径保留，不作为论文输出独立编号。
