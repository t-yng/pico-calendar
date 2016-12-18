echo "start docker-compose build"
docker-compose build

echo "\n*----- start docker-compose up -d ------*"
docker-compose up -d

echo "\n*----- start run db:create and db:migrate in 30s ------*"
echo "Please wait!"
sleep 30s
docker-compose run web bin/rake db:create db:migrate

# docker-compose stop
# docker-compose rm -f