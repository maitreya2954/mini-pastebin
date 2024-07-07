# Mini Pastebin Backend

This is the backend for the Mini Pastebin project. It is a Node.js/Express application that provides a RESTful API for managing code snippets. The backend uses PostgreSQL as the database, and Sequelize as the ORM (Object-Relational Mapping) to interact with the database.

## Features

- REST API to create, view, edit, and delete code snippets.
- Snippets contain a title, code content, and language information.
- PostgreSQL database for persistent data storage.
- Sequelize ORM for database interactions.
- Dockerized for easy deployment and setup.

## Tech Stack

- **Backend**: Node.js, Express, Sequelize ORM
- **Database**: PostgreSQL
- **Other Tools**: dotenv for environment management, body-parser for parsing request bodies

## Getting Started

### Prerequisites

Make sure you have the following installed on your machine:

- [Node.js](https://nodejs.org/) (with npm)
- [PostgreSQL](https://www.postgresql.org/) (if not using Docker)
- [Docker](https://www.docker.com/get-started) (if running the project in a container)

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/maitreya2954/mini-pastebin.git
cd backend
```

2. **Install dependencies**

```bash
npm install
```

3. **Set up environment variables**

Create a `.env` file in the root of the backend directory with the following content:

```env
DB_NAME=my_pastebin_db
DB_USER=myuser
DB_PASSWORD=mypassword
DB_HOST=localhost
DB_PORT=5432
PORT=5000
```

4. **Run the application locally**

To start the backend server:

```bash
npm run start
```

This will start the backend server at `http://localhost:5000`.

### API Endpoints

The following API endpoints are available:

- **GET /api/snippets**: Get all code snippets.
- **GET /api/snippets/:id**: Get a specific snippet by ID.
- **POST /api/snippets**: Create a new snippet.
- **PUT /api/snippets/:id**: Update a snippet by ID.
- **DELETE /api/snippets/:id**: Delete a snippet by ID.