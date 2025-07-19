#!/bin/bash

# ┌────────────────────────────┐
# │ 🧠 setup.sh — Environment  │
# └────────────────────────────┘

# Colors 🎨
GREEN="\033[0;32m"
RED="\033[0;31m"
BOLD="\033[1m"
RESET="\033[0m"

check_command() {
    command -v "$1" >/dev/null 2>&1
}

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

# Required tools
print_check docker
print_check docker-compose
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
