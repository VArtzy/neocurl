# NEOCURL

## Simple, effective and fast HTTP Client based on curl for neovim

The neocurl plugin are designed for ease to use and getting work done fast so you can focus on your development!

### Installation

### Depedencies

- curl
- jq

### Using neocurl example

- Create .http file
```
### Register user
POST http://localhost:3000/api/users
Content-Type: application/json
Accept: application/json

{
  "username": "VArtz",
  "password" : "secret123",
  "name" : "Farrel Nikoson"
}

### Login User
POST http://localhost:3000/api/users/login
Content-Type: application/json
Accept: application/json

{
  "username": "VArtz",
  "password" : "secret123"
}

### Get User
GET http://localhost:3000/api/users/current
Accept: application/json
X-API-TOKEN: 25edd380-731c-4d9f-ac9b-b49f01e205bd
```

- Select block that you want to run with place your cursor in block area (from ### to \n###)
```
### Get User // place your cursor here
GET http://localhost:3000/api/users/current // or here
Accept: application/json // or here
X-API-TOKEN: 25edd380-731c-4d9f-ac9b-b49f01e205bd// or here
// or here
### Another... // This will run another block
```

- Run :Http, :Httpv or :Httpd in nvim command

```:Http``` -- formatted

```:Httpv``` -- verbose version (using curl -v)

```:Httpd``` -- debug mode, curl statement will appear on statusline

- Seperate window will appear and provide response from curl http request