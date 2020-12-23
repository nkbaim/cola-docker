# if docker images was run on an old kernel, use ubuntu:16.04 (rstudio/r-base:4.0-xenial) to build this image
# otherwise, use r-base directly

FROM rstudio/r-base:4.0-xenial
RUN apt-get update
RUN apt-get install -y libcairo-dev libxt-dev libssl-dev libcurl4-openssl-dev libxml2-dev
RUN echo 'options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")' >> ~/.Rprofile
RUN echo 'options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))' >> ~/.Rprofile
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('cola')"
RUN R -e "BiocManager::install('Biobase')"
RUN R -e "install.packages(c('NMF','rio'))"
RUN R -e "BiocManager::install('genefilter')"
