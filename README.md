# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuración

    * Devise

        Se utiliza la gema Devise para autenticar los usuarios que acceden al sistema. Como se trata de un sistema
        cerrado, el registro se encuentra bloqueado.
        Para crear un nuevo usuario, acceder a la consola de rails y ejecutar el siguiente comando (reemplazando
        los ** por los valores correspondientes):
      
        User.create(email: "*****", password: "*****", password_confirmation: "*****")
      
        De manera similar, se provee un usuario de testing, creado por medio de seeds.rb. El usuario es "test@test.com",
        password "test123".
  
  
* Configuración de la Base de Datos (PostgreSQL)

  Se requiere PostgreSQL para el funcionamiento de la aplicación. Para instalar, seguir las instrucciones
  en este link: 
  
  Se creará una nueva base de datos dentro del esquema indicado, que DEBE existir previamente, así como el usuario
  y password relacionados al mismo. Los datos se tomarán del archivo config/application.yml. Ejemplo:
  
  DB_USERNAME: postgres => Nombre de usuario 
  DB_PASSWORD: dock33341 => Password
  DB_IP: localhost => URL de la Base de Datos
  DB_NAME: ttps_2017 => Nombre de la Base de Datos

* Creación e inicialización de la Base de Datos

Seguir los pasos normales para la creación e inicialización de la base de datos del sistema. Para ello, ejecutar
los siguientes comandos en el orden indicado:

    * rake db:create
    * rake db:migrate
    * rake db:seed

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
