# User ID
export USER_ID=`id -u`
export GROUP_ID=`id -g`

DOCKERCOMPO = USER_ID=${USER_ID} GROUP_ID=$(GROUP_ID) docker-compose
DOCKERRUN = $(DOCKERCOMPO) run -d --rm --service-ports strapi
DOCKERNPM = $(DOCKERRUN) npm
DOCKERYARN = $(DOCKERRUN) yarn

# Help
.SILENT:
.PHONY: help

help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

##########
# Docker #
##########
docker-down:
	@echo "--> Start docker services"
	$(DOCKERCOMPO) down

########
# Yarn #
########
yarn-develop:
	@echo "--> Start docker services"
	$(DOCKERYARN) develop
