#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 60s;


docker-compose exec -T api bash -c "npx prisma migrate deploy"
docker-compose exec -T api bash -c "npx prisma generate"