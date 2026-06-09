/*
  Warnings:

  - You are about to drop the column `timeZone` on the `users` table. All the data in the column will be lost.
  - Made the column `emailVerified` on table `users` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "users" DROP COLUMN "timeZone",
ALTER COLUMN "emailVerified" SET NOT NULL,
ALTER COLUMN "emailVerified" SET DATA TYPE VARCHAR(200);
