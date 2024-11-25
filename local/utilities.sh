#!/bin/bash

# Shell Utilities Collection
# Version: 1.0.0
# Author: Jaimin Modi
# A collection of useful shell utilities for daily development and system administration tasks

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Archive Extractor
# Usage: ex <file>
ex() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No file specified${NC}"
        echo -e "${BLUE}Usage: ex <file>${NC}"
        return 1
    fi

    if [ ! -f "$1" ]; then
        echo -e "${RED}Error: '$1' is not a valid file${NC}"
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar x "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
        *.zip)       unzip "$1"       ;;
        *.Z)         uncompress "$1"  ;;
        *.7z)        7z x "$1"        ;;
        *.xz)        unxz "$1"        ;;
        *.lzma)      unlzma "$1"      ;;
        *)
            echo -e "${RED}Error: '$1' cannot be extracted via ex()${NC}"
            echo -e "${BLUE}Supported formats: tar.bz2, tar.gz, bz2, rar, gz, tar, tbz2, tgz, zip, Z, 7z, xz, lzma${NC}"
            return 1
            ;;
    esac
    echo -e "${GREEN}Successfully extracted $1${NC}"
}

# Process Grep - Find processes matching a pattern
# Usage: psgrep <pattern>
psgrep() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No search pattern specified${NC}"
        echo -e "${BLUE}Usage: psgrep <pattern>${NC}"
        return 1
    fi

    local result
    result=$(ps aux | grep -i "$1" | grep -v "grep")
    if [ -z "$result" ]; then
        echo -e "${YELLOW}No processes found matching '$1'${NC}"
        return 1
    fi
    echo -e "${BLUE}Found processes:${NC}"
    echo "$result" | awk '{print $2 "\t" $11}' | column -t
}

# Backup File - Create a backup copy of a file
# Usage: cpbak <file>
cpbak() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No file specified${NC}"
        echo -e "${BLUE}Usage: cpbak <file>${NC}"
        return 1
    fi

    if [ ! -e "$1" ]; then
        echo -e "${RED}Error: '$1' does not exist${NC}"
        return 1
    fi

    local backup_name="$1.bak"
    # If backup already exists, append timestamp
    if [ -e "$backup_name" ]; then
        backup_name="$1.bak.$(date +%Y%m%d_%H%M%S)"
    fi

    cp -p "$1" "$backup_name" && echo -e "${GREEN}Created backup: $backup_name${NC}"
}

# Port Usage Checker - Find what process is using a particular port
# Usage: whoisport <port>
whoisport() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No port specified${NC}"
        echo -e "${BLUE}Usage: whoisport <port>${NC}"
        return 1
    fi

    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Error: Port must be a number${NC}"
        return 1
    fi

    local pid_info
    pid_info=$(sudo lsof -i :"$1" 2>/dev/null)
    
    if [ -z "$pid_info" ]; then
        echo -e "${YELLOW}No process is using port $1${NC}"
        return 1
    fi

    echo -e "${BLUE}Processes using port $1:${NC}"
    echo "$pid_info" | awk 'NR>1 {printf "%-20s %-10s %-10s %s\n", $1, $2, $5, $9}'
}

# Memory Usage - Show current memory usage with percentage
# Usage: freemem
freemem() {
    local total used free shared buff_cache available
    read -r total used free shared buff_cache available < <(free | awk 'NR==2 {print $2,$3,$4,$5,$6,$7}')
    
    local used_percent=$((used * 100 / total))
    local free_percent=$((free * 100 / total))
    local buff_cache_percent=$((buff_cache * 100 / total))
    
    echo -e "${BLUE}Memory Usage:${NC}"
    echo -e "Total:\t\t$(numfmt --to=iec --suffix=B $((total * 1024)))"
    echo -e "Used:\t\t$(numfmt --to=iec --suffix=B $((used * 1024)))\t(${used_percent}%)"
    echo -e "Free:\t\t$(numfmt --to=iec --suffix=B $((free * 1024)))\t(${free_percent}%)"
    echo -e "Buff/Cache:\t$(numfmt --to=iec --suffix=B $((buff_cache * 1024)))\t(${buff_cache_percent}%)"
    echo -e "Available:\t$(numfmt --to=iec --suffix=B $((available * 1024)))"
}

