#!/bin/bash

# ┌────────────────────────────┐
# │ 🧠 setup.sh — Environment  │
# └────────────────────────────┘
#
# This script checks if required tools (Docker, Docker Compose, psql)
# are installed on the system and guides the user to install missing ones.

# Colors for output 🎨
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
RESET="\033[0m"

# Function to check if a command exists
check_command() {
    command -v "$1" >/dev/null 2>&1
}

# Function to print check result for a command
print_check() {
    if check_command "$1"; then
        echo -e "${GREEN}✅ $1 is installed${RESET}"
    else
        echo -e "${RED}❌ $1 is NOT installed${RESET}"
        MISSING_TOOLS=true
    fi
}

echo -e "${BOLD}🔍 Checking required tools...${RESET}"

MISSING_TOOLS=false

# Check for Docker
print_check docker

# Check for Docker Compose: try both 'docker compose' (newer) and 'docker-compose' (older)
if check_command "docker"; then
    # Check if 'docker compose' works
    if docker compose version >/dev/null 2>&1; then
        echo -e "${GREEN}✅ docker compose is available${RESET}"
    elif check_command "docker-compose"; then
        echo -e "${GREEN}✅ docker-compose is installed${RESET}"
    else
        echo -e "${RED}❌ Docker Compose is NOT installed${RESET}"
        MISSING_TOOLS=true
    fi
else
    # If docker is missing, docker compose check is skipped (already caught)
    :
fi

# Check for PostgreSQL client (psql)
print_check psql

if [ "$MISSING_TOOLS" = true ]; then
    echo -e "\n${RED}❌ Some tools are missing.${RESET}"
    echo -e "${BOLD}💡 Please install them manually:${RESET}"
    echo -e "- Docker: https://docs.docker.com/get-docker/"
    echo -e "- Docker Compose: https://docs.docker.com/compose/install/"
    echo -e "- PostgreSQL client (psql): sudo apt install postgresql-client"
    exit 1
else
    echo -e "\n${GREEN}🎉 All required tools are installed! You're good to go.${RESET}"
fi

echo -e "\n${BOLD}🚀 Run 'make up' to start the project.${RESET}"
