all: build run

build:
	@docker compose -f ./srcs/docker-compose.yml build

run:
	@docker compose -f srcs/docker-compose.yml up -d

check:
	@docker ps -a

clean:
	@docker compose -f srcs/docker-compose.yml down

fclean: clean
	docker system prune -a -f

re: fclean all

.PHONY: all build run check clean fclean re