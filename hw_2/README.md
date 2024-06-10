# ДЗ 2

## Ansible playbook выполняет следующие задачи на удаленном сервере:
1. Создает нового пользователя.
2. Настраивает авторизацию по SSH ключам для этого пользователя.
3. Отключает авторизацию по паролю.
4. Создает директорию в `/opt/` с правами для созданного пользователя.

## Переменные
- `user_name`: Имя пользователя, который будет создан.
- `ssh_pub_key`: Путь к публичному SSH ключу, который будет добавлен для пользователя.
- `target_directory`: Путь к директории, которая будет создана.

## Что у вас должно быть?
- Ansible установлен на вашем локальном компьютере.
- Наличие публичного SSH ключа (`~/.ssh/id_rsa.pub`).
- Доступ к удаленному серверу с правами `sudo`.

## Использование
1. Клонируйте репозиторий или создайте playbook файл.
2. Отредактируйте playbook файл при необходимости, замените значения переменных на свои.
3. Запустите playbook командой:

   ```sh
   ansible-playbook -i <inventory_file> playbook.yml