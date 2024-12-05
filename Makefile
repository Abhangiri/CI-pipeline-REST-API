# Makefile

.PHONY: build test lint docker-login docker-build-push

build:
	@echo "Installing dependencies..."
	pip install -r requirements.txt

test:
	@echo "Running tests..."
	pytest tests/

lint:
	@echo "Performing code linting..."
	flake8 app/ tests/

docker-login:
	@echo "Logging in to Docker..."
	echo "${DOCKER_PASSWORD}" | docker login --username ${DOCKER_USERNAME} --password-stdin

docker-build-push:
	@echo "Building and pushing Docker image..."
	docker build -t ${DOCKER_USERNAME}/ci_pipeline_api:latest .
	docker push ${DOCKER_USERNAME}/ci_pipeline_api:latest
