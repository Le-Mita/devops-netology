
# Домашнее задание к занятию "5.1. Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения."




---

## Задача 1

Опишите кратко, как вы поняли: в чем основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС.


####Ответ:

   *__Виртуализация на уровне ОС__* 
     позволяет виртуализовывать физические серверы на уровне ядра ОС.
     Контейнеры выполняются на одном уровне с физическими серверами. 
     Отсутствие виртуализованного оборудования и использование реального оборудования и драйверов позволяют получить бОльшую производительность.
     Каждый контейнер может масштабироваться до ресурсов целого физического сервера.
     Возможно создание и запуск сотен контейнеров на одном обычном физическом сервере.
     Контейнеры используют единую ОС, что делает их поддержку и обновление очень простым.


   В *__аппаратной виртуализации__* базовый слой — гипервизор. 
    Этот слой загружается на сервере и обеспечивает взаимодействие между аппаратным обеспечением сервера и виртуальными машинами. 
    Чтобы предоставить ресурсы виртуальным машинам, обеспечивается их виртуализация на сервере. 
    Виртуальные машины запускают свою собственную копию операционной системы и приложений на виртуализированном оборудовании.
    Возможность создания множества виртуальных машин с различными операционными системами (включая Windows). 
    Нет зависимости от единого ядра ОС. Пользователь может устанавливать собственные патчи на ядро при необходимости получения расширенной функциональности виртуального сервера.
    Виртуальные машины выглядят как обычный компьютер. Они содержат собственное виртуальное оборудование и программное обеспечение, которое может запускаться в виртуальных машинах без необходимости модификации.
    Виртуальные машины полностью изолированы друг от друга и от ОС сервера, где происходит запуск виртуальных машин (изоляция на уровне файловой системы, процессов)


   *__Паравиртуализация__*
    Этот метод использует технологию виртуализации ЦП для реализации общего доступа гипервизора к базовому оборудованию. 
    Но поскольку гостевая операционная система, работающая на гипервизоре, подготовливается к работе в виртуальной среде и, например, оперирует такими вещами сетевые или дисковые через специальные инструкции. 
    Что позволяет достигать больших скоростей, сходных с физической машиной.
    Преимущества: по сравнению с полной виртуализацией паравиртуализация более рационализирована в использовании ресурсов и имеет преимущества в общей скорости.
    Недостатки: необходимо изменить гостевую операционную систему, поэтому поддерживается меньшее количество операционных систем, т.к. требуется открытый код.





## Задача 2

Выберите один из вариантов использования организации физических серверов, в зависимости от условий использования.

Организация серверов:
- физические сервера,
- паравиртуализация,
- виртуализация уровня ОС.

Условия использования:
- Высоконагруженная база данных, чувствительная к отказу.
- Различные web-приложения.
- Windows системы для использования бухгалтерским отделом.
- Системы, выполняющие высокопроизводительные расчеты на GPU.

Опишите, почему вы выбрали к каждому целевому использованию такую организацию.


####Ответ:
- Высоконагруженная база данных, чувствительная к отказу.
    
     *__Физический сервер.__* 
        Требуется более высокая производительность, аппаратное размещение дает более высокий отклик, 
        и сокращает точки отказа в виде гипервизора хостовой машны.
        хотя возможно использование полной аппаратной виртуализации при использовании 
        кластеризации для повышения доступности
- Различные web-приложения.

     *__Виртуализация уровня ОС (контейнеры).__*
        Требуется меньше ресурсов, выше скорость масштабирования при необходимости расширения, 
        нет жестких требований к аппаратнымм ресурсам, требует меньше ресурсов на администрирование
- Windows системы для использования бухгалтерским отделом.

     *__Паравиртуализация.__* 
        Эффективнее делать бэкаприрование - клонирование всей виртуальной машины, 
        возможность расширения ресурсов на уровне виртуальной машины, 
        нет критичных требований к доступу к аппаратной составляющей сервера.
- Системы, выполняющие высокопроизводительные расчеты на GPU.

     *__Физические сервера.__* 
        Как мне кажется, для аппаратных расчетов требуется максимальный доступ к аппаратным ресурсам,
        который физический сервер дает более эффективно, а в 2х других доступ осуществляется через хостовую ОС


    
## Задача 3

Выберите подходящую систему управления виртуализацией для предложенного сценария. Детально опишите ваш выбор.

Сценарии:

1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
2. Требуется наиболее производительное бесплатное open source решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
3. Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows инфраструктуры.
4. Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.


####Ответ:

   1. Скорее MS Hyper-V - так как он более совместим с инфораструктурой на MS,
       меньше затрат на обучение персонала (если есть инфраструктура на MS - кадры уже имеются). 
       имет широкий функционал. 
       Скорее всего используется AD соответвено совместимость Hyper-V будет приоритетнее. 
       Но так же может быть использована и VMVare, все зависит от компетенций персонала, и имеющейся инфраструктры.
       
   2. Приоритетнее KVM - гостевые ОС могут быть любыми, бесплатен и вполне производителен
       так же может подойти  XEN, но он менее производителен.
    
   3. В данном случае можно использовать бесплатный Hyper-V, с Windows  будет максимально совместим. В бесплатном исполнении вполне работоспособен.
       
   4. Для тестирования достаточно опенсорс KVM или XEN. 
       Если развертывание требуется не на длительном времени, то можно рассмотреть облачные системы AWS/Openstack,
       так как они не требуют поддержания своей инфраструктуры, если на тесте "не взлетит", 
       то затраты могут быть ниже, чем при развертывании собственной инраструктуры



## Задача 4

Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, то создавали бы вы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.


####Ответ:
   *__Проблемы гетерогенной среды:__*
   
   
   - содержать несколько команд администрирования/сопровождения для разных систем (кадровые издержки)
   - гораздо ниже масштабируемость, придется масштабировать 2(или более) системы, 
   - сложность при выделении и управлении ресурсами
   - финансовые затраты, так как необходимо содержать несколько систем одновременно (если считать платные версии)
   - проблемы миграции между разными системами, + полное дублирование всей инфраструктуры под 2(или более) системы виртуализации
   - если тестирование проводится в разных системах, то отлавливать "баги" сложнее
      
   Без опыта сложно сказать как минимизировать, но можно предположить:
   
   - распределить системы по совместимости, например, Hyper-V для всей Windows инфраструктуры и VMWare для остальных. 
   - обучить команду сопровождения работе с обеими системами, для взаимозаменяемости (достаточно спорный вариант, но возможный)
   
   
   Предположу, что выбрала бы одну систему, так как инфраструктурно и кадрово содержать такую куда практичнее, 
    но есть нюансы в используемых задачах, возможно, чисто технически, могут потребоваться и разные системы. 
    Без комплексного видения очень сложно сказать.
    Но при развернутой инраструктуре на Windows, использование других продуктов и серверов на Windows, 
     логичнее использовать Hyper-V для подобного решения. 
    Тем более, Hyper-V имеет практически полноценное бесплатное решение.