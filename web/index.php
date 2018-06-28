<?php

use \Slim\Http\Request;
use \Slim\Http\Response;

require_once __DIR__ . '/../vendor/autoload.php';

$app = new \Slim\App([
	'settings' => []
]);

$container = $app->getContainer();

$container['view'] = function ($container) {
	$view = new \Slim\Views\Twig(__DIR__ . '/../templates', [
		'strict_variables' => true,
	]);

	$basePath = rtrim(str_ireplace('index.php', '', $container['request']->getUri()->getBasePath()), '/');
	$view->addExtension(new Slim\Views\TwigExtension($container['router'], $basePath));

	return $view;
};

$app->get('/', function ($request, $response, $args) {
	return $this->view->render($response, 'index.html', []);
});

$app->post('/hey', function($request, $response, $args) {
    $name = $request->getParam('name');
    return $response->withJson([
        'message' => sprintf('hey %s', $name),
    ]);
});

$app->run();
