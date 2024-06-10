Чтобы проверить корректность работы:

chmod +x your_file_nime.sh

## 1) Через "-d":
ex: ./your_file_nime.sh -d /any_path

./your_file_nime.sh -d путь к корневому каталогу, где должны быть созданы директории пользователей.

## 2) Без соответствующего ключа "-d" с диалог. окном:
ex: 1) ./create_user_dirs.sh
    2) /any_path

./your_file_nime.sh
Дальше вводим путь к корневому каталогу при появлении запроса.

Наблюдаем примененные изменения (директории пользователей с правами доступа 755 + установка пользователя владельцем каждой директории) и логи: как в терминале, так и в файле your_file_nime.log