AC_INIT([conda-recipes], [0.0.1])

#AC_ARG_ENABLE([CONDA_PREFIX], [Environment variable designating the current conda prefix], 
### Check for Conda prefix and conda command
AC_ARG_VAR([CONDA_PREFIX], [CONDA_PREFIX environment variable is not set. Please set it before configuring.])

AC_DEFUN([AC_CHECK_MAMBA_OR_CONDA], [
    AC_PATH_PROG([MAMBA], [mamba])
    if test -z "$MAMBA"; then
        AC_PATH_PROG([CONDA], [conda])
        if test -z "$CONDA"; then
            AC_MSG_ERROR([Neither Mamba nor Conda is installed.])
        else
            AC_MSG_NOTICE([Using Conda at $CONDA.])
        fi
    else
        AC_MSG_NOTICE([Using Mamba at $MAMBA.])
    fi
])

AC_CHECK_MAMBA_OR_CONDA

### Check for OS based compiler packages
dnl AC_CANONICAL_HOST
dnl AC_MSG_CHECKING([for operating system $host_os])
dnl case "$host_os" in
dnl   *linux*)
dnl     AC_MSG_RESULT([Linux detected])
dnl     AC_SUBST([CC], [conda-forge::gcc_linux-64])
dnl     AC_SUBST([CXX], [conda-forge::gxx_linux-64])
dnl     AC_SUBST([FC], [conda-forge::gfortran_linux-64])
dnl     ;;
dnl   *darwin*)
dnl     AC_MSG_RESULT([Mac OS X detected])
dnl     AC_SUBST([CC], [conda-forge::clang_osx-64])
dnl     AC_SUBST([CXX], [conda-forge::clangxx_osx-64])
dnl     AC_SUBST([FC], [conda-forge::gfortran_osx-64])
dnl     ;;
dnl   *)
dnl     AC_MSG_RESULT([Other OS, using default])
dnl     AC_SUBST([CC], [conda-forge::c-compiler])
dnl     AC_SUBST([CXX], [conda-forge::cxx-compiler])
dnl     AC_SUBST([FC], [conda-forge::fortran-compiler])
dnl     ;;
dnl esac

### Check CUDA version
AC_DEFUN([AX_CUDA_VERSION], [
    AC_CHECK_PROG([NVCC_FOUND], [nvcc], [yes], [no])
    if test "x$NVCC_FOUND" = "xyes"; then
        CUDA_VERSION=`nvcc --version | grep "release" | sed 's/.*release //' | sed 's/,.*//'`
	AC_MSG_NOTICE([Using CUDA version $CUDA_VERSION])
    else
        CUDA_VERSION="null"
	AC_MSG_NOTICE([Not using CUDA])
    fi
    AC_SUBST([CUDA_VERSION], [$CUDA_VERSION])
])

AX_CUDA_VERSION

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [PYTORCH_VERSION="- pytorch::pytorch-cuda=$CUDA_VERSION"],
    [PYTORCH_VERSION="- conda-forge::pytorch=*=*cpu*"])
AC_SUBST(PYTORCH_VERSION)

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [TENSORFLOW_VERSION="- conda-forge::tensorflow-gpu"],
    [TENSORFLOW_VERSION="- conda-forge::tensorflow-cpu"])
AC_SUBST(TENSORFLOW_VERSION)

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [CPUONLY=""],
    [CPUONLY="- pytorch::cpuonly"])
AC_SUBST(CPUONLY)

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [NVIDIA_CHANNEL="- nvidia"],
    [NVIDIA_CHANNEL=""])
AC_SUBST(NVIDIA_CHANNEL)

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [TORCH_CHANNEL="pytorch"],
    [TORCH_CHANNEL="conda-forge"])
AC_SUBST(TORCH_CHANNEL)

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [FAISS_VERSION="- pytorch::faiss-gpu"],
    [FAISS_VERSION="- conda-forge::faiss-cpu"])
AC_SUBST(FAISS_VERSION)

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [PYXGB_VERSION="- conda-forge::py-xgboost-gpu"],
    [PYXGB_VERSION="- conda-forge::py-xgboost-cpu"])
AC_SUBST(PYXGB_VERSION)

AS_IF([test "x$CUDA_VERSION" != "xnull"],
    [TORCHAUDIO_VERSION="- pytorch::torchaudio"],
    [TORCHAUDIO_VERSION=""])
AC_SUBST(TORCHAUDIO_VERSION)


### Components
## 1. essentials: hdf5, gsl, cairo, eigen, armadillo git tbb
## 2. python essentials: pandas numpy numba cython scikit-learn statsmodels h5py tqdm seaborn matplotlib  kneed pytables pyarrow
## 3. python networks leidenalg python-infomap python-igraph networkx fa2 faiss python-annoy 
## 4. Genomics essentials: htslib samtools bcftools 
## 3. R essentials r-base r-devtools r-tidyverse r-matrix r-gridextra r-hdf5r r-gsl r-rcppgsl
## 4. 
## 2. optional: bioconductor
## 3. optional: c++
## 4. optional: programming: jupyterlab, rstudio, pandoc, nbconvert
## 5. optional: plink{1,2}
## 6. python
## 7. pytorch
## 8.  gpu: faiss, xgboost
## 9. python genomics: pyranges, pybedtools, pysam, pytabix, pybiomart, pyjaspar
## 10. seurat
## 11. rstats
## 12. archr

AC_CONFIG_FILES([chungus/3_torch.yml])
AC_CONFIG_FILES([cellbender/cellbender.yml])
AC_CONFIG_FILES([chrombpnet/chrombpnet.yml])
AC_OUTPUT

