# SaaS starter
This monorepo contains the frontend and backend services.

## Structure
- `/backend` - Nestjs Backend service
- `/frontend` - Nextjs Frontend application
- `reactjs-boilerplate` - Nextjs Boilerplate Frontend service that connected to Nestjs Backend
- `/openapi` - OpenAPI specification for the backend service

## NestJs Backend
Is a clone of [Nestjs Boilerplate](https://github.com/brocoders/nestjs-boilerplate).

### Features

- [x] Database. Support [TypeORM](https://www.npmjs.com/package/typeorm) and [Mongoose](https://www.npmjs.com/package/mongoose).
- [x] Seeding.
- [x] Config Service ([@nestjs/config](https://www.npmjs.com/package/@nestjs/config)).
- [x] Mailing ([nodemailer](https://www.npmjs.com/package/nodemailer)).
- [x] Sign in and sign up via email.
- [x] Social sign in (Apple, Facebook, Google, Twitter).
- [x] Admin and User roles.
- [x] Internationalization/Translations (I18N) ([nestjs-i18n](https://www.npmjs.com/package/nestjs-i18n)).
- [x] File uploads. Support local and Amazon S3 drivers.
- [x] Swagger.
- [x] E2E and units tests.
- [x] Docker.
- [x] CI (Github Actions).

### Tested Installation

#### Backend Development
. Go to backend folder, and copy `env-example-relational` as `.env`.

   ```bash
   cd backend/
   cp env-example-relational .env
   ```

1. Change `DATABASE_HOST=postgres` to `DATABASE_HOST=localhost`

   Change `MAIL_HOST=maildev` to `MAIL_HOST=localhost`

1. Run additional container:

   ```bash
   docker compose up -d postgres adminer maildev
   ```

2. Install dependency

   ```bash
   npm install
   ```

3. Run migrations

   ```bash
   npm run migration:run
   ```

4. Run seeds

   ```bash
   npm run seed:run:relational
   ```

5. Run app in dev mode

   ```bash
   npm run start:dev
   ```

6. Open <http://localhost:3001>

#### Quick run in Docker
1. Go to backend folder, and copy `env-example-relational` as `.env`.

   ```bash
   cd my-app/
   cp env-example-relational .env
   ```

2. Run containers

   ```bash
   docker compose up -d
   ```

3. For check status run

   ```bash
   docker compose logs
   ```

4. Open <http://localhost:3001>

#### E2E in Docker
1. Go to backend folder, and copy `env-example-relational` as `.env`.

   ```bash
   cd my-app/
   cp env-example-relational .env

3. Run test e2e

   ```bash
   npm run test:e2e:relational:docker
   ```

#### Starting backend in root folder
1. Run prestart:backend

   ```bash
   pnpm prestart:backend
   ```

2. Run start:backend with and without Docker

   ```bash
   pnpm start:backend
   ```

   ```bash
   pnpm start:backend --docker
   ```

## Nextjs Frontend

### Features

- [x] Next.js
- [x] TypeScript
- [x] Tailwind CSS
- [x] Shadcn

## Extensive React Boilerplate
Is a clone of [Nextjs Extensive React Boilerplate](https://github.com/brocoders/extensive-react-boilerplate).

### Features

- [x] Next.js
- [x] TypeScript
- [x] [i18n](https://react.i18next.com/) (based on https://github.com/i18next/next-13-app-dir-i18next-example)
- [x] [Material UI](https://mui.com/). Supports dark mode.
- [x] [React Hook Form](https://react-hook-form.com/)
- [x] React Query
- [x] Auth (Sign in, Sign up, Reset password, Confirm email, Refresh Token)
- [x] User management (CRUD)
- [x] File Upload
- [x] E2E tests ([Playwright](https://playwright.dev/))
- [x] ESLint
- [x] CI (GitHub Actions)

#### Frontend Development
1. Go to frontend folder, and copy `example.env.local` as `.env.local`.

   ```bash
   cd backend/
   cp cp example.env.local .env.local
   ```

2. Run app in dev mode

   ```bash
   snpm run dev
   ```