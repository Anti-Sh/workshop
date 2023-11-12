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
    $i = $_POST['row_index'] - 1;
    $counter = 0;
    $nodesList = $dom->getElementsByTagName('employee');
    $employes = $dom->getElementsByTagName('employes');
    if ($nodesList->length > 0) {
        foreach ($nodesList as $node) {
            if ($node->parentNode->tagName == 'arch_employes') {
                if ($counter == $i) {
                    if ($employes->length > 0) {
                        $employee = $node->parentNode->removeChild($node);
                        $employes->item(0)->appendChild($employee);
                        $dom->save('../workshop.xml');
                        break;
                    }
                }
                $counter += 1;
            }
        }
    }
    ?>
    <meta http-equiv="refresh" content="0; url=../workshop.xml">
</body>

</html>