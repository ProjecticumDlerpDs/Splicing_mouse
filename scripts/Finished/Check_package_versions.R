# Script voor het controleren van gebruikte package versies in loop
# Object maken van gebruikte packages
# If-else-loop voor controle of packages geinstalleerd en of laatste versie is
# ophalen van de cran database
# controleren welke versie


# Lijst van packages
packages <- c("Seurat", "here", "ggplot2", "ggrepel", "dplyr", "pheatmap", "RColorBrewer", "Matrix")

# Functie om package versie te controleren 
check_package_version <- function(pkg, cran_db) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    message(paste("Package", pkg, "is not installed."))
  } else {
    installed_version <- packageVersion(pkg)
    cran_pkg <- cran_db[cran_db$Package == pkg, ]
    
    if (nrow(cran_pkg) > 0) {
      latest_version <- cran_pkg$Version[1]  # Gebruik alleen de eerste waarde
      
      message(paste("Package", pkg, "installed version:", installed_version))
      message(paste("Package", pkg, "latest available version:", latest_version))
      
      if (installed_version < latest_version) {
        message(paste("Package", pkg, "is not up-to-date."))
      } else {
        message(paste("Package", pkg, "is up-to-date."))
      }
    } else {
      message(paste("Package", pkg, "not found in available packages."))
    }
  }
}

# Haal de CRAN package database op
cran_db <- tools::CRAN_package_db()

# Controleer de versie van elk package
for (pkg in packages) {
  check_package_version(pkg, cran_db)
}