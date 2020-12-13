up-dbs:
	docker-compose up

ps-dbs:
	docker-compose ps

rm-dbs:
	- docker-compose rm -fs

build-app:
	docker build -t mtc .

run-app:
	docker run -it --rm \
	    --name mtc \
	    --link mysql:mysql \
	    --link clickhouse:clickhouse \
	    --network mysql-to-clickhouse_default \
	    mtc