# Directory Size - Show size of directories in current path
# Usage: dirsize [path]
dirsize() {
    local target_path="${1:-.}"
    if [ ! -d "$target_path" ]; then
        echo -e "${RED}Error: '$target_path' is not a directory${NC}"
        return 1
    fi

    echo -e "${BLUE}Directory sizes in $target_path:${NC}"
    du -h --max-depth=1 "$target_path" | sort -hr
}

# Find Large Files - Find files larger than specified size
# Usage: findlarge [size in MB] [path]
findlarge() {
    local size="${1:-100}" # Default 100MB
    local path="${2:-.}"   # Default current directory
    
    if ! [[ "$size" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Error: Size must be a number${NC}"
        echo -e "${BLUE}Usage: findlarge [size in MB] [path]${NC}"
        return 1
    fi

    echo -e "${BLUE}Finding files larger than ${size}MB in $path:${NC}"
    find "$path" -type f -size +"$size"M -exec ls -lh {} \; | awk '{print $5, $9}' | sort -hr
}

# System Information - Show system information summary
# Usage: sysinfo
sysinfo() {
    echo -e "${BLUE}System Information:${NC}"
    echo -e "${YELLOW}OS:${NC}\t\t$(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
    echo -e "${YELLOW}Kernel:${NC}\t$(uname -r)"
    echo -e "${YELLOW}CPU:${NC}\t\t$(grep "model name" /proc/cpuinfo | head -1 | cut -d':' -f2 | xargs)"
    echo -e "${YELLOW}Memory:${NC}\t$(free -h | awk '/^Mem:/ {print $2}')"
    echo -e "${YELLOW}Disk Usage:${NC}"
    df -h | grep '^/dev/' | awk '{printf "  %-20s %s used of %s\n", $6, $5, $2}'
}

# Network Ports - Show listening ports
# Usage: ports
ports() {
    echo -e "${BLUE}Listening Ports:${NC}"
    sudo netstat -tulpn | grep LISTEN | awk '{printf "%-6s %-20s %s\n", $4, $7, $1}' | column -t
}

# Quick HTTP Server - Start a simple HTTP server in current directory
# Usage: serve [port]
serve() {
    local port="${1:-8000}"
    if ! [[ "$port" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Error: Port must be a number${NC}"
        return 1
    fi
    
    echo -e "${BLUE}Starting HTTP server on port $port${NC}"
    echo -e "${YELLOW}Access at: http://localhost:$port${NC}"
    python3 -m http.server "$port"
}

# Help - Show available utilities
# Usage: utils_help
utils_help() {
    echo -e "${BLUE}Available Utilities:${NC}"
    echo -e "${YELLOW}ex${NC} <file>\t\t\tExtract archive files"
    echo -e "${YELLOW}psgrep${NC} <pattern>\t\tFind processes matching pattern"
    echo -e "${YELLOW}cpbak${NC} <file>\t\t\tCreate backup of a file"
    echo -e "${YELLOW}whoisport${NC} <port>\t\tShow process using a port"
    echo -e "${YELLOW}freemem${NC}\t\t\tShow memory usage details"
    echo -e "${YELLOW}dirsize${NC} [path]\t\tShow directory sizes"
    echo -e "${YELLOW}findlarge${NC} [size] [path]\tFind large files"
    echo -e "${YELLOW}sysinfo${NC}\t\t\tShow system information"
    echo -e "${YELLOW}ports${NC}\t\t\tShow listening ports"
    echo -e "${YELLOW}serve${NC} [port]\t\tStart HTTP server"
    echo -e "${YELLOW}gitclean${NC}\t\t\tClean up Git branches"
    echo -e "${YELLOW}dockerclean${NC}\t\tClean up Docker resources"
    echo -e "${YELLOW}jsonpp${NC} <file> [query]\tPretty print JSON with optional query"
    echo -e "${YELLOW}findtext${NC} <pattern> [files]\tFind text in files with context"
    echo -e "${YELLOW}envman${NC} [action] [key] [val]\tManage environment variables"
    echo -e "${YELLOW}procmon${NC} <pattern>\t\tMonitor process resources"
    echo -e "${YELLOW}sslinfo${NC} <domain>\t\tShow SSL certificate information"
    echo -e "\nUse any command with -h or --help for detailed usage information"
}

# Git Branch Cleanup - Remove merged and stale branches
# Usage: gitclean
gitclean() {
    echo -e "${BLUE}Cleaning up Git branches...${NC}"
    
    # Fetch latest changes and prune remote branches
    echo -e "${YELLOW}Fetching and pruning remote branches...${NC}"
    git fetch --prune
    
    # Remove local branches that have been merged to main/master
    echo -e "\n${YELLOW}Removing merged local branches...${NC}"
    local main_branch="main"
    if ! git show-ref --verify --quiet refs/heads/main; then
        main_branch="master"
    fi
    
    git branch --merged "$main_branch" | grep -v "^\*\|master\|main" | xargs -r git branch -d
    
    echo -e "${GREEN}Git cleanup complete!${NC}"
}

# Docker Cleanup - Remove unused containers, images, and volumes
# Usage: dockerclean
dockerclean() {
    if ! command -v docker &> /dev/null; then
        echo -e "${RED}Error: Docker is not installed${NC}"
        return 1
    fi

    echo -e "${BLUE}Cleaning up Docker resources...${NC}"
    
    echo -e "${YELLOW}Stopping all containers...${NC}"
    docker container stop $(docker container ls -aq) 2>/dev/null
    
    echo -e "${YELLOW}Removing stopped containers...${NC}"
    docker container prune -f
    
    echo -e "${YELLOW}Removing unused images...${NC}"
    docker image prune -a -f
    
    echo -e "${YELLOW}Removing unused volumes...${NC}"
    docker volume prune -f
    
    echo -e "${YELLOW}Removing unused networks...${NC}"
    docker network prune -f
    
    echo -e "${GREEN}Docker cleanup complete!${NC}"
}

# JSON Pretty Print with optional query
# Usage: jsonpp <file> [query]
jsonpp() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No file specified${NC}"
        echo -e "${BLUE}Usage: jsonpp <file> [query]${NC}"
        return 1
    fi

    if [ ! -f "$1" ]; then
        echo -e "${RED}Error: File '$1' does not exist${NC}"
        return 1
    fi

    if [ -n "$2" ]; then
        jq "$2" "$1"
    else
        jq '.' "$1"
    fi
}

# Find text in files with context
# Usage: findtext <pattern> [file-pattern]
findtext() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No search pattern specified${NC}"
        echo -e "${BLUE}Usage: findtext <pattern> [file-pattern]${NC}"
        return 1
    fi

    local pattern="$1"
    local file_pattern="${2:-*}"

    echo -e "${BLUE}Searching for '$pattern' in $file_pattern files...${NC}"
    find . -type f -name "$file_pattern" -not -path "*/\.*" -exec grep -l -i "$pattern" {} \; | \
        while read -r file; do
            echo -e "\n${YELLOW}File: $file${NC}"
            grep -C 2 -i --color=always "$pattern" "$file"
        done
}

# Environment Variable Manager
# Usage: envman [list|get|set|unset] [key] [value]
envman() {
    local action="$1"
    local key="$2"
    local value="$3"
    local env_file="$HOME/.env_vars"

    case "$action" in
        "list")
            echo -e "${BLUE}Environment Variables:${NC}"
            if [ -f "$env_file" ]; then
                cat "$env_file"
            else
                echo -e "${YELLOW}No environment variables set${NC}"
            fi
            ;;
        "get")
            if [ -z "$key" ]; then
                echo -e "${RED}Error: No key specified${NC}"
                return 1
            fi
            if [ -f "$env_file" ]; then
                grep "^$key=" "$env_file" || echo -e "${YELLOW}Variable $key not found${NC}"
            fi
            ;;
        "set")
            if [ -z "$key" ] || [ -z "$value" ]; then
                echo -e "${RED}Error: Both key and value must be specified${NC}"
                return 1
            fi
            if [ -f "$env_file" ]; then
                sed -i "/^$key=/d" "$env_file"
            fi
            echo "$key=$value" >> "$env_file"
            echo -e "${GREEN}Set $key=$value${NC}"
            ;;
        "unset")
            if [ -z "$key" ]; then
                echo -e "${RED}Error: No key specified${NC}"
                return 1
            fi
            if [ -f "$env_file" ]; then
                sed -i "/^$key=/d" "$env_file"
                echo -e "${GREEN}Unset $key${NC}"
            fi
            ;;
        *)
            echo -e "${BLUE}Environment Variable Manager Usage:${NC}"
            echo -e "  envman list              ${YELLOW}List all variables${NC}"
            echo -e "  envman get <key>         ${YELLOW}Get variable value${NC}"
            echo -e "  envman set <key> <value> ${YELLOW}Set variable value${NC}"
            echo -e "  envman unset <key>       ${YELLOW}Unset variable${NC}"
            ;;
    esac
}

