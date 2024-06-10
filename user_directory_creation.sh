#!/bin/bash

write_log() {
    local message="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "$message" | tee -a user_directory_creation.log
}

while getopts ":d:" opt; do
  case $opt in
    d) base_dir="$OPTARG" ;;
    \?) echo "Неизвестный параметр -$OPTARG" >&2; exit 1 ;;
    :) echo "Опция -$OPTARG требует аргумента." >&2; exit 1 ;;
  esac
done

if [ -z "$base_dir" ]; then
    read -p "Укажите путь к корневому каталогу: " base_dir
fi

if [ ! -d "$base_dir" ]; then
    write_log "Ошибка: Корневой каталог '$base_dir' не существует."
    exit 1
fi

write_log "Используемый корневой каталог: $base_dir"

user_list=$(getent passwd | awk -F: '$3 >= 1000 && $3 < 65534 {print $1}')

for username in $user_list; do
    user_directory="$base_dir/$username"
    
    if [ ! -d "$user_directory" ]; then
        mkdir "$user_directory"
        chmod 755 "$user_directory"
        chown "$username" "$user_directory"
        write_log "Директория '$user_directory' создана для пользователя '$username'"
    else
        write_log "Директория '$user_directory' уже существует для пользователя '$username'"
    fi
done

write_log "Скрипт успешно выполнен"
