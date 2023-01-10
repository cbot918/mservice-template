
# db-instance
MYSQL_NAME = sql
MYSQL_PASS = 12345
MYSQL_PORT = 5058
MYSQL_INITDB = test-db
mysql-init:
	docker run --name $(MYSQL_NAME) -e MYSQL_ROOT_PASSWORD=$(MYSQL_PASS) -d -p $(MYSQL_PORT):3306 mysql

mysql-client:
	docker exec -it $(MYSQL_NAME) bash


mysql-remove:
	docker stop $(MYSQL_NAME)
	docker container rm $(MYSQL_NAME)

# db-migrate
MYSQL_ADDRESS = localhost
MIGRA_PATH = db/migration
db-inim:
	mkdir -p db/migration
	migrate create -ext sql -dir db/migration -seq init_schema

db-migrateup:
	migrate -path $(MIGRA_PATH) -database "mysql://root:$(MYSQL_PASS)@$(MYSQL_ADDRESS):$(MYSQL_PORT)/$(MYSQL_INITDB)?sslmode=disable" -verbose up

db-migratedown:
	migrate -path $(MIGRA_PATH) -database "mysql://root:$(MYSQL_PASS)@$(MYSQL_ADDRESS):$(MYSQL_PORT)/$(MYSQL_INITDB)?sslmode=disable" -verbose down
	

