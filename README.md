simple-slim-app
---

**dependency**
- docker-compose
- GNU Make
- blackfire's chrome extension
  - https://blackfire.io/docs/integrations/chrome

# 1. make compose

Run docker compose  
Before running, please get `Server Id` and `Server Token` from blackfire's logined page.  

```zsh
# make compose id={server id} token={server token}
$make compose id=xxx token=yyy
```

# 2. open simple slim app and run blackfire

open simple slim app.  

```zsh
# Mac only
$open 127.0.0.1:8080
```

# 3. Use blackfire's extension


