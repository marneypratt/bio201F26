# Project Data Analysis for Bio 201 - Fall 2026

### by Marney Pratt

### Last updated on October 13, 2026

This webpage details how to download the Project Data Analysis for Bio 201 set of activities.

It is assumed that you have access to R and Rstudio.


## Download this repository from GitHub using the usethis package

This series of instructions will copy all the files you need from here on GitHub to your computer or cloud-based RStudio.

1.  In RStudio, install the usethis package by typing this code into the RStudio console and press Enter:

`install.packages("usethis")`

2.  Once the package is installed, then you need to load usethis. This is similar to opening an app on your phone or computer. To load usethis, type this code into the RStudio console and press Enter:

`library(usethis)`

3.  To download the repository, use this code:

`use_course("https://github.com/marneypratt/bio201F26/archive/main.zip")`

4.  When told "Downloading into..." "OK to proceed?" select the number for the option next to "I agree" or similar positive response and note what directory it is putting the zipped file into.

5.  When asked "Shall we delete the ZIP file" select the number for the option that says "Definitely" or similar positive response

A new session of RStudio will open with the unzipped folder containing all the files you need ready for you.

If you are working on your desktop, make sure you have the following packages installed before you run through this activity:

* `tidyverse`
* `ggbeeswarm`
* `usethis`
* `gt`
* `patchwork`
* `rstatix`
* `ggpubr`
* `labelled`
* `ggstats`


