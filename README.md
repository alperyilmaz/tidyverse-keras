# tidyverse-keras
Tidyverse from Rocker and Keras

The Dockerfile is little dirty since I kept the left over code to document the pain I went through. The hardest part was the `WORKON_HOME` problem. Even if the environment variable is set via `ENV` in Dockerfile I still needed to add the `echo 'WORKON_HOME = "/tensorflow"' >> /usr/local/lib/R/etc/Renviron ` line so that Rstudio environment also uses the same environment variable.

