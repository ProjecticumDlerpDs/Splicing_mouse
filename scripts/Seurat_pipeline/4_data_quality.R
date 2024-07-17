# 4
# Data quality inspection

seurat <- readRDS(here("data/rds_files/3_seurat.rds"))

seurat[["percent.mt"]] <- PercentageFeatureSet(seurat, pattern = "^mt-")
Vln_plot <- VlnPlot(seurat, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
table(Idents(seurat))

# Save the Seurat object
saveRDS(seurat,here("data/rds_files/4_seurat_data_quality.rds"))
ggsave(
  here("data/plots/4_Vlnplot.png"), 
  plot = Vln_plot,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
  )

# Feature scatterplots correlation
cnt_ftr <- FeatureScatter(seurat, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
cnt_mt <- FeatureScatter(seurat, feature1 = "nCount_RNA", feature2 = "percent.mt")

# Save the feature scatterplots output
ggsave(
  here("data/plots/4_cnt_ftr.png"), 
  plot = cnt_ftr,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

ggsave(
  here("data/plots/4_cnt_mt.png"), 
  plot = cnt_mt,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

# Save plot objects
saveRDS(cnt_ftr, here("data/rds_files/4_cnt_ftr.rds"))
saveRDS(cnt_mt, here("data/rds_files/4_cnt_mt.rds"))

# Clear environment
rm(seurat, Vln_plot, cnt_ftr, cnt_mt)
gc()