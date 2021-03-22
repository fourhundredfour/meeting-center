DOCKER_COMPOSE=docker-compose -f docker-compose.yml
.PHONY: push
push:
	${DOCKER_COMPOSE} push

.PHONY: dev
dev:
	${DOCKER_COMPOSE} -f docker-compose.dev.yml up -d --build

.PHONY: down
down:
	${DOCKER_COMPOSE} -f docker-compose.dev.yml down

.PHONY: clean
clean:
	${DOCKER_COMPOSE} -f docker-compose.dev.yml down --rmi all --remove-orphans
