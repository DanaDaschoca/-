# Лабораторная 3*
## Цель: 
1. Создать helm chart на основе обычной 3 лабы
2. Задеплоить его в кластер
3. Поменять что-то в сервисе, задеплоить новую версию при помощи апгрейда релиза
4. В отчете приложить скрины всего процесса, все использованные файлы, а также привести три причины, по которым использовать хелм удобнее чем классический деплой через кубернетес манифесты

## Ход работы: 
Смысл в том, что все темплейты (configmap, deployment, service) ссылаются на values и мы таким образом все переменные храним в одном месте. 

Для начала надо установить helm с помощью команды ``curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3``

Далее создать helm-чарт ``helm create``

Мы создали 4 файла: values, configmap, deployment, service. 
Пример values: 

![image](https://github.com/user-attachments/assets/27cee963-eea0-446c-8c38-4676dd33fbf2)

Пример configmap:

![image](https://github.com/user-attachments/assets/1f0335e4-2473-43c1-a9db-39a587206bbd)

Пример deployment: 

![image](https://github.com/user-attachments/assets/d0eaeb23-bf3a-41e3-86e9-6d6451f77a26)

Пример service:

![image](https://github.com/user-attachments/assets/74f1bd97-69e3-4b9e-8ab0-ec3610f9e97f)

(Всей файлы есть в папке по предмету, в конце у них знак "!")

Теперь установим чарт ``helm install``.

Итог: оно открывается (кстати слушайте подкаст Тани и Ромы "Магия цветовосприятия") 

![image](https://github.com/user-attachments/assets/804e8040-bddc-41ba-a3b4-d2005fb925e4)

Три преимущества использования helm: 
1. Есть шаблоны. Т е параметры в принципе мы можем динамически изменять.
2. Через команды ``install``, ``upgrade`` и ``rollback`` можно управлять версиями.
3. Один чарт можно использовать в разных средах. 
