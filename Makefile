all:
	docker build --no-cache -t anarchotect/apt-cacher-ng .

push:
	docker push anarchotect/apt-cacher-ng

up:
	docker-compose -f apt-cacher-ng.yml up --force-recreate -d

down:
	docker-compose -f apt-cacher-ng.yml down --remove-orphans

enter:
	sudo docker exec -it apt-cacher-ng.yml /bin/bash
