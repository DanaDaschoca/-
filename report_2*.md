# Лабораторная работа 2*
## Цели: 
1) Написать “плохой” Docker compose файл, в котором есть не менее трех “bad practices” по их написанию
2) Написать “хороший” Docker compose файл, в котором эти плохие практики исправлены
3) В Readme описать каждую из плохих практик в плохом файле, почему она плохая и как в хорошем она была исправлена, как исправление повлияло на результат
4) После предыдущих пунктов в хорошем файле настроить сервисы так, чтобы контейнеры в рамках этого compose-проекта так же поднимались вместе, но не "видели" друг друга по сети. В отчете описать, как этого добились и кратко объяснить принцип такой изоляции
## Ход работы:
Для начала нам нужно создать проект. В этом проекте будет docker-compose файл и 2 директории клиент и сервер. docker-compose - файл, в котором будут инструкции для настройки и запуска файлов клиента и сервера. Далее мы попробуем сделать плохой docker-compose файл и хороший docker-compose файл. Папки клиента и сервера содержат в себе все необходимые файлы для запуска и работы приложений. Как это будет выглядеть:
- docker-compose.yml 
- client/
- server/

Разберем содержимое папок. В папке с сервером будет питоновский файл (server.py) в нем будет код сервера. Также нужен html файл, в нем будет хранится текст, который необходим клиентскому приложению, чтобы он его вывел. Не стоит забывать про Dockerfile, в нем мы будет хранить необходимые настройки для окружения сервера. Как это будет выглядеть: 
- Dockerfile
- html файл
- server.py

Теперь поговорим про папку клиента, она будет немного отличаться от серверной. В нее также будет входить Dockerfile для окружения, питоновский файл (client.py), где будет код клиента. Как это будет выглядеть: 
- Dockerfile
- client.py

Вот так выглядит содержимое папок:

<img width="232" alt="Содержимое_проекта" src="https://github.com/user-attachments/assets/c616dcf4-4aee-4a7e-b40b-44e1755fec04">

Теперь посмотрим на содержимое всех файлов. Для начала были созданы примитивные Dockerfile у клиента и сервера.

<img width="232" alt="докерфайл_клиент" src="https://github.com/user-attachments/assets/1b398fdf-df34-457e-84d7-e1f064e20e35">

<img width="242" alt="докерфайл_сервер" src="https://github.com/user-attachments/assets/72491a80-0a7a-4f37-8852-4d815327e5f0">

После этого создадим питоновские файлы сервера и клиента.

<img width="446" alt="Питон_клиент" src="https://github.com/user-attachments/assets/cc0080d1-3b9c-4797-b434-e582baecc261">

<img width="487" alt="Питон_сервер" src="https://github.com/user-attachments/assets/cf32574c-e5ca-4547-96c6-ec8ccdfd6036">

Нам нужен html файл. К вашему вниманию наконец у нас появилась реклама, поэтому html показывает рекламу клубу по мафии ИТМО.

<img width="347" alt="файл_страницы_сервер1" src="https://github.com/user-attachments/assets/b2acd991-33c6-4fbf-8d48-f309c85bfbfd">

<img width="345" alt="файл_страницы_сервер2" src="https://github.com/user-attachments/assets/3b902743-8d6e-4e26-bfde-0223a47001b6">

Теперь попробуем создать плохой docker-compose.yml  и хороший, сравним чем они отличаются. Пример плохого файла:

<img width="230" alt="композ_плох" src="https://github.com/user-attachments/assets/b8935ed7-56d7-47e5-b19e-e91ae93219a7">

Разберем почему же он плох: 
1. Мы нарушили изоляцию из-за тега volumes, так как изменения в файловой системе хоста сразу отображаются в контейнере, поэтому могут возникнуть неожиданные проблемы. Для улучшения надо убрать этот тег или указать конкретный каталог, который мы хотим смонтировать.
2. Мы использовали переменную окружения DEBUG, тем самым включили режим отладки, что приводит к риску безопасности. Плохие люди смогут получить доступ к внутренним механизмам приложения. Данная переменная нужна только для разработчиков. 
3. Также мы (не опять, а снова) нарушили изоляцию, потому что при настройке network_mode: host контейнер будет напрямую использовать сетевые настройки хоста, что приведет к конфликту портов. 

