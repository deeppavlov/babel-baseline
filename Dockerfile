FROM ubuntu:16.04
MAINTAINER Valentin Malykh <valentin@ipavlov.ai>
# based on nematus-docker from Tom Kocmi <kocmi@ufal.mff.cuni.cz>

RUN apt-get update && apt-get install -y \
	cmake \
	git \
	python \
	python3 \
	vim \
	nano \
	python-dev \
	python-pip \
	python-pygraphviz \
	xml-twig-tools \
	wget \
	sed

RUN pip install --upgrade pip

RUN pip install numpy numexpr cython theano tables bottle bottle-log tornado

RUN mkdir -p /path/to
WORKDIR /path/to/

# Install mosesdecoder
RUN git clone https://github.com/moses-smt/mosesdecoder

# Install subwords
RUN git clone https://github.com/rsennrich/subword-nmt

# Install nematus
RUN git clone https://github.com/rsennrich/nematus
WORKDIR /path/to/nematus
RUN python setup.py install

RUN mkdir /en-de
WORKDIR /en-de
RUN wget http://data.statmt.org/rsennrich/wmt16_systems/en-de/model.npz
RUN wget http://data.statmt.org/rsennrich/wmt16_systems/en-de/model.npz.json
RUN wget http://data.statmt.org/rsennrich/wmt16_systems/en-de/ende.bpe
RUN wget http://data.statmt.org/rsennrich/wmt16_systems/en-de/truecase-model.en
RUN wget http://data.statmt.org/rsennrich/wmt16_systems/en-de/vocab.de.json
RUN wget http://data.statmt.org/rsennrich/wmt16_systems/en-de/vocab.en.json

RUN wget https://gist.githubusercontent.com/madrugado/d8a24410ff45c36fa1980614521cbc9e/raw/309b0622266338c7ce3fc8a1acf13b53a2555243/translate.sh 
RUN chmod a+x translate.sh

# playground will contain user defined scripts, it should be run as:
# docker run -v `pwd`:/data -it basel-baseline
RUN mkdir /data

CMD ["./translate.sh"]
