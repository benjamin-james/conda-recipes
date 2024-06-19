#!/usr/bin/env Rscript

installExtraPackages <- function(upgrade="never", seurat=TRUE, ...) {
### Reinstall seurat
    if (seurat) {
        remotes::install_github("satijalab/seurat-object", "v5.0.2", upgrade=upgrade, ...)
        remotes::install_github("satijalab/seurat", "v5.1.0", upgrade=upgrade, ...)
        remotes::install_github("satijalab/seurat-data", "seurat5", upgrade=upgrade, ...)
        remotes::install_github("satijalab/seurat-wrappers", "seurat5", upgrade=upgrade, ...)
        remotes::install_github("stuart-lab/signac", "1.13.0", upgrade=upgrade, ...)
        tryCatch({
            ### For some reason the github refs/branches do not work
            remotes::install_github("satijalab/azimuth", "0.5.0", upgrade=upgrade, ...)
        }, error=function(cond) {
            print("Using bare Azimuth install")
            remotes::install_github("satijalab/azimuth", upgrade=upgrade, ...)
        })
    }
### Tools
    devtools::install_github('cole-trapnell-lab/monocle3', upgrade=upgrade, ...)
    devtools::install_github('cole-trapnell-lab/cicero-release', ref='monocle3', upgrade=upgrade, ...)
    devtools::install_github('scverse/anndataR', upgrade=upgrade, ...)
    devtools::install_github('bnprks/BPCells', upgrade=upgrade, ...)
    devtools::install_github('chrchang/plink-ng', subdir='2.0/pgenlibr', upgrade=upgrade, ...)
    devtools::install_github('GreenleafLab/ArchR', ref='master', repos=BiocManager::repositories(), upgrade=upgrade, ...)
    devtools::install_github("caleblareau/gchromVAR", upgrade=upgrade, ...)
    devtools::install_github("sankaranlab/SCAVENGE", upgrade=upgrade, ...)
    BiocManager::install("SNPlocs.Hsapiens.dbSNP155.GRCh38")
    ArchR::installExtraPackages()
    devtools::install_github('lhe17/nebula', upgrade=upgrade, ...)
}

if (sys.nframe() == 0L) {
    installExtraPackages(upgrade=Sys.getenv("upgrade", "never"), seurat=toupper(Sys.getenv("seurat", "true")) %in% c("TRUE", "T"))
}
