/*
  Warnings:

  - Added the required column `customerAddressId` to the `clients` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "clients" ADD COLUMN  "customerAddressId" TEXT DEFAULT NULL;

-- CreateTable
CREATE TABLE "customerAddress" (
    "id" TEXT,
    "street" TEXT,
    "neighborhood" TEXT,
    "number" TEXT,
    "city" TEXT,
    "reference" TEXT,

    CONSTRAINT "customerAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "order" (
    "id" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "totalDiscountValue" DOUBLE PRECISION,
    "totalSalesValue" DOUBLE PRECISION,
    "clientsId" TEXT NOT NULL,
    "affiliateId" TEXT NOT NULL,

    CONSTRAINT "order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "itemOrder" (
    "id" TEXT NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "saleValue" DOUBLE PRECISION NOT NULL,
    "discountValue" DOUBLE PRECISION NOT NULL,
    "orderId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "itemOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imagem" TEXT,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "category" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "productId" TEXT,

    CONSTRAINT "category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "affililiate" (
    "id" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "headquarters" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "affililiate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stock" (
    "id" TEXT NOT NULL,
    "amount" DOUBLE PRECISION,
    "cost" DOUBLE PRECISION,
    "saleValue" DOUBLE PRECISION NOT NULL,
    "productId" TEXT NOT NULL,
    "affililiateId" TEXT NOT NULL,

    CONSTRAINT "stock_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "category_name_key" ON "category"("name");

-- AddForeignKey
ALTER TABLE "clients" ADD CONSTRAINT "clients_customerAddressId_fkey" FOREIGN KEY ("customerAddressId") REFERENCES "customerAddress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_clientsId_fkey" FOREIGN KEY ("clientsId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "order" ADD CONSTRAINT "order_affiliateId_fkey" FOREIGN KEY ("affiliateId") REFERENCES "affililiate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "itemOrder" ADD CONSTRAINT "itemOrder_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "itemOrder" ADD CONSTRAINT "itemOrder_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "category" ADD CONSTRAINT "category_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_productId_fkey" FOREIGN KEY ("productId") REFERENCES "product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stock" ADD CONSTRAINT "stock_affililiateId_fkey" FOREIGN KEY ("affililiateId") REFERENCES "affililiate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
