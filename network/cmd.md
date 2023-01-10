```
$ docker inspect _container | grep -i ipaddress
$ docker network 
$ docker network inspect bridge
```

# hostname
vim etc/hostname put a.b.c
```
$ hostname
$ hostname -b   // help
$ hostname -s   //a
$ hostname -d   //b.c
```

# net-tools
```
$ sudo apt install net-tools
```
tcp connect
a: $ nc -l -p 8000
b: $ nc localhost 8000

web server
a: $ while true; do nc -l -p 8000 < test.html; done
b: $ curl --http0.9 localhost:8000