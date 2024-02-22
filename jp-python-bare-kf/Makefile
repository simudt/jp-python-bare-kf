TAG ?= $(shell git describe --tags --always --dirty)
REGISTRY ?= gcr.io/<PROJECT>

docker-build-jupyter:
	$(MAKE) docker-build -C ../jupyter TAG=${TAG}

docker-build: docker-build-jupyter
	docker build -t ${REGISTRY}/jupyter-python-bare:${TAG} --build-arg BASE_IMG=${REGISTRY}/jupyter-latest:${TAG} -f cpu.Dockerfile . --platform=linux/amd64

docker-push:
	docker push ${REGISTRY}/jupyter-python-bare:${TAG}
