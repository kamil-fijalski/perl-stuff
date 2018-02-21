use strict;
use warnings;
use List::Util qw(shuffle);

my ($password, $length, $special_signs_cnt, $numbers_cnt, $big_letters_cnt, $normal_letters_cnt, $i,  $j, $k, $l, $temp1);
my (@special, @number, @big_letter, @normal_letter, @password);

print("Hello! Let me generate password for you! Press [ENTER] ");
<STDIN>;
print("How long your password should be? (4 signs is minimum) ");
chomp($length = <>);
CheckLength();
Generate();
print("Your password is: $password");

sub Generate {
    # random range of signs
    $special_signs_cnt = int($length / 4);   # 25%
    $numbers_cnt = int($length / 4);         # 25%
    $big_letters_cnt = int($length / 4);     # 25%
    $normal_letters_cnt = int($length / 4);  # 25%  
    
    # random signs
    ChooseSpecial();
    ChooseNumber();
    ChooseBig();
    ChooseNormal();

    # fulfill remaining posionts with normal letters
    FulfillPassword();

    # shuffle signs
    @password = shuffle (shuffle (shuffle @password));
    $password = join('', @password);
}

sub ChooseSpecial {
    $special_signs_cnt = int($length / 4);
    @special = ("!", "@", "#", "\$", "%", "^", "&", "*", "(", ")", ":", ";", "<", ">", "?", "/", "|");
    for($i = 0; $i < $special_signs_cnt; $i++) {
        $temp1 = int rand(@special);
        $password[$i] = $special[$temp1];}
}

sub ChooseNumber {
    @number = ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
    for($j = $i; $j < $numbers_cnt + $i; $j++) {
        $temp1 = int rand(@number);
        $password[$j] = $number[$temp1];}    
}

sub ChooseBig {
    @big_letter = ("Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M");
    for ($k = $j; $k < $big_letters_cnt + $j; $k++) {
        $temp1 = int rand(@big_letter);
        $password[$k] = $big_letter[$temp1];}
}

sub ChooseNormal {
    @normal_letter = ("q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m");
    for ($l = $k; $l < $normal_letters_cnt + $k; $l++) {
        $temp1 = int rand(@normal_letter);
        $password[$l] = $normal_letter[$temp1];}
}

sub CheckLength {
    while ($length < 4) {
    print("Your length is too short. Try again. ");
    chomp($length = <>);}
}

sub FulfillPassword {
    while (@password < $length) {
        $k = @password;
        $normal_letters_cnt = 1;
        ChooseNormal();}
}
