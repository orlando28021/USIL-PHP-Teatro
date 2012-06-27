<?php
session_start();

require_once  'lib/EpiCurl.php';
require_once 'lib/EpiOAuth.php';
require_once 'lib/EpiTwitter.php';

$consumer_key = 'c2U7tQ4TKMWpNt5nJzShRQ';
$consumer_secret = 'LXjznd5IgF514kWmFGTNi3bl0N3ks7avsk0WSO6X8xs';

$twitterObj = new EpiTwitter($consumer_key, $consumer_secret);

$error = null;

$login = '<a href="' . $twitterObj->getAuthorizationUrl() . '">Login Twitter</a>';
$logout = '<a href="index.php?logout=true">Log out</a>';
if ((isset($_GET['logout'])) && ($_GET['logout']=='true')) {
session_destroy();
session_unset();
header('Location: ./index.php');
}
if (isset($_GET['oauth_token']) || ( isset($_SESSION['oauth_token']) && isset($_SESSION['oauth_token_secret']) )){
    //Acceso
    if (!isset($_SESSION['oauth_token']) || !isset($_SESSION['oauth_token_secret'])){
        //Viene de twitter
        $twitterObj->setToken($_GET['oauth_token']);
        $token = $twitterObj->getAccessToken();
        $_SESSION['oauth_token'] = $token->oauth_token;
        $_SESSION['oauth_token_secret'] = $token->oauth_token_secret;

        $twitterObj->setToken($token->oauth_token, $token->oauth_token_secret);
    } else {
        //Ya nos dio acceso
        $twitterObj->setToken($_SESSION['oauth_token'], $_SESSION['oauth_token_secret']);
   }
    $user = $twitterObj->get_accountVerify_credentials();
    $datos = "Bienvenido $user->name (@$user->screen_name) , Tienes $user->followers_count seguidores y te encuentras en $user->location";
    //print_r($user);
} elseif (isset($_GET['denied'])){
    $error = 'Debes permitir acceso a tu cuenta de twitter';
}

 if (isset($_GET['oauth_token'])
                        || ( isset($_SESSION['oauth_token'])
                                && isset($_SESSION['oauth_token_secret']) )){

                                    echo $datos . "   ".$logout;
                                }
                                else {
                                    echo $login;
                                }

                        echo $error;
                ?>
            