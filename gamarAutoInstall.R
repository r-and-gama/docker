#!/usr/bin/env Rscript

installed_packages <- row.names(installed.packages())
if (! "devtools" %in% installed_packages) install.packages("devtools")
#if (! "gamar" %in% installed_packages) devtools::install_github("r-and-gama/gamar")

installed.packages()
#setup_gama("/usr/lib/gama")