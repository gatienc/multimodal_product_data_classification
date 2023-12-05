.PHONY: clean data lint requirements sync_data_to_s3 sync_data_from_s3

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_NAME = Multimodal Product Data Classification
DESCRIPTION = A short description of Multimodal Product Data Classification.
REPO_NAME = multimodal_product_data_classification
LICENCE= No license file
AUTHOR= Gatien CHENU
VIRTUAL_ENV= venv


#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Install Python Dependencies
requirements: test_environment
	python3 -m pip install -U pip setuptools wheel
	python3 -m pip install -r requirements.txt

## Delete all compiled Python files
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

## Lint using flake8
lint:
	flake8 src


## Set up python interpreter environment
create_environment:
ifeq ($(VIRTUAL_ENV), poetry)

	@echo '>>> Installing virtual environment for $(PROJECT_NAME), using poetry"
	poetry init --no-interaction
	echo '[tool.poetry]\
	name = "$(PROJECT_NAME)"\
	version = "0.1.0"\
	description = "$(DESCRIPTION)"\
	authors = ["$(AUTHOR) <you@example.com>"]\
	readme = "README.md"\
	license = "$(LICENCE)"\
	readme = "README.md"\
	homepage = "https://github.com/$(REPO_NAME)"\
	repository = "https://github.com/$(REPO_NAME)"\

	[tool.poetry.dependencies]\
	python = "^3.10"\

	[build-system]\
	requires = ["poetry-core"]\
	build-backend = "poetry.core.masonry.api""
	' > pyproject.toml


else ifeq ($(VIRTUAL_ENV), venv)


	if [ -d ./.venv ]; \
		then \
			echo ">>> Virtual environment for $(REPO_NAME) already exists"; \
		else \
			echo ">>> Installing virtual environment for $(REPO_NAME)"; \
			python3 -m venv ./.venv; \
			echo ">>> New virtualenv created at ./.venv"; \
			echo ">>> Activate with:\nsource ./.venv/bin/activate"; \
			./.venv/bin/pip install -r requirements.txt; \
		fi
else
	@echo ">>> virtual_env must be either 'venv' or 'poetry'"
endif

# ## Test python environment is setup correctly
# test_environment:
# 	python3 test_environment.py

#################################################################################
# PROJECT RULES                                                                 #
#################################################################################



#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := help

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
# 	* save line in hold space
# 	* purge line
# 	* Loop:
# 		* append newline + line to hold space
# 		* go to next line
# 		* if line starts with doc comment, strip comment character off and loop
# 	* remove target prerequisites
# 	* append hold space (+ newline) to line
# 	* replace newline plus comments by `---`
# 	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
.PHONY: help
help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@echo
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \

			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')
