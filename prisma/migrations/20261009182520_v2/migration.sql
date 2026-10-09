/*
  Warnings:

  - You are about to drop the `patients` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "patients" DROP CONSTRAINT "patients_userId_fkey";

-- DropTable
DROP TABLE "patients";

-- CreateTable
CREATE TABLE "kids" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "contactNumber" TEXT,
    "address" TEXT,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "deletedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "kids_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "kids_email_key" ON "kids"("email");

-- CreateIndex
CREATE UNIQUE INDEX "kids_userId_key" ON "kids"("userId");

-- CreateIndex
CREATE INDEX "idx_patient_email" ON "kids"("email");

-- CreateIndex
CREATE INDEX "idx_patient_isDeleted" ON "kids"("isDeleted");

-- AddForeignKey
ALTER TABLE "kids" ADD CONSTRAINT "kids_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
