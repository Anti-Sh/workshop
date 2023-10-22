<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>

<body>
    <?php
    $dom = new DOMDocument();
    $dom->load('../workshop.xml');
    $clients = $dom->createElement('clients');
    $client = $dom->createElement('client');
    $fullname = $dom->createElement('fullname');
    $email = $dom->createElement('email');
    $telephone = $dom->createElement('telephone');
    $birth = $dom->createElement('birth');

    $fullname_text = $dom->createTextNode($_POST['fullname']);
    $fullname->appendChild($fullname_text);
    $client->appendChild($fullname);
    $email_text = $dom->createTextNode($_POST['email']);
    $email->appendChild($email_text);
    $client->appendChild($email);
    $telephone_text = $dom->createTextNode($_POST['telephone']);
    $telephone->appendChild($telephone_text);
    $client->appendChild($telephone);
    $birth_text = $dom->createTextNode($_POST['birth']);
    $birth->appendChild($birth_text);
    $client->appendChild($birth);
    $clients->appendChild($client);
    $dom->documentElement->appendChild($clients);
    $dom->save('../workshop.xml');
    echo 'Запись добавлена!';
    ?>
    <meta http-equiv="refresh" content="0; url=../workshop.xml">
</body>

</html>