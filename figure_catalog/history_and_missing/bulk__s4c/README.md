# s4c.pdf

图号索引：Extended_04C。图形类型：小提琴图。

状态：**已注释的历史代码**。

![图形结构示意，非论文原图](schematic.svg)

`schematic.svg` 仅说明代码使用的图形结构，无真实数据，不代表实际分布、趋势或显著性。

- [对应代码片段](plot_code.R)：原脚本第 121–133 行，逐字保留。
- [完整原始代码](source_original.R)：包含共享函数、加载、上游变量和其他图的完整上下文。
- [原仓库固定版本](https://github.com/Han-Z02/HTAN_Lung/blob/9afc9d6f5e6e15a9c365f6ec5ce661d299ad0108/bulk_analysis/codes/entropy.R#L121-L133)：`bulk_analysis/codes/entropy.R`。
- 原始保存命令行：无现行保存命令；输出名/条目标识：`s4c.pdf`。
- [机器可读说明](metadata.json)：图号、来源、SHA-256、代码行范围及批次信息。

片段用于定位和阅读，可能包含跨图共享对象或未闭合的循环上下文，不保证单独运行。完整代码保持原样，直接执行会生成该原脚本中的其他图。R 代码中的 `../data/`、`../zenodo_data/` 和 `../../figures/` 应相对于原脚本工作目录理解；空间脚本的 `./data/` 应从 `spatial_analysis/` 理解。复制到本目录后运行前需配置路径与依赖。

- 全部绘图语句均已注释。

下表列出**完整原脚本**中可静态识别的输入候选，并非本图最小依赖列表；动态路径、运行时对象和外部参考库仍需查阅完整代码。可用状态仅代表文件存在，不代表所有数据已齐备。

| 输入字面值 | 仓库状态 | 推定仓库路径 |
| --- | --- | --- |
| `luad.2018.processed.rds` | 仓库已有 | `bulk_analysis/data/luad.2018.processed.rds` |
| `combined.luad.2018.rds` | 仓库已有 | `bulk_analysis/data/combined.luad.2018.rds` |
| `cptac.luad.prot.processed.rds` | 仓库已有 | `bulk_analysis/data/cptac.luad.prot.processed.rds` |

外部处理数据入口：[Zenodo 16546233](https://doi.org/10.5281/zenodo.16546233)。环境和版本要求见[原仓库 README](../../../README.md)。本整理未运行原始生物信息学分析，也未生成论文结果图。
