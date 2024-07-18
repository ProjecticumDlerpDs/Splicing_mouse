# 9
# PCA and UMAP visualisation

seurat <- readRDS(here("data/rds_files/8_seurat_pca.rds"))

seurat <- RunUMAP(seurat, dims = 1:15, verbose = FALSE)
seurat <- FindNeighbors(seurat, dims = 1:15, verbose = FALSE)
seurat <- FindClusters(seurat, verbose = FALSE)
Dimplot1 <- DimPlot(seurat, label = TRUE)
Dimplot2 <- DimPlot(seurat, reduction = "pca", label = TRUE)



# Save the Seurat object
saveRDS(seurat, here("data/rds_files/9_seurat_dim_reduction.rds"))

ggsave(
  here("data/plots/9_UMAP.png"), 
  plot = Dimplot1,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

ggsave(
  here("data/plots/9_PCA.png"), 
  plot = Dimplot2,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

# Clear environment
rm(seurat, Dimplot1, Dimplot2)
rm(list = ls())
gc()