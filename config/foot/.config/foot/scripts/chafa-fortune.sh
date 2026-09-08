#!/usr/bin/env bash

if [ "$TERM_PROGRAM" = "vscode" ]; then
    return 0 2>/dev/null || exit 0
fi

if [ -n "$NVIM" ] || [ -n "$VIM" ]; then
    return 0 2>/dev/null || exit 0
fi

IMAGE_DIR="$HOME/.config/foot/images"

RANDOM_NUM=$(( (RANDOM % 19) + 1 ))
IMAGE="$IMAGE_DIR/${RANDOM_NUM}.jpg"

CYAN='\033[0;36m'
PURPLE='\033[0;35m'
GRAY='\033[1;30m'
NC='\033[0m'

if [ -f "$IMAGE" ]; then
    echo ""
    chafa --size=46 "$IMAGE"  | sed 's/^/  /'
    
    printf "${GRAY}%.s─" {1..46}
    echo -e "${NC}"
else
    echo -e "${PURPLE}[Warning]${NC} Image not found: $IMAGE"
fi

if command -v chafa &>/dev/null && [ -f "$SELECTED_IMG" ]; then
    printf "${GRAY}%.s─" {1..48}
    echo -e "${NC}"
fi

if command -v fortune &>/dev/null; then
    INNER_WIDTH=48

    echo -e "${CYAN}┌── Your Fortune ────────────────────────────────┐${NC}"

    fortune -s | fold -w $INNER_WIDTH | while IFS= read -r line; do
        printf "${CYAN}${NC} ${PURPLE}%-${INNER_WIDTH}s${NC} ${CYAN}${NC}\n" "$line"
    done

    echo -e "${CYAN}└────────────────────────────────────────────────┘${NC}"
    echo ""
fi
