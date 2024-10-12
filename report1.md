# Лабораторная работа
## Цель: 
Должен работать по https c сертификатом
Настроить принудительное перенаправление HTTP-запросов (порт 80) на HTTPS (порт 443) для обеспечения безопасного соединения.
Использовать alias для создания псевдонимов путей к файлам или каталогам на сервере.
Настроить виртуальные хосты для обслуживания нескольких доменных имен на одном сервере
## Ход работы: 
1) Для начала необходимо установить nginx с помощью команды ~~sudo apt install nginx~~.
   
   ![photo_5213059286605884038_x](https://github.com/user-attachments/assets/4b13be49-c62e-4758-827d-b8eff63fdd96)
   ![photo_5213059286605884039_x](https://github.com/user-attachments/assets/38e21c69-3afa-4fb1-83ae-9818ef112243)

2) Далее с помощью команды нужно запустить sudo systemctl start nginx
sudo systemctl enable nginx.

   ![photo_5213059286605884040_x](https://github.com/user-attachments/assets/35f56f70-098b-4bed-b247-9d0ffcca4514)

3) Конечно после установки проверим статус с помощью команды sudo systemctl status nginx.

  ![photo_5213059286605884041_x](https://github.com/user-attachments/assets/69f71c87-eb50-4b4a-91b9-ccbe4cd82b79)
  ![photo_5213059286605884042_x](https://github.com/user-attachments/assets/c509f5d1-6f9b-46aa-bf60-1a79769d8cb4)

   
4) Далее нам потребуется установка certbot и его плагина для NGIN с помощью команды sudo apt install certbot python3-certbot-nginx. Это сертификат SSL.

   ![photo_5213059286605884044_x](https://github.com/user-attachments/assets/ecc2b6e9-b45f-4c9b-8a15-2fd8e9d3b581)
   ![photo_5213059286605884045_x](https://github.com/user-attachments/assets/792ceec9-764f-49c9-92a6-f0c9113ed1a4)

5) Были взяты фиктивные доменные имена, так как далее нам придется ломать их, следовательно мы сами создадим простой сайт.
   
    <img width="497" alt="Снимок3" src="https://github.com/user-attachments/assets/9aaa937b-989d-4d2f-bb8b-e95e7b50f3cf">

    ![photo_5213059286605884114_x](https://github.com/user-attachments/assets/96bc614f-8a79-473b-932d-6d0601e909d5)
    <img width="583" alt="Снимок2" src="https://github.com/user-attachments/assets/be4cb411-2b4a-4c54-a027-267192c8dbb0">

6) Теперь нужно добавить какое-то содержимое, чтобы понимать какой сайт мы используем.
   
   <img width="586" alt="Снимок" src="https://github.com/user-attachments/assets/8b28fc15-22e0-489b-9d9c-8db5a32945fa">

7) Нам нужно перенаправить запрос по https. Для этого необходимо прописать прописать, что из 80 порта перенаправил на 443. Прописываем в файл содержимое.
   
   ![sldu-nr2RlM](https://github.com/user-attachments/assets/a2fe9925-9c64-4440-8762-df5dae5b4a5d)
   ![photo_5213059286605884149_x](https://github.com/user-attachments/assets/726253eb-aa2a-43b7-8188-89b170e06758)
   ![photo_5213059286605884151_x](https://github.com/user-attachments/assets/cd933b9b-82c7-449a-b26e-4f9e68ba92a1)

8) Теперь прописываем как раз доменные имена, чтобы он понимал куда обращаться.
   
   ![photo_5213059286605884158_x](https://github.com/user-attachments/assets/4a71e25a-f1d8-4342-97a9-4db3c4d1c808)

9) Теперь прописываем тоже самое для второго сайта.
    
    <img width="408" alt="Снимок4" src="https://github.com/user-attachments/assets/70dbf382-fc63-4089-aff4-0328fbde1871">
    <img width="415" alt="Снимок5" src="https://github.com/user-attachments/assets/f7b0e00d-2d81-41d1-99b5-486b28e72062">

10)  Теперь нужно создать самоподписанный сертификат, если его еще нет. А у нас его нет. Команда: sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/snippets/self-signed.key -out /etc/nginx/snippets/self-signed.crt
    <img width="476" alt="Снимок6" src="https://github.com/user-attachments/assets/25e684b9-91c9-4ff7-960b-ef7b249d90b6">
    <img width="557" alt="Снимок7" src="https://github.com/user-attachments/assets/58313425-c96b-4279-b67d-f8aa8e0e3cc4">
    <img width="563" alt="Снимок8" src="https://github.com/user-attachments/assets/c2f1a94e-f053-4080-a8b4-e5e0459109ce">
    <img width="497" alt="Снимок9" src="https://github.com/user-attachments/assets/3cb09081-c945-4d40-8ada-4abb29ee28b2">

11)  И это еще не конец лабораторной работыю Теперь нужно настроить файл с параметрами SSL /etc/nginx/snippets/self-signed.conf
    <img width="590" alt="Снимок10" src="https://github.com/user-attachments/assets/e9aa22e1-cb81-4130-9a0d-619ebc170402">

12)  Теперь сделаем синтаксический контроль (что все сделано правильно в нашей работе)

  <img width="508" alt="Снимок11" src="https://github.com/user-attachments/assets/26140535-6c7a-47ab-bb18-558e36d3a4b4">


13)   Итак, теперь мы должны проверить, что мы подключаемся к сайту по https.
 <img width="469" alt="Снимок12" src="https://github.com/user-attachments/assets/2efdc4d2-8a7b-4baa-a64d-fd5f192faee5">
 <img width="483" alt="Снимок13" src="https://github.com/user-attachments/assets/5374a69c-87f3-4ced-93cd-0f7de31f6d13">

14)   Соединение незащищенное, что необходимо для лабораторной 1*.
 <img width="365" alt="Снимок14" src="https://github.com/user-attachments/assets/751ba331-c74b-4f7d-9d7f-c0479dcdd45e">
    
## Вывод: 
D ходе лабораторной работы мы перенаправили проход на сайт с http по https с порта 80 на 443. Также были сложности с тем что комнады большие, поэтому были опечатки, из-за чего возникали ошибки. У нас не было проектов с доменных именами, поэтому пришлось создать проекты, где сами прописали доменные имена. 
## Источники: 
(В основном сложности были с ошибками, а не с самой темой лабораторной работы)
https://selectel.ru/blog/install-nginx/
https://www.reg.ru/blog/kak-zaregistrirovat-besplatnyj-domen-3-sposoba/
