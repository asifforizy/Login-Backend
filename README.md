
# Login Backend — Authentication API

A RESTful authentication backend built with Express.js and TypeScript. This project is designed to practice and implement credential-based authentication, Google OAuth, email verification, and password recovery using a modular backend architecture.

## Features

- **User Registration** — Register using email and password.
- **Credential Login** — Authenticate users with email and password.
- **Google OAuth** — Support Google-based authentication.
- **Email Verification** — Verify user email addresses using OTP.
- **Token Management** — Generate and refresh access and refresh tokens.
- **Logout** — Handle user logout and authentication cookie clearing.
- **Forgot Password** — Request password recovery.
- **Reset Password** — Reset passwords through the recovery flow.
- **Authenticated User** — Retrieve the current authenticated user's information.
- **Role-Based Access Control** — Support `USER`, `ADMIN`, and `SUPER_ADMIN` roles.
- **Input Validation** — Validate incoming requests using Zod.
- **Secure Password Hashing** — Hash passwords using bcrypt.
- **HTTP-Only Cookies** — Manage authentication tokens using cookies.
- **Redis OTP Storage** — Store temporary OTP and registration data.
- **Modular Architecture** — Organize the backend into maintainable modules.

## Tech Stack

- **Node.js** — JavaScript runtime
- **Express.js** — Backend framework
- **TypeScript** — Type safety
- **PostgreSQL** — Relational database
- **Prisma ORM 7** — Database access and schema management
- **JWT** — Token-based authentication
- **bcrypt** — Password hashing
- **Zod** — Request validation
- **Redis** — Temporary OTP and registration data
- **Google OAuth** — Google authentication
- **Nodemailer** — Email delivery
- **EJS** — Email templates

## Live API

**Base URL:** https://login-backend-five-chi.vercel.app

**API Prefix:** `/api/v1/auth`

## API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| POST | `/api/v1/auth/register` | Register with credentials |
| POST | `/api/v1/auth/verify-email` | Verify email address |
| POST | `/api/v1/auth/login` | Login with credentials |
| POST | `/api/v1/auth/refresh-token` | Refresh authentication tokens |
| POST | `/api/v1/auth/logout` | Logout user |
| GET | `/api/v1/auth/google` | Start Google OAuth |
| GET | `/api/v1/auth/google/callback` | Handle Google OAuth callback |
| POST | `/api/v1/auth/forgot-password` | Request password recovery |
| POST | `/api/v1/auth/reset-password` | Reset password |
| GET | `/api/v1/auth/me` | Get authenticated user |

**Note:** Authentication routes may require cookies or other authentication credentials. The Google OAuth flow uses browser redirects rather than a standard JSON response for every step.

## Getting Started

### 1. Clone the Repository

```bash
git clone <YOUR_BACKEND_REPOSITORY_URL>
cd <YOUR_PROJECT_DIRECTORY>
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Configure Environment Variables

Create a `.env` file in the project root and configure the environment variables required by your application.

Typical configuration includes:

```env
PORT=5000
NODE_ENV=development

DATABASE_URL=your_postgresql_connection_string

JWT_ACCESS_SECRET=your_access_token_secret
JWT_REFRESH_SECRET=your_refresh_token_secret

REDIS_URL=your_redis_connection_url

GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret

APP_URL=http://localhost:3000
```

Configure your email credentials and any additional variables required by your existing application.

Use the exact variable names expected by your configuration files. The names above are examples and may need to be adjusted to match your codebase.

### 4. Configure the Database

Make sure PostgreSQL is running and your database connection is configured.

Run Prisma migrations using the scripts configured in your project. For a standard Prisma 7 setup:

```bash
npx prisma migrate dev
npx prisma generate
```

If your project uses a custom Prisma schema location or a different generation script, use the corresponding configuration.

### 5. Start the Development Server

```bash
npm run dev
```

The server will start on the configured port, typically `http://localhost:5000`.

### 6. Build for Production

```bash
npm run build
```

Start the compiled application using your configured production script, for example:

```bash
npm start
```

## Authentication Flow

### Credential Authentication

1. A user submits registration details.
2. The backend validates the request.
3. The password is hashed before being stored.
4. An email verification OTP is generated and sent when required.
5. The user verifies their email.
6. The user logs in using their credentials.
7. The backend issues authentication tokens and manages them through the configured cookie flow.

### Google OAuth

1. The frontend initiates Google authentication.
2. The user authenticates through Google.
3. Google redirects the browser to the configured callback URL.
4. The backend processes the OAuth response and identifies or registers the user.
5. The backend establishes the application's authentication session.

### Password Recovery

1. The user requests a password reset.
2. The backend initiates the configured verification process.
3. The user submits the required verification information and new password.
4. The backend validates the request and updates the password.

## Project Architecture

The project follows a modular architecture to separate responsibilities and improve maintainability.

A typical module contains:

- **Routes** — Define API endpoints.
- **Controllers** — Handle HTTP requests and responses.
- **Services** — Implement authentication and business logic.
- **Validation** — Validate request data with Zod.
- **Middleware** — Handle authentication, authorization, and errors.
- **Prisma** — Communicate with the PostgreSQL database.

## Security Considerations

- Passwords are hashed before storage.
- Authentication tokens are managed through the configured token and cookie flow.
- Request data is validated before processing.
- Protected endpoints require appropriate authentication.
- Role-based authorization restricts access to protected resources.
- Secrets and database credentials should be stored in environment variables, never committed to Git.
- Production deployments should use HTTPS and appropriately configured secure cookies and CORS.

## Project Purpose

This is a learning and practice project focused on understanding authentication backend development with Express.js, TypeScript, Prisma ORM, PostgreSQL, and Google OAuth.

The project demonstrates common authentication workflows and modular API development.

## License

Created for educational and personal practice.