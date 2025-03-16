FORMATTER_ARGS = --check

all: format lint

lint:
	@echo "Running lint checks..."
	@selene .

format:
	@echo "Formatting code..."
	@stylua $(FORMATTER_ARGS) .

.PHONY: all lint format
