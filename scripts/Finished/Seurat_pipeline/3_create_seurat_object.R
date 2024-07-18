# 3
# Create seurat object

counts <- readRDS(here("data/rds_files/2_counts.rds"))


seurat <- CreateSeuratObject(counts = counts, 
                             project = "splicing", 
                             min.cells = 3, 
                             min.features = 200)

# Save the Seurat object
saveRDS(seurat, here("data/rds_files/3_seurat.rds"))

# Clear environment
rm(counts, seurat)
gc()
