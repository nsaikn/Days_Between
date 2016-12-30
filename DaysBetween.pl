#!c:\strawberry\perl\bin\perl.exe

# Days Between Two Dates 
# Saikrishna Chalasani
# Start Date: Dec 30th, 2016
# End Date: Dec 30th, 2016

use strict;
use warnings;

my ($startYear, $startMonth, $startDay, $endYear, $endMonth, $endDay);
my ($days);
my %monthDay = (
	0 => 0, # included this for the for loop in days, I didnt want to have an If statement to check if it was first month or not...
	1 => 31,
	2 => 28,
	3 => 31,
	4 => 30,
	5 => 31,
	6 => 30,
	7 => 31,
	8 => 31,
	9 => 30,
	10 => 31,
	11 => 30,
	12 => 31,
); 

print "Enter the first date's year:";
$startYear = <STDIN>;
print "Enter the first date's month (as a number):";
$startMonth = <STDIN>;
print "Enter the first date's day:";
$startDay = <STDIN>;

print "Enter the second date's year:";
$endYear = <STDIN>;
print "Enter the second date's month (as a number):";
$endMonth = <STDIN>;
print "Enter the second date's day:";
$endDay = <STDIN>;

$days = ($endYear-$startYear)*365;
for (my $i = $startYear+1; $i<$endYear; $i++){		
#factors in leap years in between the dates 	 
	if (( $i%4 == 0 && $i%100 != 0) || ($i%400 == 0)){ 	
		$days++;
	}
}
if (($startYear%4 == 0 && $startYear%100 != 0) || ($startYear%400 == 0)){
	if ($startMonth < 2 || $startMonth == 2 && $startDay < 29){
		$days++;
	}
}
if (($endYear%4 == 0 && $endYear%100 != 0) || ($endYear%400 == 0)){
	if ($endMonth > 2 || $startMonth == 2 && $startDay == 29){
		$days++;
	}
}

$days += CalcDays($endYear, $endMonth, $endDay) - CalcDays($endYear, $startMonth, $startDay);
print $days;

sub CalcDays(){
	my($eY, $m, $d) = @_;
	my $tempDays = $d;	#accounts for days of that month 
	for(my $i = 1; $i<$m; $i++){	#accounts for the days before the present month
		$tempDays += $monthDay{$i};
	}
	if ((($eY%4 != 0 || $eY%100 == 0) && ($eY%400 != 0)) && $d ==29){	#end year is not leap year and date is 29 
		$tempDays--; # day is reduced by one to account for the 29th day for when the end-start occurs on line 63
	}
	return $tempDays;
}