# Process Monitor - Monitor system resources for a specific process
# Usage: procmon <pattern>
procmon() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No process pattern specified${NC}"
        echo -e "${BLUE}Usage: procmon <pattern>${NC}"
        return 1
    fi

    local pattern="$1"
    echo -e "${BLUE}Monitoring processes matching '$pattern'${NC}"
    echo -e "${YELLOW}Press Ctrl+C to stop monitoring${NC}\n"

    while true; do
        clear
        echo -e "${BLUE}$(date '+%Y-%m-%d %H:%M:%S')${NC}"
        
        echo -e "${YELLOW}CPU Usage:${NC}"
        top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'
        
        echo -e "\n${YELLOW}Memory Usage:${NC}"
        free -h | awk 'NR==2{printf "%.2f%%\n", $3/$2*100}'
        
        echo -e "\n${YELLOW}Disk Usage:${NC}"
        df -h / | awk 'NR==2{print $5}'
        
        echo -e "\n${YELLOW}Top Processes:${NC}"
        ps aux --sort=-%cpu | head -6
        
        sleep 2
    done
}

# SSL Certificate Information
# Usage: sslinfo <domain>
sslinfo() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No domain specified${NC}"
        echo -e "${BLUE}Usage: sslinfo <domain>${NC}"
        return 1
    fi

    local domain="$1"
    echo -e "${BLUE}SSL Certificate Information for $domain:${NC}"
    echo | openssl s_client -servername "$domain" -connect "$domain":443 2>/dev/null | openssl x509 -noout -dates -subject -issuer
}

