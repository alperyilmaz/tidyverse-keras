[![Docker Pulls](https://img.shields.io/docker/pulls/alperyilmaz/tidyverse-keras.svg)](https://hub.docker.com/r/alperyilmaz/tidyverse-keras/) [![Docker Automated buil](https://img.shields.io/docker/automated/alperyilmaz/tidyverse-keras.svg?style=flat-square)](https://hub.docker.com/r/alperyilmaz/tidyverse-keras/) [![Docker Build Statu](https://img.shields.io/docker/build/alperyilmaz/tidyverse-keras.svg?style=flat-square)](https://hub.docker.com/r/alperyilmaz/tidyverse-keras/) [![](https://images.microbadger.com/badges/image/alperyilmaz/tidyverse-keras.svg)](https://microbadger.com/images/alperyilmaz/tidyverse-keras "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/license/alperyilmaz/tidyverse-keras.svg)](https://microbadger.com/images/alperyilmaz/tidyverse-keras "Get your own license badge on microbadger.com")

# tidyverse-keras
Tidyverse from Rocker and Keras

The Dockerfile is little dirty since I kept the left over code to document the pain I went through. The hardest part was the `WORKON_HOME` problem. Even if the environment variable is set via `ENV` in Dockerfile I still needed to add the `echo 'WORKON_HOME = "/tensorflow"' >> /usr/local/lib/R/etc/Renviron ` line so that Rstudio environment also uses the same environment variable.

## adding multiple users with persistent folders

In AWS, ssh to ec2 instance, in home folder, create folders for user1 and user2 then start container

```
$ sudo docker run -d -p 8787:8787 -v $(pwd)/user1:/home/user1 -v $(pwd)/user2:/home/user2 alperyilmaz/tidyverse-keras
```

While container is running, run the following command

```
$ sudo docker exec -it <container_name> bash
```

Within the container, issue the following commands. `chown` is needed since user's home directoty already existed and user does not own it (yet)

```
# adduser user1
# chown -R user1 /home/user1
# adduser user2
# chown -R user2 /home/user2
```
