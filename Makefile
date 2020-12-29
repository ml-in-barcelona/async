.DEFAULT_GOAL := build

project_name = async_app
opam_file = $(project_name).opam
DUNE=opam exec -- dune

.PHONY: build
build:
	# Build the app
	$(DUNE) build @all

.PHONY: install
install:
	# Install the locked dependencies
	opam install --locked --deps-only --with-doc --with-test -y .

.PHONY: install_new_and_lock
install_new_and_lock:
	# Install the new dependencies so that they can be locked after
	opam install --deps-only --with-doc --with-test -y .
	opam lock .

.PHONY: dev
dev:
	# Create a local opam switch and install deps
	opam switch create . 4.10.0 --deps-only
	opam install -y ocaml-lsp-server dune
	make install

.PHONY: watch
watch:
	watchexec -w server \
	--exts re,rei,ml,mli,atd,json -r -c \
	"$(MAKE) run"

.PHONY: fmt
fmt:
	# Format
	$(DUNE) build @fmt --auto-promote

.PHONY: test
test:
	# Run unit tests
	$(DUNE) test --force

.PHONY: run
run:
	$(DUNE) exec $(project_name)

.PHONY: run-debug
run-debug:
	# Build and run the app with Opium's internal debug messages visible
	$(DUNE) exec $(project_name) -- --debug

.PHONY: migrate
migrate:
	# Run the database migrations defined in migrate/migrate.ml
	$(DUNE) exec migrate

.PHONY: rollback
rollback:
	# Run the database rollback defined in migrate/rollback.ml
	$(DUNE) exec rollback

.PHONY: lock
lock:
	# Generate the lock files
	opam lock .

.PHONY: deps
# Alias to update the opam file and install the needed deps
deps: $(opam_file)

.PHONY: clean
clean:
	$(DUNE) clean

# Update the package dependencies when new deps are added to dune-project
$(opam_file): dune-project lock
	$(DUNE) build @install        # Update the $(project_name).opam file
	opam install --locked --deps-only --with-doc --with-test -y .