# Network Interface Information
# Usage: netinfo [interface]
netinfo() {
    local interface="$1"
    
    if [ -z "$interface" ]; then
        echo -e "${BLUE}Available Network Interfaces:${NC}"
        ip -br link show | awk '{print $1}'
        echo -e "\n${YELLOW}Use: netinfo <interface> for detailed information${NC}"
        return 0
    fi

    if ! ip link show "$interface" &>/dev/null; then
        echo -e "${RED}Error: Interface '$interface' not found${NC}"
        return 1
    fi

    echo -e "${BLUE}Information for $interface:${NC}"
    echo -e "\n${YELLOW}Link Status:${NC}"
    ip link show "$interface"
    
    echo -e "\n${YELLOW}IP Addresses:${NC}"
    ip addr show "$interface"
    
    echo -e "\n${YELLOW}Statistics:${NC}"
    cat "/sys/class/net/$interface/statistics/rx_bytes" 2>/dev/null | \
        awk '{printf "Received: %.2f MB\n", $1/1024/1024}'
    cat "/sys/class/net/$interface/statistics/tx_bytes" 2>/dev/null | \
        awk '{printf "Transmitted: %.2f MB\n", $1/1024/1024}'
}

# System Resource Monitor
# Usage: sysmon [interval]
sysmon() {
    local interval="${1:-2}"
    if ! [[ "$interval" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Error: Interval must be a number${NC}"
        return 1
    fi

    echo -e "${BLUE}System Resource Monitor${NC}"
    echo -e "${YELLOW}Press Ctrl+C to stop monitoring${NC}\n"

    while true; do
        clear
        echo -e "${BLUE}$(date '+%Y-%m-%d %H:%M:%S')${NC}\n"
        
        echo -e "${YELLOW}CPU Usage:${NC}"
        top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'
        
        echo -e "\n${YELLOW}Memory Usage:${NC}"
        free -h | awk 'NR==2{printf "%.2f%%\n", $3/$2*100}'
        
        echo -e "\n${YELLOW}Disk Usage:${NC}"
        df -h / | awk 'NR==2{print $5}'
        
        echo -e "\n${YELLOW}Top Processes:${NC}"
        ps aux --sort=-%cpu | head -6
        
        sleep "$interval"
    done
}

# Log File Analyzer
# Usage: logwatch <file> [pattern]
logwatch() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No log file specified${NC}"
        echo -e "${BLUE}Usage: logwatch <file> [pattern]${NC}"
        return 1
    fi

    local logfile="$1"
    local pattern="$2"

    if [ ! -f "$logfile" ]; then
        echo -e "${RED}Error: Log file '$logfile' not found${NC}"
        return 1
    fi

    echo -e "${BLUE}Watching log file: $logfile${NC}"
    if [ -n "$pattern" ]; then
        echo -e "${YELLOW}Filtering for: $pattern${NC}"
        tail -f "$logfile" | grep --line-buffered --color=always "$pattern"
    else
        tail -f "$logfile"
    fi
}

# Project Directory Initializer
# Usage: projinit <name> [type]
projinit() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No project name specified${NC}"
        echo -e "${BLUE}Usage: projinit <name> [type]${NC}"
        echo -e "Available types: python, node, go, rust"
        return 1
    fi

    local name="$1"
    local type="${2:-python}"
    local dir="$HOME/projects/$name"

    if [ -d "$dir" ]; then
        echo -e "${RED}Error: Project directory already exists${NC}"
        return 1
    fi

    echo -e "${BLUE}Creating $type project: $name${NC}"
    mkdir -p "$dir"
    cd "$dir" || return 1

    case "$type" in
        "python")
            echo -e "${YELLOW}Initializing Python project...${NC}"
            python3 -m venv venv
            echo "venv/" > .gitignore
            echo "*.pyc" >> .gitignore
            echo "__pycache__/" >> .gitignore
            touch requirements.txt
            mkdir -p src tests
            ;;
        "node")
            echo -e "${YELLOW}Initializing Node.js project...${NC}"
            npm init -y
            echo "node_modules/" > .gitignore
            mkdir -p src tests
            ;;
        "go")
            echo -e "${YELLOW}Initializing Go project...${NC}"
            go mod init "$name"
            echo "bin/" > .gitignore
            mkdir -p cmd pkg internal
            ;;
        "rust")
            echo -e "${YELLOW}Initializing Rust project...${NC}"
            cargo init
            ;;
        *)
            echo -e "${RED}Error: Unknown project type '$type'${NC}"
            return 1
            ;;
    esac

    git init
    echo -e "${GREEN}Project initialized at $dir${NC}"
}

