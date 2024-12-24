#!/bin/bash

echo "🚀 Starting ChoreHero Backend..."

# Check if we want to use Docker
if [ "$1" = "--docker" ]; then
    echo "Starting with Docker..."
    
    # Go to backend folder
    cd backend

    # Copy env-example-relational as .env if it doesn't exist
    if [ ! -f .env ]; then
        echo "📝 Creating .env file from example..."
        cp env-example-relational .env
    fi

    # Run test e2e
    echo "🧪 Running E2E tests in Docker..."
    npm run test:e2e:relational:docker

else
    echo "Starting without Docker..."
    
    # Change to the backend directory
    cd "$(dirname "$0")/../backend"

    # Create .env file if it doesn't exist
    if [ ! -f .env ]; then
        echo "📝 Creating .env file from example..."
        cp env-example-relational .env
    fi

    # Update database and mail configuration in .env
    sed -i '' 's/DATABASE_HOST=.*/DATABASE_HOST=localhost/g' .env
    sed -i '' 's/MAIL_HOST=.*/MAIL_HOST=localhost/g' .env

    # Function to check if postgres is ready
    wait_for_postgres() {
        echo "⏳ Waiting for PostgreSQL to be ready..."
        # Get credentials from .env file
        source .env
        until docker compose exec -e PGPASSWORD=$DATABASE_PASSWORD postgres psql -U $DATABASE_USERNAME -d $DATABASE_NAME -c '\q' 2>/dev/null; do
            echo "PostgreSQL is unavailable - sleeping"
            sleep 1
        done
        echo "✅ PostgreSQL is ready!"
    }

    # Stop and remove existing containers
    echo "🧹 Cleaning up existing containers..."
    docker compose down -v

    # Clean PostgreSQL data
    echo "🗑️ Cleaning PostgreSQL data..."
    rm -rf .docker/postgres-data

    # Start required services using environment from .env
    echo "🐳 Starting Docker services..."
    docker compose up -d postgres adminer maildev

    # Wait for PostgreSQL to initialize
    echo "⏳ Waiting for PostgreSQL to initialize..."
    sleep 10

    # Wait for PostgreSQL to be ready
    wait_for_postgres

    # Install dependencies
    echo "📦 Installing dependencies..."
    pnpm install

    # Run migrations
    echo "🔄 Running migrations..."
    pnpm run migration:run

    # Run seeds
    echo "🌱 Running seeds..."
    pnpm run seed:run:relational

    # Start the application
    echo "🚀 Starting the application..."
    pnpm run start:dev
fi