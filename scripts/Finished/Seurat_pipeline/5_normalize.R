# 5
# LogNormalization data

seurat <- readRDS(here("data/rds_files/4_seurat_data_quality.rds"))

seurat <- subset(seurat, subset = nFeature_RNA > 2000 & nFeature_RNA < 12000 & percent.mt < 5)
seurat <- NormalizeData(seurat, normalization.method = "LogNormalize", scale.factor = 10000)
Vln_plot <- VlnPlot(seurat, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)

# Save the Seurat object
saveRDS(seurat, here("data/rds_files/5_seurat_normalize.rds"))
ggsave(
  here("data/plots/5_Vlnplot.png"), 
  plot = Vln_plot,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)


# Clear environment
rm(seurat, Vln_plot)
gc()