# HTTP Request Tester
# Usage: httptest <url> [method] [data]
httptest() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No URL specified${NC}"
        echo -e "${BLUE}Usage: httptest <url> [method] [data]${NC}"
        return 1
    fi

    local url="$1"
    local method="${2:-GET}"
    local data="$3"
    local curl_opts=(-s -w "\n%{http_code}\n" -X "$method")

    if [ -n "$data" ]; then
        curl_opts+=(-d "$data" -H "Content-Type: application/json")
    fi

    echo -e "${BLUE}Testing $method request to $url${NC}"
    if [ -n "$data" ]; then
        echo -e "${YELLOW}Data: $data${NC}"
    fi

    echo -e "\n${YELLOW}Response:${NC}"
    local response
    response=$(curl "${curl_opts[@]}" "$url")
    local status_code=$(echo "$response" | tail -n1)
    local body=$(echo "$response" | sed '$d')

    echo "$body" | jq '.' 2>/dev/null || echo "$body"
    echo -e "\n${BLUE}Status Code: $status_code${NC}"
}

# File Change Monitor
# Usage: watchfile <file/dir> [command]
watchfile() {
    if [ -z "$1" ]; then
        echo -e "${RED}Error: No file/directory specified${NC}"
        echo -e "${BLUE}Usage: watchfile <file/dir> [command]${NC}"
        return 1
    fi

    local target="$1"
    local cmd="$2"

    if [ ! -e "$target" ]; then
        echo -e "${RED}Error: '$target' does not exist${NC}"
        return 1
    }

    echo -e "${BLUE}Watching $target for changes...${NC}"
    echo -e "${YELLOW}Press Ctrl+C to stop${NC}\n"

    local last_mod
    last_mod=$(stat -c %Y "$target")

    while true; do
        current_mod=$(stat -c %Y "$target")
        if [ "$current_mod" != "$last_mod" ]; then
            echo -e "${GREEN}Change detected at $(date '+%H:%M:%S')${NC}"
            if [ -n "$cmd" ]; then
                echo -e "${YELLOW}Executing: $cmd${NC}"
                eval "$cmd"
            fi
            last_mod=$current_mod
        fi
        sleep 1
    done
}

