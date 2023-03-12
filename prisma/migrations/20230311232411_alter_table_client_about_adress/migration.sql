-- DropForeignKey
ALTER TABLE "clients" DROP CONSTRAINT "clients_customerAddressId_fkey";

-- AlterTable
ALTER TABLE "clients" ALTER COLUMN "customerAddressId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "clients" ADD CONSTRAINT "clients_customerAddressId_fkey" FOREIGN KEY ("customerAddressId") REFERENCES "customerAddress"("id") ON DELETE SET NULL ON UPDATE CASCADE;
