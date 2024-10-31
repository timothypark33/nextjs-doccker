rm -rf ./.next
rm -rf ./node_modules
rm -rf ./deploy_target_to_remote
yarn install
yarn build

# 폴더 생성
mkdir -p deploy_target_to_remote
mkdir -p ./.next/standalone/static
mkdir -p ./.next/standalone/.next/public

# standalone build 대응
#cp -r ./public ./.next/standalone/public
#cp -r ./.next/static ./.next/standalone/.next/static

# 일반 build
cp .env.development ecosystem.config.js package.json yarn.lock Dockerfile.dev docker-compose-dev.yml deploy_target_to_remote 
cp -r .next public deploy_target_to_remote

## 배포 후 docker 실행
cd deploy_target_to_remote
docker ps -q | xargs -r docker stop && docker ps -aq | xargs -r docker rm && docker images -q | xargs -r docker rmi && docker volume prune -f && docker network prune -f && docker builder prune -a -f
docker compose -f docker-compose-dev.yml up --build