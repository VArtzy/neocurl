```
  _ __   ___  ___   ___ _   _ _ __ -
 | '_ \ / _ \/ _ \ / __| | | | '__| |
 | | | |  __/ (_) | (__| |_| | |  | |
 |_| |_|\___|\___/ \___|\__,_|_|  |_|
```
# Simple, effective and fast HTTP Client based on curl for neovim
## Interactive interface, raw performance.¹<br>HTTP, OAuth and GraphQL Supported.²
## It's not just testing your API,<br>you're create documentation simultaneously.
## Don't ever leave the vim and terminal.<br>Command-line scripting style for hackers.

[neocurl-demo.webm](https://github.com/user-attachments/assets/bc010a08-54ac-4970-847b-743c18bc4848)

Directly plug lightweight http client to your neovim without overwhelming setup and configuration. The neocurl plugin are designed for ease to use and getting work done fast so you can focus on your development! (No analytics/ telemetry)

### Installation

- Packer

```use 'vartzy/neocurl'```

Lazy load it (Recommended)
```use {'vartzy/neocurl', ft = 'http'}```

- Vim Plug

```Plug 'vartzy/neocurl'```

- Lazy

```"vartzy/neocurl"```

### Depedencies

- curl
- jq (optional -- recommended for pretty print)

- Windows (via Scoop)
```
scoop install main/curl
scoop install main/jq
```

- Mac

```brew install jq```

- Linux

```sudo apt install jq```

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

- Select block that you want to run with place your cursor in block area
```
### Get User // place your cursor here
GET http://localhost:3000/api/users/current // or here
Accept: application/json // or here
X-API-TOKEN: 25edd380-731c-4d9f-ac9b-b49f01e205bd// or here
// or here
### Another... // This will run another block
```

- Run :Http, :Httpv or :Httpd in nvim command

```:Http``` -- **only request with Accept header will formated**

```:Httpv``` -- verbose version (using curl -v)

```:Httpd``` -- debug mode, curl statement will appear on statusline

- Seperate window will appear and provide response from curl http request with time measurre in second

**You may check or contributing [wiki page](https://github.com/VArtzy/neocurl/wiki) to cover another case example.**

Footnotes
- ¹ Neocurl use neovim native UI (window) and curl, making an interactive interface and nearly raw curl performance.
- ² HTTP, OAuth and GraphQL supported through it need better support and does not user friendly right now (see wiki)
