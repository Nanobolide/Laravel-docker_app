Laravel Docker App
Prérequis
Installer Docker : Instructions d'installation

Installer Docker Compose : Instructions d'installation

Cloner le projet
Clonez le projet :

bash
Copier
Modifier
git clone https://github.com/Nanobolide/Laravel-docker_app.git
cd Laravel-docker_app
Configuration
Assurez-vous que le fichier .env est bien configuré pour MySQL :

ini
Copier
Modifier
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=gestion_parcauto
DB_USERNAME=root
DB_PASSWORD=secret
Lancer l'application avec Docker
Démarrez les conteneurs :

bash
Copier
Modifier
docker-compose up --build
L'application sera accessible à http://localhost:8000.

Exécuter des commandes Artisan
Accédez au conteneur Laravel :

bash
Copier
Modifier
docker exec -it laravel-docker bash
Lancez des commandes Artisan :

bash
Copier
Modifier
php artisan <command>
Accéder à MySQL
Connectez-vous à MySQL :

bash
Copier
Modifier
docker exec -it mysql-db mysql -u root -p
Entrez le mot de passe secret.

Arrêter les conteneurs
Arrêtez les conteneurs :

bash
Copier
Modifier
docker-compose down
Dépannage
Vérifiez les logs :

bash
Copier
Modifier
docker logs laravel-docker
docker logs mysql-db
