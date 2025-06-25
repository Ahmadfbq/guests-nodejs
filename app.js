const express = require('express');
const { PrismaClient } = require('@prisma/client');

const app = express();
const prisma = new PrismaClient();

app.use(express.json());

app.post('/guests', async (req, res) => {
    const { name } = req.body;
    const guest = await prisma.guest.create({ data: { name } });
    res.json(guest);
});

app.post('/parties', async (req, res) => {
    const { name, location, dateTime } = req.body;
    const party = await prisma.party.create({ data: { name, location, dateTime: new Date(dateTime) } });
    res.json(party);
});

app.post('/register', async (req, res) => {
    const {guestId, partyId} = req.body;
    await prisma.guestParty.create({ data: { guestId, partyId } });

    await prisma.party.update({
        where: { id: partyId },
        data: { attendanceCount: { increment: 1 } }
    });

    res.json({ message: 'Guest registered to party'});
});

app.delete('/unregister', async (req, res) => {
    const { guestId, partyId } = req.body;
    await prisma.guestParty.delete({
        where: { guestId_partyId: { guestId, partyId } }
    });

    await prisma.party.update({
        where: { id: partyId },
        data: { attendanceCount: { decrement: 1 } }
    });

    res.json({ message: 'Guest unregistered from party' });
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});