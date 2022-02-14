Interview Task (Aspire Mini App - API)(Laravel V 8.12)
## Getting Started

This Project is created in Laravel framwork as a purpose of Test interview Practical Task.



### Prerequisites

Application is built with Laravel 8.12 as php framework and MySQL database is used for db operation.

### Server Requirment
	- Php 7.3 or Greater
	- mysql

### Installing

A step by step series of examples that tell you how to get a development env running.
- First clone this project
- Run composer update
- Set configuration in .env file like database setting and your app url
- Import mysql in database or
	-- php artisan migrate
	-- php artisan module:seed
- DB Import form directory [root/documents]
- composer update
- npm install
- Run dump autoload
- Run php artisan serve
- Run php artisan storage:link
- Open http://127.0.0.1:8000

### Set Following details in .env for email notification
MAIL_DRIVER=smtp
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=
MAIL_PASSWORD=
MAIL_FROM=no-reply@testapp.com
MAIL_NAME=testApp
MAIL_FROM_NAME="${APP_NAME}"
MAIL_FROM_ADDRESS=no-reply@testapp.com
MAIL_ENCRYPTION=tls

### Please also add these details in .env for api
API_STANDARDS_TREE=vnd
API_SUBTYPE=myapp
API_PREFIX=api
API_VERSION=v1
API_NAME=API
API_CONDITIONAL_REQUEST=false
API_STRICT=false
API_DEFAULT_FORMAT=json
API_DEBUG=true
API_APIAUTHMD5=
JWT_SECRET=CapZQLHv1Zc2j0LLoMDHZQ8ydxhThQ07CQZE1ERuAwJL6WQP08tjkCY3vWTpS4xO


### Admin Login Details
URL: http://127.0.0.1:8000/admin/login
Email: testapp@yopmail.com
Password: 12345678


### Exam Details
Objective: Create a simple web app
                            - Authentication: Registration \
                            - Login 
                            - Forgot Password
                            - Table: Products - ID, Name, Price, UPC, Status, Image
                            - CRUD functionality
                            - Allow multiple records deletion 
### System will have two types of users
	○ Admin
	○ Normal User


