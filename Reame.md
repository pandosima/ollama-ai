# Ollama Docker Deployment
This repopsitory contains the necessary files and instructions to deploy Ollama using Docker. The deployment is designed to be straightforward, allowing you to get Ollama up and running quickly.

## Configuration
Copy the `ci/docker.env.example` file to `docker.env` and modify the environment variables as needed.

## Run the services
To start the services, run the following command:
```bash
docker compose --env-file docker.env up -d