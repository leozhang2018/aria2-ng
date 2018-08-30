
## Build
```
git clone https://github.com/leozhang2018/aria2-ng.git
cd aria2-ng
docker build -t leozhang2018/aria2-ng .
```

## Install
1. Mount `/DOWNLOAD_DIR` to `/aria2/downloads` and `/CONFIG_DIR` to `/aria2/conf`. When starting container, it will create  `aria2.conf` file with default settings.
2. Mapping ports:
  * 6800 for aira2 service
  * 80 for Aria-Ng http service
3. Set your secret code use "SECRET" variable, this will append `rpc-secret=xxx` to aira2.conf file.

Run command like below(You may need to change the ports).
```
docker run --name aria2-ng \
-p 6800:6800 -p 6880:80  \
-v /DOWNLOAD_DIR:/aria2/downloads \
-v /CONFIG_DIR:/aria2/conf \
-e SECRET=YOUR_SECRET_CODE colinwjd/aria2-ng
```
After finished, open http://serverip:6880/ in your browser for visiting Aria-Ng home page
