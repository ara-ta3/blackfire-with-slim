COMPOSER=composer.phar
PHP=$(shell which php)
host=127.0.0.1
port=8080
service=web
command=ls
args=

compose: vendor
	docker-compose up

server: vendor
	$(PHP) -S $(host):$(port) -t web

vendor:
	$(MAKE) install

install: $(COMPOSER)
	$(PHP) $(COMPOSER) install

$(COMPOSER):
	$(PHP) -r "eval('?>'.file_get_contents('https://getcomposer.org/installer'));"

compose/exec:
	docker-compose exec $(service) $(command) $(args)
