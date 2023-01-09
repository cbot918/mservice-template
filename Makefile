
DEVPORT = 8181

APITESTENVNAME = pytest
APITESTNAME = authtest
APITESTENVWORKDIR = /app/apitest


# dev
DEVPATH = auth.go
dev: $(DEVPATH)
	gin --appPort $(DEVPORT) run $(DEVPATH)

run: $(DEVPATH)
	go build .
	./auth.exe

# db-instance
MYSQL_NAME = sql
MYSQL_PASS = 12345
MYSQL_PORT = 8201
mysql-init:
	docker run --name $(MYSQL_NAME) -e MYSQL_ROOT_PASSWORD=$(MYSQL_PASS) -d -p $(MYSQL_PORT):3306 mysql

mysql-client:
	docker exec -it $(MYSQL_NAME) bash


mysql-remove:
	docker stop $(MYSQL_NAME)
	docker container rm $(MYSQL_NAME)

# db-migrate
db-inim:
	mkdir -p db/migration
	migrate create -ext sql -dir db/migration -seq init_schema

db-migrateup:
	migrate -path db/migration -database "mysql://root:12345@172.17.0.6:8201/practice?sslmode=disable" -verbose up

db-migratedown:
	migrate -path db/migration -database "mysql://root:12345@172.17.0.6:8201/practice?sslmode=disable" -verbose down
	

# apitest
apitest-image: ./test/apitest/Dockerfile
	docker build -t $(APITESTENVNAME) ./test/apitest/.

apitest-container: 
	docker run -it -d --name $(APITESTNAME) $(APITESTENVNAME)

apitest-run: ./test/apitest/testcase
	docker exec $(APITESTNAME) rm -rf testcase
	docker exec $(APITESTNAME) mkdir testcase
	docker cp ./test/apitest/testcase/test_apitest.py $(APITESTNAME):$(APITESTENVWORKDIR)/testcase
	docker exec $(APITESTNAME) pytest --capture=no


# unittest
