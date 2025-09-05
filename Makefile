
GREEN=\033[0;32m
VIOLET=\033[0;35m
NC=\033[0m

.PHONY: clean
clean:
	rm -rf htmlcov
	pip uninstall -y package_foobar

.PHONY test:
test:
	@echo "$(GREEN)Running unit tests$(NC)"
	@cd package_foobar && coverage run --source=package_foobar -m unittest discover -v -b -s .

code_coverage: test
	@echo "$(GREEN)Generating code coverage report$(NC)"
	@cd package_foobar && coverage html

.PHONY: format
format:
	@echo "$(GREEN)Formatting repository$(NC)"
	pre-commit run --all-files

.PHONY: lint
lint:
	@echo "$(GREEN)Linting repository$(NC)"
	pylint ./package_foobar/


validate: format lint code_coverage
	pip install --force-reinstall -e package_foobar
	@echo "$(VIOLET)Check that the package is importable$(NC)"
	@python3 -c "import package_foobar"
	@echo "$(GREEN)OK$(NC)"
