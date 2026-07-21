# Docker Multi-Tier PHP Application

A clean, containerized multi-tier stack featuring a PHP backend, MariaDB database, and phpMyAdmin for database administration.

## 🚀 Architecture
- **Web Tier**: PHP 8.2 (Apache)
- **Database Tier**: MariaDB 10.6.4
- **Management Tier**: phpMyAdmin

## 📋 Prerequisites
- Docker & Docker Compose installed on your host system.

## 🛠️ Quick Start

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/amankainth/docker-container-multi-tier.git](https://github.com/amankainth/docker-container-multi-tier.git)
   cd docker-container-multi-tier
   ```

2. **Launch the stack:**
   ```bash
   sudo docker compose up --build -d
   ```

3. **Access the application:**
   - **PHP App**: `http://<YOUR_SERVER_IP>:80`
   - **phpMyAdmin**: `http://<YOUR_SERVER_IP>:8080`

## ⚙️ Configuration
The database credentials are managed via the `compose.yaml` file:
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

