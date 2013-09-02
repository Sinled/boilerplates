<?php
	
require_once 'vendor/autoload.php';

$tmpl_folder = 'templates';

$tmpl_name = 'index.html';

$not_find_tmpl = '404.html';

$url_path = (empty($_SERVER['PATH_INFO']) ? @$_SERVER['SCRIPT_URL'] : @$_SERVER['PATH_INFO']);

if (!empty($url_path) && $url_path != "/"){
	$tmpl_name = sprintf('%s.html', substr($url_path, 1));
}

$loader = new Twig_Loader_Filesystem($tmpl_folder);

$twig = new Twig_Environment($loader, array(
    // 'cache' => 'tmp/compilation_cache',
));
//@todo: refactor
if(!file_exists($tmpl_folder . '/' . $tmpl_name)){
	$template = $twig->loadTemplate($not_find_tmpl);
}else{
	$template = $twig->loadTemplate($tmpl_name);
}

echo $template->render(array());

?>
