DOCKER_USERNAME ?= shaodan
APPLICATION_NAME ?= aleo-rush

.PHONY: build push run clean
 
build:
	docker build -t ${DOCKER_USERNAME}/${APPLICATION_NAME} apool/
	# docker build -t ${DOCKER_USERNAME}/${APPLICATION_NAME}:f2pool f2pool/

push:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}

run:
	docker run -it --rm ${DOCKER_USERNAME}/${APPLICATION_NAME}


clean:
	# docker builder prune --all -f
	docker image prune -f
