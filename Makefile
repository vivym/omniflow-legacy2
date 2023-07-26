.PHONY: all init format lint build build_frontend install_frontend run_frontend run_backend dev help tests coverage

all: help

init:
	@echo 'Installing pre-commit hooks'
	git config core.hooksPath .githooks
	@echo 'Making pre-commit hook executable'
	chmod +x .githooks/pre-commit
	@echo 'Installing backend dependencies'
	make install_backend
	@echo 'Installing frontend dependencies'
	make install_frontend

install_frontend:
	cd src/frontend && pnpm i

run_frontend:
	cd src/frontend && pnpm dev

frontend:
	make install_frontend
	make run_frontend

help:
	@echo '----'
	@echo 'format              - run code formatters'
	@echo 'lint                - run linters'
	@echo 'install_frontend    - install the frontend dependencies'
	@echo 'build_frontend      - build the frontend static files'
	@echo 'run_frontend        - run the frontend in development mode'
	@echo 'run_backend         - run the backend in development mode'
	@echo 'build               - build the frontend static files and package the project'
	@echo 'publish             - build the frontend static files and package the project and publish it to PyPI'
	@echo 'dev                 - run the project in development mode with docker compose'
	@echo 'tests               - run the tests'
	@echo 'coverage            - run the tests and generate a coverage report'
	@echo '----'
