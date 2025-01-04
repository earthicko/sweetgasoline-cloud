up:
	docker compose up -d

down:
	docker compose down

clean-containers:
	docker container prune -f

clean-images:
	docker image prune -a -f

clean-volumes:
	docker volume prune -f

clean-networks:
	docker network prune -f

clean: clean-containers clean-images clean-volumes clean-networks

.PHONY: up down clean clean-containers clean-images clean-volumes clean-networks
