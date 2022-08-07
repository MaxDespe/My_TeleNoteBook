<?php
require('config.php');
require('class-http-request.php');
require('functions.php');

$result = $dbuser->query("SELECT * FROM telegram_NoteBot_reminder WHERE timestamp < '" . time() . "'");
while($row = $result->fetch_assoc()) {
  $result = $dbuser->query("SELECT * FROM telegram_NoteBot_memo WHERE id = '" . $row["memoid"] . "'");
  $row2 = $result->fetch_array(MYSQLI_ASSOC);
  $result = $dbuser->query("SELECT * FROM telegram_NoteBot_user WHERE userID = '" . $row["userID"] . "'");
  $row3 = $result->fetch_array(MYSQLI_ASSOC);
  $timezone = $row3['timezone'];

  switch ($row3["lang"]) {
    case 'ru':
    if($timezone == FALSE) $timezone = "Europe/Moscow";
    date_default_timezone_set($timezone);
    include($langdir . "message.en.php");
    include($langdir . "message.ru.php");
    break;
  }

  $menu[] = array(array(
    "text" => $lang['delete'],
    "callback_data" => "deleterem-" . $row["memoid"]));
    sm($row["userID"], $lang['remindertext'] . date("H:i") . ".\n\n" . $row2["memo"], $menu, false, false, false, false, true);
    $dbuser->query("DELETE FROM telegram_NoteBot_reminder WHERE id = '" . $row["id"] . "'");
}
?>
