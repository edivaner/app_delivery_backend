/*
  Warnings:

  - Made the column `customerAddressId` on table `clients` required. This step will fail if there are existing NULL values in that column.
  - Made the column `amount` on table `stock` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "clients" ALTER COLUMN "customerAddressId" SET NOT NULL;

-- AlterTable
ALTER TABLE "stock" ALTER COLUMN "amount" SET NOT NULL,
ALTER COLUMN "saleValue" DROP NOT NULL;
