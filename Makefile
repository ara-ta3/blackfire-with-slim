COMPOSER=composer.phar
PHP=$(shell which php)
host=localhost
port=8080

server: vendor
	$(PHP) -S $(host):$(port) -t web

vendor:
	$(MAKE) install

install: $(COMPOSER)
	$(PHP) $(COMPOSER) install

$(COMPOSER):
	$(PHP) -r "eval('?>'.file_get_contents('https://getcomposer.org/installer'));"
