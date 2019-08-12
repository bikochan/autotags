all: fmt validate docs

.PHONY: init fmt validate docs

init:
	if [[ ! -d .terraform ]]; then terraform init; fi

fmt:
	terraform fmt

valiate: init
	terraform validate

docs:
	terraform-docs md . > README.md
