# 2
# Load data

features <- read.csv(here("data/raw_data/e85_feature_metadata.csv.gz"))
samples <- read.csv(here("data/raw_data/e85_sample_metadata.csv"))

counts <- ReadMtx(here("data/raw_data/e85_count_matrix.mtx.gz"), 
                  here("data/raw_data/e85_sample_metadata.csv"),
                  here("data/raw_data/e85_feature_metadata.csv.gz"),
                  feature.sep = ",",
                  cell.sep = ",",
                  cell.column = 3,
                  feature.column = 1,
                  skip.cell = 1,
                  skip.feature = 1)

# Save intermediate data
saveRDS(features, here("data/rds_files/2_features.rds"))
saveRDS(samples, here("data/rds_files/2_samples.rds"))
saveRDS(counts, here("data/rds_files/2_counts.rds"))

# Clear environment
rm(features, samples, counts)
gc()
