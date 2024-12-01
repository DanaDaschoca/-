# Лабораторная работа 5
## Цель: 
Сделать мониторинг сервиса, поднятого в кубере (использовать, например, prometheus и grafana). Показать хотя бы два рабочих графика, которые будут отражать состояние системы. Приложить скриншоты всего процесса настройки.
## Ход работы:
Так как у нас не сразу выполнилась эта работа, то (к сожадению) скриншоты выполнения команд были утерены. Но самые важные скриншоты будут. 

1. Сначала нам надо запустить локальный Kubernetes-кластер с использованием Minikube с помощью команды  ``minikube start``. 
2. Теперь нужно добавить репозиторий Helm Chart prometheus-community в локальный список репозиториев с помощью команды ``helm repo add prometheus-community https://prometheus-community.github.io/helm-charts``.
3. Конечно нужно добавить репозиторий Helm Chart grafana в локальный список репозиториев с помощью команды ``helm repo add grafana https://grafana.github.io/helm-charts``.
4. Обновляем кеш списка чартов из всех добавленных репозиториев. Версия должна быть актуальной. ``helm repo update``.
5. Устанавливаем Prometheus, для того, чтобы далее его использовать. С помощью команды устаналиваем ``helm install prometheus prometheus-community/prometheus``.
6. Ну и как без grafana ``helm install grafana grafana/grafana``.
7. Проверим, что сервисы работают
   
   ![image](https://github.com/user-attachments/assets/7d5f0d69-97dc-45db-8bc7-cdedad555f4a)

8. Нужно пробросить порт для графаны: (до этого мы без проброса пытались и не работало естественно)

   ![image](https://github.com/user-attachments/assets/545e66e1-0a02-4de2-b6ec-464b5205e5d1)

9. Открываем Графану на localhost:3000, логинимся и используем пароль, который получили при установке графаны (пароль переведен из base64 онлайн-декодером, потому что в кмд не декодит).

   ![image](https://github.com/user-attachments/assets/fecaf152-c945-46ae-8bae-c7b3b16f0bb3)

10. Смотрим метрики по Prometheus:

    ![image](https://github.com/user-attachments/assets/8b8f3801-d529-45ce-88c7-8491c67b2a7f)

11. Подтверждение, что источник данных нашелся.

    ![image](https://github.com/user-attachments/assets/ef7a38ac-3bad-437c-a3c7-7912037ea08d)

12. Метрика: http запросы.

    ![image](https://github.com/user-attachments/assets/27cca957-9388-4f42-8c5d-5c78667041c0)

13. Метрика: значение использования cpu в секунду.

    ![image](https://github.com/user-attachments/assets/a684e6a5-f79f-45b5-936a-590b01713e31)

Итог: 

Сделали мониторинг сервиса, поднятого в кубере, смогли разобраться с пробросом протов, с которыми были проблемы, посмотрели две метрики.
