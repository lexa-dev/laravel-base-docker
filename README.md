## Getting Started

Follow the instructions below to set up your project.

### Запуск контейнера
- Клонируем репу
```
git clone https://github.com/lexa-dev/laravel-base-docker.git
```

- Копируем файл .env и устанавливаем в них необходимые параметры для бд (в в каждом из этих файлов):
```
cp .env.example .env
cp src/.env.example .env
```
- Устанавливаем нужные права пользователя к конкретной базе данных (пользователь и бд берутся из .env, но только не рутовые!)
```
//Заходим в контейнер с базой в саму базу под рутом
docker exec -it mysql mysql -uroot -p

// Устанавливаем права на базу и пользователя
GRANT ALL PRIVILEGES ON <db_name>.* TO 'user_name'@'%';
FLUSH PRIVILEGES;
EXIT;

exit
```

- Заходим в контейнер с php и вы полняем миграции
```
docker exec -it php bash
php artisan migrate
```

- Открываем сайт по адресу: ```localhost:8001```