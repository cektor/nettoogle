#!/bin/bash

# GNU License | Fatih ÖNDER - https://fatihonder.org.tr


# Wifi'yi açma/kapama
toggle_wifi() {
    local wifi_status=$(nmcli radio wifi)

    if [ "$wifi_status" == "enabled" ]; then
        nmcli radio wifi off
        echo "Wifi kapatıldı."
    else
        nmcli radio wifi on
        echo "Wifi açıldı."
    fi
}

# Bluetooth'u açma/kapama
toggle_bluetooth() {
    local bluetooth_status=$(nmcli radio bluetooth)

    if [ "$bluetooth_status" == "enabled" ]; then
        nmcli radio bluetooth off
        echo "Bluetooth kapatıldı."
    else
        nmcli radio bluetooth on
        echo "Bluetooth açıldı."
    fi
}

# Ethernet'i açma/kapama
toggle_ethernet() {
    local ethernet_status=$(nmcli networking connectivity)

    if [ "$ethernet_status" == "full" ]; then
        nmcli networking off
        echo "Ethernet kapatıldı."
    else
        nmcli networking on
        echo "Ethernet açıldı."
    fi
}

# Konumu açma/kapama
toggle_location() {
    local location_status=$(nmcli radio wifi)

    if [ "$location_status" == "disabled" ]; then
        nmcli radio wifi on
        echo "Konum açıldı."
    else
        nmcli radio wifi off
        echo "Konum kapatıldı."
    fi
}

# Ana döngü
while true; do
    echo ""
    echo "1. Wifi Aç/Kapat"
    echo "2. Bluetooth Aç/Kapat"
    echo "3. Ethernet Aç/Kapat"
    echo "4. Konum Aç/Kapat"
    echo "5. Çıkış"

    read -p "Bir seçenek girin [1-5]: " choice

    case $choice in
        1)
            toggle_wifi
            ;;
        2)
            toggle_bluetooth
            ;;
        3)
            toggle_ethernet
            ;;
        4)
            toggle_location
            ;;
        5)
            echo "Çıkış yapılıyor..."
            exit 0
            ;;
        *)
            echo "Geçersiz seçenek. Tekrar deneyin."
            ;;
    esac
done

