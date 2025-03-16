all: format lint

lint:
	@echo "Running lint checks..."
	@selene .

check-format:
	@echo "Check if code needs formating..."
	@stylua --check .

format:
	@echo "Formatting code..."
	@stylua .

.PHONY: all lint format
