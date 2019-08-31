FROM rocker/tidyverse

LABEL maintainer="alperyilmaz@gmail.com"

ENV WORKON_HOME /tensorflow

RUN apt-get update && apt-get install -y --no-install-recommends libpython2.7 python-pip virtualenv zlib1g-dev \
    && rm /var/lib/dpkg/info/* \
    && rm /var/lib/apt/lists/*debian*

RUN mkdir /tensorflow \
    && virtualenv --system-site-packages /tensorflow
    

RUN . /tensorflow/bin/activate 
# RUN conda create -n tensorflow
#    && pip install h5py pydot tensorflow tensorboard keras

RUN echo 'WORKON_HOME = "/tensorflow"' >> /usr/local/lib/R/etc/Renviron 

RUN installGithub.r rstudio/reticulate rstudio/keras

#RUN echo 'TENSORFLOW_PYTHON = "/tensorflow/bin/python"' >> /usr/local/lib/R/etc/Renviron \
#&& echo 'RETICULATE_PYTHON = "/tensorflow/bin/python"' >> /usr/local/lib/R/etc/Renviron 

RUN git clone https://github.com/rstudio/keras.git && cp -r keras/vignettes/examples /home/rstudio && rm -r keras/

RUN > rscript.R \
    && echo 'tensorflow::install_tensorflow()' >> rscript.R \
    && echo 'keras::install_keras()' >> rscript.R \
    && echo 'reticulate::py_discover_config("keras")' >> rscript.R \
    && echo 'reticulate::py_discover_config("tensorflow")' >> rscript.R \
    && Rscript rscript.R \
    && rm -rf /tmp/Rtmp*/downloaded_packages/* \
    && rm -rf /tmp/downloaded_packages/* \
    && rm -rf /home/rstudio/.cache/pip \
    && rm -rf /root/.cache/pip
    