# Update utils_help with new functions
utils_help() {
    echo -e "${BLUE}Available Utilities:${NC}"
    echo -e "${YELLOW}ex${NC} <file>\t\t\tExtract archive files"
    echo -e "${YELLOW}psgrep${NC} <pattern>\t\tFind processes matching pattern"
    echo -e "${YELLOW}cpbak${NC} <file>\t\t\tCreate backup of a file"
    echo -e "${YELLOW}whoisport${NC} <port>\t\tShow process using a port"
    echo -e "${YELLOW}freemem${NC}\t\t\tShow memory usage details"
    echo -e "${YELLOW}dirsize${NC} [path]\t\tShow directory sizes"
    echo -e "${YELLOW}findlarge${NC} [size] [path]\tFind large files"
    echo -e "${YELLOW}sysinfo${NC}\t\t\tShow system information"
    echo -e "${YELLOW}ports${NC}\t\t\tShow listening ports"
    echo -e "${YELLOW}serve${NC} [port]\t\tStart HTTP server"
    echo -e "${YELLOW}gitclean${NC}\t\t\tClean up Git branches"
    echo -e "${YELLOW}dockerclean${NC}\t\tClean up Docker resources"
    echo -e "${YELLOW}jsonpp${NC} <file> [query]\tPretty print JSON with optional query"
    echo -e "${YELLOW}findtext${NC} <pattern> [files]\tFind text in files with context"
    echo -e "${YELLOW}envman${NC} [action] [key] [val]\tManage environment variables"
    echo -e "${YELLOW}procmon${NC} <pattern>\t\tMonitor process resources"
    echo -e "${YELLOW}sslinfo${NC} <domain>\t\tShow SSL certificate information"
    echo -e "${YELLOW}netinfo${NC} [interface]\t\tShow network interface details"
    echo -e "${YELLOW}sysmon${NC} [interval]\t\tMonitor system resources"
    echo -e "${YELLOW}logwatch${NC} <file> [pattern]\tWatch and filter log files"
    echo -e "${YELLOW}projinit${NC} <name> [type]\tInitialize project directory"
    echo -e "${YELLOW}httptest${NC} <url> [method] [data]\tTest HTTP endpoints"
    echo -e "${YELLOW}watchfile${NC} <file> [cmd]\tMonitor file changes"
    echo -e "\nUse any command with -h or --help for detailed usage information"
}
