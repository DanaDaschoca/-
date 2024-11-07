# Лабораторная работа 3
## Цель: 
Поднять kubernetes кластер локально (например minikube), в нём развернуть свой сервис, используя 2-3 ресурса kubernetes. В идеале разворачивать кодом из yaml файлов одной командой запуска. Показать работоспособность сервиса
## Ход работы: 
Для начала необходимо установить и настроить Kubernetes на Windows с использованием Minikube и VirtualBox. Скачаем Chocolatey, для этого нужно зайти в PowerShell от имени администратора и ввести команды:

``` Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))```

![photo_5237771081023086280_y](https://github.com/user-attachments/assets/9d4b2193-221d-482e-947c-5e0e7077a02e)

Разберемся что же такое Chocolatey. Это инструмент управления пакетами для Windows, аналогичный менеджерам пакетов в Linux-системах, таким как apt или yum. Он позволяет устанавливать, обновлять и удалять программное обеспечение, используя командную строку.

Теперь установим Minikube и kubectl через команды ```choco install minikube``` и ```choco install kubernetes-cli```. После установки нужно будет перезагрузить ноутбук. 

![photo_5237771081023086292_y](https://github.com/user-attachments/assets/a9f9e49b-16bb-46e1-a373-704212689199)

![photo_5237771081023086300_x](https://github.com/user-attachments/assets/c09519e5-1fb3-47b4-8f86-8a0151070264)

Теперь нужно запустить Minikube с гипервизором VirtualBox с помощью команды ```minikube start --driver=virtualbox```. У нас виртуальная машина создается с помощью Minikube и он же развернёт Kubernetes кластер на ней.

Мы столкнулись с ошибкой виртуализации. 

![ошибка](https://github.com/user-attachments/assets/0c3d61d8-54e9-47d5-a6ec-003a7d8a8819)

<img width="567" alt="мем ошибки 2" src="https://github.com/user-attachments/assets/1fc4bb25-29a4-465d-af14-febd3279d88d">

Методом "тыка" (очень хороший метод, всегда помогает) пришли к тому, что нужно выключить Hyper-V для лабораторной работы. Потому что Hyper-V перенимает на себя виртуализацию. В общем, они с virtualbox не дружат.

<img width="389" alt="вот это поворот" src="https://github.com/user-attachments/assets/017273f4-643a-4151-a592-855a064a27c9">

Это не помогло. 

<img width="426" alt="это интересно" src="https://github.com/user-attachments/assets/64611865-927f-4c5d-a16c-6d388e9c0dd3">

Пробуем с командой ```minikube start --driver=virtualbox --no-vtx-check``` 

![починилось](https://github.com/user-attachments/assets/a6db7e4a-4be0-45d8-a646-e58068bb0c5d)

<img width="561" alt="починилось" src="https://github.com/user-attachments/assets/bd143ee1-bdcb-4caf-91a9-6f0275715db5">

Подключаемся к minikube по ssh.

![photo_5237771081023086404_x](https://github.com/user-attachments/assets/0eb8ef4f-1030-4191-8c25-44401bb40101)

Теперь для развертывания своего сервиса необходимо создать YAML файл, который будет описывать ресурсы Kubernetes. Мы использовались этим сайтом для написания файла: https://questu.ru/articles/6296/?ysclid=m2htb5dql2143982866



В файле мы указали версию API, определили тип объекта, добавили настройки метаданных об объекте, указали количестве реплик, определилил Pods, которые будут управлять этим файлом, для них определили шаблон для создания Pods, указали метки, которые будут применены к Pods, добавили список контейнеров и определили порт. 

Работу с самого начала пришлось делать на другом ноутбуке, так как данный ноутбук не дает возможности доделать лабораторную работу. Шаги никак не изменялись, но на другом ноутбуке получилось реализовать задуманное.

Попробуем узнать ip адрес 

Подготовим html файл для лабораторной работы. Файл был взят из прошлых работ, но с изменением рекламы. Переходите по qr коду. 

![Реклама](https://github.com/user-attachments/assets/a12c86bd-f761-4ca2-9bb1-29647d767d1d)


