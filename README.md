# Express.js with Prisma 7 Installation

Follow these steps to create and configure an Express.js project using TypeScript, Prisma 7, PostgreSQL, and the Prisma PostgreSQL adapter.

## 1. Create a New Project

```bash
mkdir hello-prisma
cd hello-prisma
```

## 2. Initialize the Node.js Project

```bash
npm init -y
```

## 3. Install TypeScript Dependencies

```bash
npm install typescript tsx @types/node --save-dev
```

Initialize the TypeScript configuration:

```bash
npx tsc --init
```

## 4. Install Prisma Development Dependencies

```bash
npm install prisma@prev @types/pg --save-dev
```

## 5. Install Prisma Client and PostgreSQL Dependencies

```bash
npm install @prisma/client@7 @prisma/adapter-pg pg dotenv
```

## 6. Initialize Prisma

Initialize Prisma and configure the generated Prisma Client output directory:

```bash
npx prisma init --output ../generated/prisma
```

## 7. Create the Database

Create the PostgreSQL database using the configured database connection:

```bash
npx create-db
```

Make sure your `.env` file contains a valid database connection string before continuing.

Example:

```env
DATABASE_URL="postgresql://username:password@localhost:5432/hello-prisma"
```

## 8. Create the First Migration

Run the initial Prisma migration:

```bash
npx prisma migrate dev --name init
```

## 9. Generate Prisma Client

Generate the Prisma Client:

```bash
npx prisma generate
```

## 10. Start the Development Server

Start the application in development mode:

```bash
npm run dev
```

## Complete Installation Commands

You can also run the commands in sequence:

```bash
mkdir hello-prisma
cd hello-prisma

npm init -y

npm install typescript tsx @types/node --save-dev

npx tsc --init

npm install prisma@prev @types/pg --save-dev

npm install @prisma/client@7 @prisma/adapter-pg pg dotenv

npx prisma init --output ../generated/prisma

npx create-db

npx prisma migrate dev --name init

npx prisma generate

npm run dev
```