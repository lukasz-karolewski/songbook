FROM ubuntu:18.04

## for apt to be noninteractive
RUN export DEBIAN_FRONTEND=noninteractive; \
    export DEBCONF_NONINTERACTIVE_SEEN=true; \
    echo 'tzdata tzdata/Areas select Etc' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Etc select UTC' | debconf-set-selections; \
    apt-get update -qqy \
 && apt-get install -qqy --no-install-recommends \
        tzdata \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN apt update
RUN apt install -y texlive texlive-latex-base texlive-latex-recommended texlive-latex-extra \
texlive-lang-english texlive-lang-french texlive-lang-polish \
texlive-xetex texlive-luatex \
python3 python3-pip

RUN pip3 install patacrep

WORKDIR /home/ubuntu

ENTRYPOINT [ "songbook" ]