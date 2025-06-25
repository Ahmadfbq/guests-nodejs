/*
  Warnings:

  - Made the column `name` on table `guest` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `guest` MODIFY `name` VARCHAR(255) NOT NULL;

-- CreateTable
CREATE TABLE `Party` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `dateTime` DATETIME(3) NOT NULL,
    `attendanceCount` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GuestParty` (
    `guestId` INTEGER NOT NULL,
    `partyId` INTEGER NOT NULL,

    PRIMARY KEY (`guestId`, `partyId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `GuestParty` ADD CONSTRAINT `GuestParty_guestId_fkey` FOREIGN KEY (`guestId`) REFERENCES `Guest`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GuestParty` ADD CONSTRAINT `GuestParty_partyId_fkey` FOREIGN KEY (`partyId`) REFERENCES `Party`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
