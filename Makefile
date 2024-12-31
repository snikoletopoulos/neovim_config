lint:
	selene .

check-format: CLEAN_ARGS = --check
check-format: format

format:
	stylua $(CLEAN_ARGS) .
