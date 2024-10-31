docker compose -f docker-compose-dev.yml up --build

docker ps -q | xargs -r docker stop && docker ps -aq | xargs -r docker rm && docker images -q | xargs -r docker rmi && docker volume prune -f && docker network prune -f && docker builder prune -a -f