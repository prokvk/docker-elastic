COMMON_NAME = elastic

IMAGE = $(COMMON_NAME)
NAME = $(COMMON_NAME)
PORTS = -p 9200:9200 -p 9300:9300
# NET = --net=pstruch
VOLUMES = \
	-v $$PWD/app:/usr/src/app

.PHONY: build run stop inspect rm logs ports install test

build:
		docker build -t $(IMAGE) 2.4

run:
		docker run -d $(NET) --name $(NAME) $(ENV_VARS) $(PORTS) $(LINK) $(VOLUMES) $(IMAGE)
		# docker run --rm -it $(NET) --name $(NAME) $(ENV_VARS) $(PORTS) $(LINK) $(VOLUMES) $(IMAGE)

install:
		docker run --rm -it $(NET) --name $(NAME) $(ENV_VARS) $(PORTS) $(LINK) $(VOLUMES) $(IMAGE) npm install --no-bin-links

test:
		docker exec -it $(NAME) bash
		# docker exec -d $(NAME) echo 1

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) bash

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)