# User ID
export USER_ID=`id -u`
export GROUP_ID=`id -g`

DOCKERCOMPO = USER_ID=${USER_ID} GROUP_ID=$(GROUP_ID) docker-compose
DOCKERCOMPORUN = $(DOCKERCOMPO) run --rm --service-ports strapi
DOCKERRUN = $(DOCKERCOMPO) run -d --rm --service-ports strapi
DOCKERNPM = $(DOCKERCOMPORUN) npm
DOCKERYARN = $(DOCKERCOMPORUN) yarn

# Help
.SILENT:
.PHONY: help

help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

##########
# Docker #
##########
docker-up:
	@echo "--> Start docker services"
	$(DOCKERCOMPO) -f docker-compose.production.yml run --rm --service-ports strapi
docker-down:
	@echo "--> Stop docker services"
	$(DOCKERCOMPO) down

########
# Yarn #
########
yarn-install:
	@echo "--> Install dependencies"
	$(DOCKERYARN)
yarn-develop:
	@echo "--> Start develop strapi"
	$(DOCKERYARN) develop
yarn-build:
	@echo "--> Build strapi"
	$(DOCKERYARN) build
