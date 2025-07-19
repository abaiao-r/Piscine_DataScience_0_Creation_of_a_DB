# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: andrefrancisco <andrefrancisco@student.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/07/19 13:36:40 by andrefranci       #+#    #+#              #
#    Updated: 2025/07/19 14:52:20 by andrefranci      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


up:
	docker-compose --env-file .env up

down:
	docker-compose --env-file .env down

psql:
	docker exec -it postgres psql -U $(shell grep POSTGRES_USER .env | cut -d '=' -f2) -d $(shell grep POSTGRES_DB .env | cut -d '=' -f2)

logs:
	docker-compose logs -f

stop:
	docker-compose --env-file .env stop

clean:
	docker-compose --env-file .env down --volumes --rmi all

fclean: clean
	docker system prune -a --volumes --force

re: fclean up

info:
	@echo "Containers:"
	@docker ps -a
	@echo "------------------------------------------------------------"
	@echo "Images:"
	@docker images -a
	@echo "------------------------------------------------------------"
	@echo "Volumes:"
	@docker volume ls
	@echo "------------------------------------------------------------"
	@echo "Networks:"
	@docker network ls
	@echo "------------------------------------------------------------"

.PHONY: up down psql logs stop clean fclean re info
