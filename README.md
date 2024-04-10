# Laravel 11 KeyDB Cluster Demo

This is a demo application showcasing Laravel 11 working with a KeyDB cluster using Laravel Sail.

## Prerequisites

Before getting started, make sure you have the following installed on your machine:

- Docker
- Docker Compose
- Git
- PHP 8.1 and above
- Composer 2.x

## Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/anabeto93/laravel11-keydb-cluster.git l11-cluster-app
    ```

2. Change directory to the App
    ```bash
    cd l11-cluster-app
    ```

3. Copy the .env file over
    ```bash
    cp .env.example .env
    ```

4. Install Composer with `composer install`

5. Start the containers using Laravel Sail
    ```bash
    ./vendor/bin/sail up
    ```
   Be patient and allow it to run full course until all containers are running. You can also try
    ```bash
    ./vendor/bin/sail up -d
    ```

6. From the `create_cluster.sh` script to start up the redis-cluster
    ```bash
    ./create_cluster.sh
    ```
   Ensure to accept the default configuration suggested.

7. Now try accessing the application over the port you defined with `APP_PORT` and if you haven't defined one, edit the `.env` and define an unused port on your machine eg `APP_PORT=7070`

Now, if this application works for you, take a look in the `config/database.php` file and notice the changes made to the default `database.redis` configs. You can replace `default1` with `default` and `cache1` with `cache` which are the true defaults provided by Laravel and try running the application again.

This time round, there should be an error regarding connection refused.