
# Aplicación RoR

#### Ruby on Rails TEST

Requirements

- Use PostgreSQL
- Use Devise
- Use RSpec for testing (unit testing)
- Use FactoryBot and Faker
- Must be multilanguage. (spanish and english). 
- All error messages should be also translated

Work To Do

1. Create an authentication mechanism, with Bearer access token (JWT) with devise support
2. Create the necessary models for a user and group based to-do list app
3. Create the necessary API endpoints to manage the to-do lists and share items with your group or other users
4. The endpoints must support the selection via params of the attributes to be returned (eg. Only name and ID, instead of name, id, description, due_date, etc...)

The work must be completed on 3 days max. And include all test based on rspec


### Stack: 
- Ruby 2.6.0 
- Rails 5.2.4
- PosgreSql 9.*
- TDD Rspec

### Instalación Proyecto
- Clonar repositorio
- Realizar configuracion Base de Datos
```ruby
config/database.yml
```

- Instalar dependencias 
```ruby
bundle install 
```

- Correr migraciones 
```ruby
rails db:migrate

```

- Correr pruebas Rspec 
```ruby
bundle exec rspec
```

- Resultado pruebas
```ruby 
Finished in 1.87 seconds (files took 4.21 seconds to load)
29 examples, 0 failures
```

- Inicializar Rails 
```ruby
rails s
```

##### Para Probar Api TodoList correr los EndPoints

```ruby
POST localhost:3000/groups 

{
	"name": "Grupo 2"
}
```
```ruby
POST localhost:3000/signup

{
	"user": {
		"email": "test1@gmail.com",
		"password": "123456",
		"group_id": 1
	}
}
```
```ruby
POST localhost:3000/tasks
{
	"name": "Tarea 1",
	"description": "Finalizar Tarea",
	"user_id": 1,
	"type_share_item": 2
}
```
```ruby
GET localhost:3000/tasks
{}
```
```ruby
GET localhost:3000/groups
{}
```
```ruby
GET localhost:3000/task_list_by_group
{
	"group_id": 1
}
```
```ruby
GET localhost:3000/task_list_by_user
{
	"user_id": 1
}}
```

