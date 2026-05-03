#!/bin/bash

# --- COLOR PALETTE ---
RED='\033[1;31m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

typewriter() {
    local text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -ne "${text:$i:1}"
        sleep 0.015
    done
}

slide_header() {
    local color="$1"
    shift
    local lines=("$@")
    for line in "${lines[@]}"; do
        echo -ne "${color}"
        for ((i=0; i<${#line}; i++)); do
            echo -ne "${line:$i:1}"
            sleep 0.001
        done
        echo -e "${NC}"
    done
}

clear

# --- PBRP HEADER ---
P_HEADER=(
"██████╗ ██████╗ ██████╗ ██████╗      ██╗██████╗      ██╗"
"██╔══██╗██╔══██╗██╔══██╗██╔══██╗    ███║╚════██╗    ███║"
"██████╔╝██████╔╝██████╔╝██████╔╝    ╚██║ █████╔╝    ╚██║"
"██╔═══╝ ██╔══██╗██╔══██╗██╔═══╝      ██║██╔═══╝      ██║"
"██║     ██████╔╝██║  ██║██║           ██║███████╗ ██╗ ██║"
"╚═╝     ╚═════╝ ╚═╝  ╚═╝╚═╝           ╚═╝╚══════╝ ╚═╝ ╚═╝"
)
slide_header "${RED}" "${P_HEADER[@]}"

echo ""

CORES=$(nproc --all)
MEM=$(free -h | awk '/^Mem:/ {print $2}')
BUILD_DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo -e "${GRAY}─────────────────────────────────────────────────────────────────────${NC}"
printf "${RED}» DEVICE:${NC}    %-20s ${CYAN}» BRAND:${NC}  %-20s\n" "TECNO KM6" "TECNO"
printf "${RED}» PRODUCT:${NC}   %-20s ${CYAN}» ARCH:${NC}   %-20s\n" "pb_KM6" "ARM64"
printf "${RED}» CHIPSET:${NC}   %-20s ${CYAN}» BRANCH:${NC} %-20s\n" "Helio G100 (MT6789)" "PBRP-12.1"
printf "${RED}» CPU CORES:${NC} %-20s ${CYAN}» RAM:${NC}    %-20s\n" "$CORES" "$MEM"
printf "${RED}» DATE:${NC}      %-20s\n" "$BUILD_DATE"
echo -e "${GRAY}─────────────────────────────────────────────────────────────────────${NC}"

echo ""

T_HEADER=(
"████████╗███████╗ ██████╗███╗   ██╗ ██████╗ "
"╚══██╔══╝██╔════╝██╔════╝████╗  ██║██╔═══██╗"
"   ██║   █████╗  ██║     ██╔██╗ ██║██║   ██║"
"   ██║   ██╔══╝  ██║     ██║╚██╗██║██║   ██║"
"   ██║   ███████╗╚██████╗██║ ╚████║╚██████╔╝"
"   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═══╝ ╚═════╝ "
)
slide_header "${CYAN}" "${T_HEADER[@]}"

echo -e "\n${WHITE}  Device : TECNO Spark 40 Pro (KM6)${NC}"
echo -e "${WHITE}  Target : pb_KM6-eng / pb_KM6-userdebug${NC}"
echo -e "${GRAY}─────────────────────────────────────────────────────────────────────${NC}"

echo -e "\n${WHITE}[ BUILD INFO ]${NC}"
echo -e "${GRAY}┌──────────────────────────────────────────────────────────────────┐${NC}"
echo -ne "  ${RED}■${NC} ${WHITE}PRODUCT:${NC}    " && typewriter "pb_KM6" && echo ""
echo -ne "  ${RED}■${NC} ${WHITE}DEVICE:${NC}     " && typewriter "TECNO-KM6 (Spark 40 Pro)" && echo ""
echo -ne "  ${RED}■${NC} ${WHITE}CHIPSET:${NC}    " && typewriter "MediaTek Helio G100 (MT6789)" && echo ""
echo -ne "  ${RED}■${NC} ${WHITE}ANDROID:${NC}    " && typewriter "Android 12.1 (PBRP)" && echo ""
echo -ne "  ${CYAN}■${NC} ${WHITE}BUILD CMD:${NC}  " && typewriter ". build/envsetup.sh && lunch pb_KM6-eng && make pbrp -j\$(nproc)" && echo ""
echo -e "${GRAY}└──────────────────────────────────────────────────────────────────┘${NC}"

echo -e "\n${YELLOW}  ⚠  Virtual A/B device — output image: vendor_boot.img${NC}"
echo -e "${GREEN}  ✓  Device tree loaded successfully!${NC}\n"

# CATATAN: Lunch combo didaftarkan via COMMON_LUNCH_CHOICES di AndroidProducts.mk
# Tidak perlu add_lunch_combo di sini (sudah obsolete di Android 12+)
