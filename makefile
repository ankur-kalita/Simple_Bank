postgres:
	 docker run --name postgresLa -p 6543:5432 -e POSTGRES_PASSWORD=secret -e POSTGRES_USER=root -d postgres
createdb:
	docker exec -it postgresLa createdb --username=root --owner=root simple_bank
dropdb:
	docker exec -it postgresLa dropdb simple_bank
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:6543/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:6543/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown