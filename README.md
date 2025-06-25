# Guests Node.js Backend Application

A Node.js backend application built with Express.js for managing guests and party registrations, using Prisma ORM with MySQL database.

## Features

- Guest creation 
- Party creation 
- Guest-Party registration system
- RESTful API endpoints
- MySQL database with Prisma ORM

## Prerequisites

- Node.js
- MySQL database
- npm

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Ahmadfbq/guests-nodejs
   cd guests-nodejs
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   Create a `.env` file in the root directory:
   ```env
   DATABASE_URL="mysql://username:password@localhost:3307/database_name"
   ```

4. **Generate Prisma client**
   ```bash
   npx prisma generate
   ```

5. **Run database migrations**
   ```bash
   npx prisma migrate dev
   ```

6. **Start the application**
   ```bash
   node app.js
   ```

The server will start on `http://localhost:3000` (or your configured port).

## Database Schema

The application uses three main models:

- **Guest**: `id`, `name`
- **Party**: `id`, `name`, `location`, `dateTime`, `attendanceCount`
- **GuestParty**: `guestId`, `partyId` (junction table for many-to-many relationship)

## Technology Stack

- **Backend**: Node.js with Express.js
- **Database**: MySQL
- **ORM**: Prisma
- **Language**: JavaScript
- **Testing**: Postman for API testing

## API Endpoints

### 3.1 Add a Guest

**Endpoint:** `POST /api/guests`

**Request Body:**
```json
{
  "name": "Ahmad"
}
```

**Response:**
```json
{
  "id": 1,
  "name": "Ahmad"
}
```

### 3.2 Add a Party

**Endpoint:** `POST /api/parties`

**Request Body:**
```json
{
  "name": "Birthday Party",
  "location": "Community Center",
  "dateTime": "2024-01-15T18:00:00Z",
  "attendanceCount": 0 //optional
}
```

**Response:**
```json
{
  "id": 1,
  "name": "Birthday Party",
  "location": "Community Center",
  "dateTime": "2024-01-15T18:00:00.000Z",
  "attendanceCount": 0
}
```

### 3.3 Register a Guest to a Party

**Endpoint:** `POST /api/registrations`

**Request Body:**
```json
{
  "guestId": 1,
  "partyId": 1,
}
```

**Response:**
```json
{
    "message": "Guest registered to party"
}
```

### 3.4 Unregister a Guest from a Party

**Endpoint:** `DELETE /api/registrations`

**Request Body:**
```json
{
  "guestId": 1,
  "partyId": 1
}
```
 
**Response:**
```json
{
  "message": "Guest unregistered from party"
}
```

## Testing with Postman

### 3.1 Add a Guest - Postman Screenshot
*![Add a Guest](<resources/Screenshot 2025-06-25 181312.png>)*

### 3.2 Add a Party - Postman Screenshot
*![Add a Party](<resources/Screenshot 2025-06-25 181337.png>)*

### 3.3 Register Guest to Party - Postman Screenshot
*![Register Guest to Party](<resources/Screenshot 2025-06-25 181522.png>)*

### 3.4 Unregister Guest from Party - Postman Screenshot
*![Unregister Guest from Party](<resources/Screenshot 2025-06-25 181714.png>)*
