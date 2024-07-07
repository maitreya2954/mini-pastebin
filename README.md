# Mini Pastebin

Mini Pastebin is a full-stack web application where users can create, edit, view, and delete code snippets. The project consists of a React frontend, a Node.js/Express backend, and a PostgreSQL database. The application is fully containerized using Docker, with both frontend and backend services running alongside a PostgreSQL database.

## Features

- Create, view, edit, and delete code snippets.
- Snippets contain a title, code content, and language information.
- Responsive frontend built with React.
- RESTful API built using Node.js and Express.
- PostgreSQL database to store snippets.
- Containerized with Docker for easy deployment and setup.
- CI/CD ready with Docker Compose to manage the multi-container setup.

## Tech Stack

- **Frontend**: React, SCSS, Axios
- **Backend**: Node.js, Express, Sequelize ORM
- **Database**: PostgreSQL
- **Infrastructure**: Docker, Docker Compose
- **Other Tools**: dotenv for environment management, body-parser for request handling

### Database

PostgreSQL is used as the database, and the schema is managed using Sequelize ORM.

- **Table**: `snippets`
  - `id`: Primary key
  - `title`: Title of the snippet
  - `content`: Code content
  - `language`: Programming language of the snippet

## Getting Started

### Prerequisites

Make sure you have the following installed on your machine:

- [Docker](https://www.docker.com/get-started)
- [Node.js](https://nodejs.org/) (if you want to run the project outside Docker)
- [npm](https://www.npmjs.com/get-npm) (included with Node.js)
  
### Setup

1. **Clone the repository**

```bash
git clone https://github.com/maitreya2954/mini-pastebin.git
cd mini-pastebin
```

Update `.env` file inside the main folder (as per your postgresql config):

```env
DB_NAME=my_pastebin_db
DB_USER=myuser
DB_PASSWORD=mypassword
```


3. **Run the application with Docker**

Make sure Docker is installed and running on your machine, then run the following command to build and start the containers:

```bash
docker-compose up --build
```

This command will:
- Build and run the frontend on `http://localhost:3000`
- Build and run the backend on `http://localhost:5000`
- Spin up a PostgreSQL database