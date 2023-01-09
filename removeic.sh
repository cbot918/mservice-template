
EX_WEBC="ex_webc"
EX_WEB2C="ex_webc2"
EX_MYSQLC="ex_mysqlc"
EX_ADMINERC="ex_adminerc"

EX_WEBI="ex_webi"
EX_WEB2I="ex_webi2"
# EX_MYSQLI="ex_mysqli"
EX_ADMINERI="adminer"



# dlsca(){
#     docker ps -a | grep $EX_WEBC
# }
# dlsca

# remove 
drmc(){
    docker container stop $EX_WEBC
    docker container rm $EX_WEBC

    docker container stop $EX_WEB2C
    docker container rm $EX_WEB2C

    docker container stop $EX_MYSQLC
    docker container rm $EX_MYSQLC

    docker container stop $EX_ADMINERC
    docker container rm $EX_ADMINERC
}
drmc

drmi(){
    docker image rm $EX_WEBI
    docker image rm $EX_WEB2I
    docker image rm $EX_ADMINERI
}
drmi