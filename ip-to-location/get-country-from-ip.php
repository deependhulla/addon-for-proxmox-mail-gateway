<?php
require_once 'IP2Location.php';
$db = new \IP2Location\Database('IP2LOCATION-LITE-DB1.BIN', \IP2Location\Database::FILE_IO);
$iphere=$argv[1];
$records = $db->lookup($iphere, \IP2Location\Database::ALL);
echo 'IP Address            : ' . $records['ipAddress'] . "\n";
echo 'Country Code          : ' . $records['countryCode'] . "\n";
echo 'Country Name          : ' . $records['countryName'] . "\n";
?>
