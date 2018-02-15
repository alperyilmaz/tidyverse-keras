[![Docker Pulls](https://img.shields.io/docker/pulls/alperyilmaz/tidyverse-keras.svg)](https://hub.docker.com/r/alperyilmaz/tidyverse-keras/) [![Docker Automated buil](https://img.shields.io/docker/automated/alperyilmaz/tidyverse-keras.svg?style=flat-square)](https://hub.docker.com/r/alperyilmaz/tidyverse-keras/) [![Docker Build Statu](https://img.shields.io/docker/build/alperyilmaz/tidyverse-keras.svg?style=flat-square)](https://hub.docker.com/r/alperyilmaz/tidyverse-keras/) [![](https://images.microbadger.com/badges/image/alperyilmaz/tidyverse-keras.svg)](https://microbadger.com/images/alperyilmaz/tidyverse-keras "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/license/alperyilmaz/tidyverse-keras.svg)](https://microbadger.com/images/alperyilmaz/tidyverse-keras "Get your own license badge on microbadger.com")

# tidyverse-keras
Tidyverse from Rocker and Keras

The Dockerfile is little dirty since I kept the left over code to document the pain I went through. The hardest part was the `WORKON_HOME` problem. Even if the environment variable is set via `ENV` in Dockerfile I still needed to add the `echo 'WORKON_HOME = "/tensorflow"' >> /usr/local/lib/R/etc/Renviron ` line so that Rstudio environment also uses the same environment variable.

