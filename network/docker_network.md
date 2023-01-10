HOST OS 無法用IP直接接觸container內
container也無法直接IP接觸HOST OS
-
解法：
外到內: 走 localhost
內到外: 使用docker提供的api
```
$ docker run -it --add-host=a.b.c:host-gateway alpine sh
$ curl a.b.c:port/ping
```
目前只測win, 還沒試過linux


from docker curl to outside hostOS
https://medium.com/@TimvanBaarsen/how-to-connect-to-the-docker-host-from-inside-a-docker-container-112b4c71bc66
docker run -it --add-host=a.b.c:host-gateway alpine sh
curl a.b.c:port/ping


教學
https://ithelp.ithome.com.tw/m/articles/10262180
https://ithelp.ithome.com.tw/articles/10206725