Попробуем собрать через команду ```docker-compose build```

<img width="407" alt="поднимает_плох_1" src="https://github.com/user-attachments/assets/ada107cb-6831-427d-b960-70d3675b34e7">

Посмтрим на процесс запуска с помощью команды ```docker-compose up```

<img width="311" alt="поднимает_плох2" src="https://github.com/user-attachments/assets/46122356-3e9b-42ee-93f8-a7d9e71231bf">

В итоге запустилось успешно. 

<img width="538" alt="Поднял_плох" src="https://github.com/user-attachments/assets/1e2089a4-2a2c-4154-a8e8-a49ff41e1b5e">

Проверим статус сборки: 

<img width="690" alt="доказ" src="https://github.com/user-attachments/assets/184a7dfb-2993-47e6-bfda-480233d7b77b">

Теперь попробуем исправить ошибки у плохого файла.

<img width="287" alt="композ_хорош" src="https://github.com/user-attachments/assets/9d673458-1663-4eb5-b41c-f196b1fa087f">

Что же мы исправили: 
1. Мы убрали монтирование директории, так как это повышает изоляцию контейнера.
2. Заменили переменную окружения на ENVIRONMENT=production, тем самым не будут выводиться какие-то более детальные ошибки, которые нужны только для разработчика, что повышает безопасность. 
3. Убрали network_mode: host, чтобы также повысить изоляцию. 

Попробуем также собрать через команду ```docker-compose build```

<img width="716" alt="подним_хорош1" src="https://github.com/user-attachments/assets/93bee9c7-2cc4-4d05-96fe-c5056de24a2b">

Теперь нужно запустить через команду ```docker-compose up```

<img width="494" alt="подним_хорош2" src="https://github.com/user-attachments/assets/606aab00-791e-4289-aeb3-648a7317a47e">

<img width="539" alt="поднял_хорош3" src="https://github.com/user-attachments/assets/7f466371-a1ae-4b99-8019-6291fd08db2b">

Посмотрим на статус сборки.

<img width="456" alt="доказ2" src="https://github.com/user-attachments/assets/f06391de-10b1-43c2-9e28-086e9c6cf8de">

Теперь нам нужно, что контейнеры при запуске не видели друг друга. Для этого надо внести изменения в файл docker-compose. Наша команда решила определить несколько сетей, каждый сервис подключиться к своей сети.

Пример изменения в файле (добавление network): 

<img width="192" alt="композ_измен" src="https://github.com/user-attachments/assets/0defffd1-c37d-4ce6-9027-6d4af6a2a05a">

Теперь опять соберем. На рисунке показано, что они не видят друг друга. 

<img width="723" alt="сборка_не_вид" src="https://github.com/user-attachments/assets/956af118-41b1-457d-949f-8d20e91ed578">

Теперь запустим. 

<img width="349" alt="поднятие_не_вид" src="https://github.com/user-attachments/assets/cf324093-d8d3-4180-b565-e56a1833706d">

В конечном итоге запустилось. 

<img width="521" alt="поднял_не_вид" src="https://github.com/user-attachments/assets/065f1ef2-7ccb-4bc7-a594-24370133d5ab">

Проверим на всякий случай статусы. 

<img width="727" alt="док_послед" src="https://github.com/user-attachments/assets/1b6f079b-25ad-4ff8-bac7-ad69a1d150f9">

Теперь проверим обращение клиента к серверу. 

<img width="537" alt="обращ" src="https://github.com/user-attachments/assets/bae4e5f7-76f0-4489-91b8-121759bf978c">

В конце лабораторной работы посмотрим на рекламу. 

<img width="465" alt="реклама" src="https://github.com/user-attachments/assets/e804c51f-13fe-4f15-aa2c-f8f96dceaadd">

## Вывод: 
В ходе лабораторной работы был реализован проект клиенто-серверное приложение, на примере которого показан плохой Docker compose файл и хороший, а также было реализовано изменения файла, для того, чтобы клиент и сервер друг друга не видели. 

сейчас 15 октября 20:27, а значит: 

![photo_5357057020211090753_x](https://github.com/user-attachments/assets/4fba112a-0b1b-4bae-a827-2e0b8c141502)
