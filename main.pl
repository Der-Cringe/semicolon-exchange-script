#!/usr/bin/perl
use warnings;
use strict;

my ($oldData,$filename) =  ("","example.pl"); 

open(FH, '<', $filename) or die $!;
$oldData.=$_ while(<FH>);
close(FH);

my ($randomValue, $semicolonCount,$fakeSemicolon, $newData,$max) = (0,0,";","",0);
$randomValue = int(rand((() = $oldData =~ /;/gi)-1))+1;
foreach( split(/\n/, $oldData ) ){
    ($_ =~ ";") ? (++$semicolonCount) : 0;
    ($randomValue == $semicolonCount) ? ($_ =~ s/;/$fakeSemicolon/g) : 0;
    $newData.= "$_\n";
}

open(FH, '>', $filename) or die $!;
print FH $newData;
close(FH);