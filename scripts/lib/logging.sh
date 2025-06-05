#!/usr/bin/env bash
# Common logging utilities for scripts
# Usage: source "$(dirname "$0")/lib/logging.sh"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() {
  echo -e "${BLUE}[INFO]${NC} [$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $1"
}

log_success() {
  echo -e "${GREEN}[SUCCESS]${NC} [$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $1"
}

log_warn() {
  echo -e "${YELLOW}[WARN]${NC} [$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $1"
}

log_error() {
  echo -e "${RED}[ERROR]${NC} [$(date -u '+%Y-%m-%dT%H:%M:%SZ')] $1" >&2
}
