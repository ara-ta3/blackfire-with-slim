COMPOSER=composer.phar
PHP=$(shell which php)
host=127.0.0.1
port=8080
service=web
command=ls
args=

compose: blackfire.ini
	docker-compose build
	docker-compose up

server: vendor blackfire/start
	$(PHP) -S $(host):$(port) -t web

blackfire/start:
	/etc/init.d/blackfire-agent start

vendor:
	$(MAKE) install

install: $(COMPOSER)
	$(PHP) $(COMPOSER) install

$(COMPOSER):
	$(PHP) -r "eval('?>'.file_get_contents('https://getcomposer.org/installer'));"

compose/exec:
	docker-compose exec $(service) $(command) $(args)

id=
token=
blackfire.ini:
	echo "$$blackfire" > $@

define blackfire
[blackfire]
server-id=$(id)
server-token=$(token)
endef
export blackfire
