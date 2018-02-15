use strict;
use warnings;

print("Input A coefficient: ");
chomp(my $a1 = <>);
print("Input B coefficient: ");
chomp(my $b1 = <>);
print("Input C coefficient: ");
chomp(my $c1 = <>);
my @result = SquareEquation($a1, $b1, $c1);

if ($a1 <= 0) {
    print("Uncorrect coefficients. Equation has no solution.");
}
else {
    if ($result[0] eq '') {
        print("Equation has no solution. Probably, delta determinant is negative");}
    elsif ($result[1] ne '') {
        print("Equation has two solutions: $result[0] and $result[1]");}
    else {
        print("Equation has one, double solution: $result[0].");}
}

sub SquareEquation {
    my ($a, $b, $c) = @_;
    my ($x1, $x2);

    my $delta = $b ** 2 - 4 * $a * $c;
    if ($delta == 0) {
        $x1 = (-1 * $b) / (2 * $a);
        $x2 = '';}
    elsif ($delta < 0) {
        $x1 = '';
    }
    else {
        $x1 = (-1 * $b - sqrt($b ** 2 - 4 * $a * $c))/(2 * $a);
        $x2 = (-1 * $b + sqrt($b ** 2 - 4 * $a * $c))/(2 * $a);
    }
    my @solution = ($x1, $x2);

    foreach (@solution) {
        if($_ < 0) {
            $_ = substr($_, 0, 4);}
        else {
            $_ = substr($_, 0, 3);}
    }
    return @solution;
}
