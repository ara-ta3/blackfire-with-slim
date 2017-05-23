COMPOSER=composer.phar
PHP=$(shell which php)

install: $(COMPOSER)
	$(PHP) $(COMPOSER) install

$(COMPOSER):
	$(PHP) -r "eval('?>'.file_get_contents('https://getcomposer.org/installer'));"
