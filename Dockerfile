FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget

RUN wget https://github.com/alexdobin/STAR/archive/2.7.3a.tar.gz \
    && tar xvzf 2.7.3a.tar.gz \
    && rm 2.7.3a.tar.gz \
    && cd STAR-2.7.3a/source \
    && make STAR

RUN apt-get update && apt-get install -y bowtie2

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && pip3 install snakemake


RUN apt-get update && apt-get install -y r-base \
    && R -e "install.packages('ggplot2', repos='https://cran.rstudio.com/')" 

COPY code.py /app/code.py

CMD ["python3", "/app/code.py"]