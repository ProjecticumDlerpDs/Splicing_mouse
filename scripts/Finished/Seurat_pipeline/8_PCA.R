# 8
# Principal component analysis by Seurat

seurat <- readRDS(here("data/rds_files/7_seurat_scaled.rds"))

seurat <- RunPCA(seurat, features = VariableFeatures(object = seurat), verbose = FALSE)
print(seurat[["pca"]], dims = 1:5, nfeatures = 5)
Elbowplot <- ElbowPlot(seurat)
VizDimplot <- VizDimLoadings(seurat, dim=1:2, reduction = "pca")

# Save the Seurat object & plots
saveRDS(seurat, here("data/rds_files/8_seurat_pca.rds"))

ggsave(
  here("data/plots/8_Elbowplot.png"), 
  plot = Elbowplot,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

ggsave(
  here("data/plots/8_Vizdimplot.png"), 
  plot = VizDimplot,
  width = 1667/ 100, 
  height = 667/ 100, 
  dpi = 100,
  limitsize = FALSE
)

# Clear environment
rm(seurat, Elbowplot, VizDimplot)
rm(list = ls())
gc()
mem_used()