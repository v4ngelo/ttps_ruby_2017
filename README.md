# README

* Ruby version
  Para este desarrollo se utilizaron las siguientes herramientas:
  * Ruby version 2.4.2
  * Rails version 5.1.4
  * Postgres 9.6.6, 64 bit version
  * Bundler
  * RubyMine
  
* System dependencies
  Se requiere tener instalado previamente:
  * Ruby => Instrucciones -> https://www.ruby-lang.org/es/documentation/installation/
  * Bundler => Instrucciones -> http://bundler.io/
  * Rails => Instrucciones -> http://rubyonrails.org.es/instala.html
  * Postgres => Instrucciones -> https://www.digitalocean.com/community/tutorials/como-instalar-y-utilizar-postgresql-en-ubuntu-16-04-es (Prestar atención y generar el usuario + password que se utilizará en el siguiente paso)

* Configuración
    * Dependencias
        Luego de clonar el proyecto, ejecutar bundle install para que se descarguen todas las dependencias correspondientes.

    * Devise
        Se utiliza la gema Devise para autenticar los usuarios que acceden al sistema. Como se trata de un sistema
        cerrado, el registro se encuentra bloqueado.
        Para crear un nuevo usuario, acceder a la consola de rails y ejecutar el siguiente comando (reemplazando
        los ** por los valores correspondientes):
      
        User.create(email: "*****", password: "*****", password_confirmation: "*****")
      
        De manera similar, se provee un usuario de testing, creado por medio de seeds.rb. El usuario es "test@test.com",
        password "test123".
  
* Configuración de la Base de Datos (PostgreSQL)

  Se requiere PostgreSQL para el funcionamiento de la aplicación. 
  
  Se creará una nueva base de datos dentro del esquema indicado, que DEBE existir previamente, así como el usuario
  y password relacionados al mismo. Los datos se tomarán del archivo config/application.yml. Ejemplo:
  
  DB_USERNAME: postgres => Nombre de usuario 
  DB_PASSWORD: dock33341 => Password
  DB_IP: localhost => URL de la Base de Datos
  DB_NAME: ttps_2017 => Nombre de la Base de Datos

* Creación e inicialización de la Base de Datos

Seguir los pasos normales para la creación e inicialización de la base de datos del sistema. Para ello, ejecutar
los siguientes comandos en el orden indicado:

    * rake db:create (Fallará si la base YA existe)
    * rake db:migrate
    * rake db:seed

* Ejecutar test suites
   Sobre el root del proyecto, ejecutar el comando rake test

* Ejecución de la aplicación
  Ingresar a la consola, al root del proyecto y ejecutar rails server.
  
 Try!
