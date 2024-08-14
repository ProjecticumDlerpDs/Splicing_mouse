# Laad CSV-bestand 'e85_count_matrix.csv.gz' in
data <- read.csv("~/projecticum/Splicing_mouse/data/raw_data/e85_count_matrix.csv.gz", header = TRUE, row.names = 1)

library(Matrix)

# Converteer de dataset naar een Matrix-object
data_matrix <- as.matrix(data)

# Converteer de dataset naar een Matrix-object
data_dgCMatrix <- as(data_matrix, "dgCMatrix")

# Sla bestand op als e85_count_matrix.mtx
writeMM(data_dgCMatrix, "~/projecticum/Splicing_mouse/data/raw_data/e85_convert_count_matrix.mtx.gz")

# Controleer of het bestand is opgeslagen
file.exists("~/projecticum/Splicing_mouse/data/raw_data/e85_convert_count_matrix.mtx.gz")

