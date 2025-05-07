.DEFAULT_GOAL := test

.PHONY: clean
clean:
	rm -rf .venv .git/hooks/pre-commit

.venv:
	poetry env remove --all
	poetry config virtualenvs.in-project true
	poetry install

.PHONY: pre-commit
pre-commit: .venv
	.venv/bin/python -m pre_commit install

.PHONY: tests
tests: pre-commit
	.venv/bin/pytest tests
