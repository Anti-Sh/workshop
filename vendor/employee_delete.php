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
    $ii = $_POST['row_index'];
    $i = $ii - 1;
    $nodeToDelete = $dom->getElementsByTagName('employee')->item($i);

    if ($nodeToDelete) {
        $nodeToDelete->parentNode->removeChild($nodeToDelete);
    }
    print_r($nodeToDelete);
    $dom->save('../workshop.xml');
    ?>
    <meta http-equiv="refresh" content="0; url=../workshop.xml">
</body>

</html>