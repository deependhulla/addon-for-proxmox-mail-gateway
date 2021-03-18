<?php

## normall its 2 for global blacklist ..if not check using : pmgsh get /config/ruledb/who
$pmgwhoid=2;

$fe=file_get_contents('list-of-emails-to-block.txt');
$fd=file_get_contents('list-of-domains-to-block.txt');
$fi=file_get_contents('list-of-ips-to-block.txt');

## for creating api via shell pgmsh
$pc="pmgsh create /config/ruledb/who/".$pmgwhoid."/";

## for getting existing list ..and not to add repeat entry if exist
$pl="pmgsh get /config/ruledb/who/".$pmgwhoid."/objects 2>/dev/null";
$gl=`$pl`;
$al=json_decode($gl, true);
#print $gl;
#print_r($al);
#print "\n ----\n";

########## work on email adding
$otype=1001;$oid='email';
$ai=0;$an=0;
$fileline=explode("\n",$fe);
for($i=0;$i<sizeof($fileline);$i++){if($fileline[$i]!="" ){
#print "\n --> $i --> ".$fileline[$i];
$addnow=1;
for($a=0;$a<sizeof($al);$a++){if($al[$a]['otype']==$otype){
#print "\n CHECK $i ".$al[$a]['otype']." -->".$al[$a][$oid];
if($al[$a][$oid] == $fileline[$i]){$an++;$addnow=0;}}}
if($addnow==1){$ai++;
$cmdx=$pc.$oid." -".$oid." ".$fileline[$i]." 2>/dev/null";
#print "\n CMD $i --  $cmdx ";
$cmdxout=`$cmdx`;}}}
print "\n$oid : $ai added while $an was already present.";

########## work on domain adding
$otype=1002;$oid='domain';
$ai=0;$an=0;
$fileline=explode("\n",$fd);
for($i=0;$i<sizeof($fileline);$i++){if($fileline[$i]!="" ){
#print "\n --> $i --> ".$fileline[$i];
$addnow=1;
for($a=0;$a<sizeof($al);$a++){if($al[$a]['otype']==$otype){
#print "\n CHECK $i ".$al[$a]['otype']." -->".$al[$a][$oid];
if($al[$a][$oid] == $fileline[$i]){$an++;$addnow=0;}}}
if($addnow==1){$ai++;
$cmdx=$pc.$oid." -".$oid." ".$fileline[$i]." 2>/dev/null";
#print "\n CMD $i --  $cmdx ";
$cmdxout=`$cmdx`;}}}
print "\n$oid : $ai added while $an was already present.";


########## work on ip adding
$otype=1003;$oid='ip';
$ai=0;$an=0;
$fileline=explode("\n",$fi);
for($i=0;$i<sizeof($fileline);$i++){if($fileline[$i]!="" ){
#print "\n --> $i --> ".$fileline[$i];
$addnow=1;
for($a=0;$a<sizeof($al);$a++){if($al[$a]['otype']==$otype){
#print "\n CHECK $i ".$al[$a]['otype']." -->".$al[$a][$oid];
if($al[$a][$oid] == $fileline[$i]){$an++;$addnow=0;}}}
if($addnow==1){$ai++;
$cmdx=$pc.$oid." -".$oid." ".$fileline[$i]." 2>/dev/null";
#print "\n CMD $i --  $cmdx ";
$cmdxout=`$cmdx`;}}}
print "\n$oid : $ai added while $an was already present.";


print "\n";
?>
