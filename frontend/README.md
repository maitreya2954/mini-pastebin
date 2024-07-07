# Mini Pastebin Frontend

This is the frontend for the Mini Pastebin project. It is a React-based web application that allows users to create, edit, view, and delete code snippets. The application communicates with the backend API to manage snippets, and the user interface is responsive and styled using SCSS.

## Features

- Display all code snippets.
- Create a new snippet.
- Edit and delete existing snippets.
- View details of a single snippet.
- SCSS for styling.
- Axios for API calls to the backend.

## Tech Stack

- **Frontend**: React, SCSS, Axios
- **Other Tools**: React Router for navigation, Axios for API calls

## Getting Started

### Prerequisites

Make sure you have the following installed on your machine:

- [Node.js](https://nodejs.org/) (with npm)
- [Docker](https://www.docker.com/get-started) (if you want to run the project in a container)

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/maitreya/mini-pastebin.git
cd frontend
```

2. **Install dependencies**

```bash
npm install
```

3. **Run the app locally**

To start the development server:

```bash
npm start
```

This will run the app at `http://localhost:3000`.

### Building the app

To build the app for production:

```bash
npm run build
```

The production-ready files will be available in the `build` directory.

## Docker

The frontend is fully containerized using Docker. To run the frontend in a Docker container:

1. **Build the Docker image**

```bash
docker build -t mini-pastebin-frontend .
```

2. **Run the Docker container**

```bash
docker run -p 3000:80 mini-pastebin-frontend
```

Now, the frontend will be available at `http://localhost:3000`.
