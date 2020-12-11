.DEFAULT_GOAL := build

project_name = async_app

opam_file = $(project_name).opam

db_uri = "postgresql://admin:secret@localhost:6543/async_app"

.PHONY: build
build: # Build the app
	opam exec dune build

.PHONY: create-switch
create-switch: # Create a local opam switch
	opam switch create . 4.10.0 --deps-only

.PHONY: deps
deps: $(opam_file) # Alias to update the opam file and install the needed deps

.PHONY: fmt
fmt:
	dune build @fmt --auto-promote

.PHONY: test
test:
	@dune test --force

.PHONY: run
run: # Build and run the app
	DATABASE_URL=$(db_uri) dune exec $(project_name)

.PHONY: run-debug
run-debug: # Build and run the app with Opium's internal debug messages visible
	DATABASE_URL=$(db_uri) dune exec $(project_name) -- --debug

.PHONY: migrate
migrate: # Run the database migrations defined in migrate/migrate.ml
	DATABASE_URL=$(db_uri) dune exec migrate

.PHONY: rollback
rollback: # Run the database rollback defined in migrate/rollback.ml
	DATABASE_URL=$(db_uri) dune exec rollback

.PHONY: lock
lock: ## Generate the lock files
	opam lock .

.PHONY: $(opam_file)
$(opam_file): dune-project # Update the package dependencies when new deps are added to dune-project
	-dune build @install        		 # Update the $(project_name).opam file
	opam install . --deps-only  # Install the new dependencies
