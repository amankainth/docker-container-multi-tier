# Docker Multi-Tier PHP Application

A clean, containerized multi-tier stack featuring a PHP backend, MariaDB database, and phpMyAdmin for database administration.

## 🚀 Architecture
- **Web Tier**: PHP 8.2 (Apache)
- **Database Tier**: MariaDB 10.6.4
- **Management Tier**: phpMyAdmin

## 📋 Setup & Deployment (AWS EC2 / Linux)

### 1. Install Docker & Git
```bash
# Update the system
sudo yum update -y

# Install Git and Docker
sudo yum install -y git docker
sudo systemctl start docker
sudo systemctl enable docker

# Install Docker Compose
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL [https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname](https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname) -m) -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
```

### 2. Deploy the Application
```bash
# Clone your project
sudo git clone [https://github.com/amankainth/docker-container-multi-tier.git](https://github.com/amankainth/docker-container-multi-tier.git) /opt/myapp
cd /opt/myapp

# Fix buildx requirement and start stack
sudo curl -SL [https://github.com/docker/buildx/releases/download/v0.17.1/buildx-v0.17.1.linux-amd64](https://github.com/docker/buildx/releases/download/v0.17.1/buildx-v0.17.1.linux-amd64) -o /usr/local/lib/docker/cli-plugins/docker-buildx
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-buildx
sudo docker compose up --build -d
```

## 🔍 Useful Docker Commands
```bash
# Check status of running containers
sudo docker compose ps

# View real-time logs for all services
sudo docker compose logs -f

# List all local Docker images
sudo docker images

# Stop and remove containers
sudo docker compose down
```

## ⚙️ Configuration
- **Database Name**: `example`
- **Username**: `root`
- **Password**: `password`

## 📂 Project Structure
```text
.
├── backend/            # PHP Source Code & Dockerfile
├── compose.yaml        # Infrastructure Orchestration
└── .gitignore          # Git ignore rules
```

---
Amandeep Kainth
