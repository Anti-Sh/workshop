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
    $employes = $dom->createElement('employes');
    $employee = $dom->createElement('employee');
    $fullname = $dom->createElement('fullname');
    $date_of_employment = $dom->createElement('date_of_employment');
    $post_id = $dom->createElement('post_id');
    $birth = $dom->createElement('birth');

    $fullname_text = $dom->createTextNode($_POST['fullname']);
    $fullname->appendChild($fullname_text);
    $employee->appendChild($fullname);
    $date_of_employment_text = $dom->createTextNode($_POST['date_of_employment']);
    $date_of_employment->appendChild($date_of_employment_text);
    $employee->appendChild($date_of_employment);
    $post_id_text = $dom->createTextNode($_POST['post_id']);
    $post_id->appendChild($post_id_text);
    $employee->appendChild($post_id);
    $birth_text = $dom->createTextNode($_POST['birth']);
    $birth->appendChild($birth_text);
    $employee->appendChild($birth);
    $employes->appendChild($employee);
    $dom->documentElement->appendChild($employes);
    $dom->save('../workshop.xml');
    echo 'Запись добавлена!';
    ?>
    <meta http-equiv="refresh" content="0; url=../workshop.xml">
</body>

</html>