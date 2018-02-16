use strict;
use warnings;

print("Choose your number in decimal system: ");
chomp(my $num = <>);
print("Great. You choose $num\n");
my $result = Convert($num);
print("In binary system $num is $result");
<STDIN>;

sub Convert{
    my ($number) = @_;
    my $binary = '';

    while($number > 1) {
        if ($number%2 == 0) {
            $binary = $binary . '0';}   
        else {
        $binary = $binary . '1';}

        $number = int($number / 2);
    }

    if ($number == 1) {
        $binary = $binary . '1';}

    return reverse($binary);
}
