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
    $orders = $dom->createElement('orders');
    $order = $dom->createElement('order');
    $client_id = $dom->createElement('client_id');
    $employee_id = $dom->createElement('employee_id');
    $status_id = $dom->createElement('status_id');
    $transaction_id = $dom->createElement('transaction_id');
    $date_order = $dom->createElement('date_order');
    $date_complete = $dom->createElement('date_complete');
    $comment = $dom->createElement('comment');

    $client_id_text = $dom->createTextNode($_POST['client_id']);
    $employee_id_text = $dom->createTextNode($_POST['employee_id']);
    $status_id_text = $dom->createTextNode($_POST['status_id']);
    $transaction_id_text = $dom->createTextNode($_POST['transaction_id']);
    $date_order_text = $dom->createTextNode($_POST['date_order']);
    $date_complete_text = $dom->createTextNode($_POST['date_complete']);
    $comment_text = $dom->createTextNode($_POST['comment']);

    $client_id->appendChild($client_id_text);
    $employee_id->appendChild($employee_id_text);
    $status_id->appendChild($status_id_text);
    $transaction_id->appendChild($transaction_id_text);
    $date_order->appendChild($date_order_text);
    $date_complete->appendChild($date_complete_text);
    $comment->appendChild($comment_text);

    $order->appendChild($client_id);
    $order->appendChild($employee_id);
    $order->appendChild($transaction_id);
    $order->appendChild($status_id);
    $order->appendChild($date_order);
    $order->appendChild($date_complete);
    $order->appendChild($comment);

    $orders->appendChild($order);

    $dom->documentElement->appendChild($orders);
    $dom->save('../workshop.xml');
    echo 'Запись добавлена!';
    ?>
    <meta http-equiv="refresh" content="0; url=../workshop.xml">
</body>

</html>