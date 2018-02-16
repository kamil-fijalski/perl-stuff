use strict;
use warnings;
use Switch;

my ($letter, $word_size, $array_size, $temp_word, $error_count, $is_correct, $solution);
my (@indexes, @letterAnimate);
my $continue = "T";

while ($continue =~ m/y|t/i) {
    $error_count = 1;
    $is_correct = 1; # main variable to decide about end of the game
    @letterAnimate = '';

    print("Hello! Let me choose a word for you.");
    <stdin>;
    $solution = $temp_word = Random_Word();
    $word_size = length $solution;

    for(my $j = 0; $j < $word_size; $j++) { # prepare illustration of hide word
        $letterAnimate[$j] = "[ * ]";}

    print("Great! Your word has $word_size signs.\n");

    do {
        CheckEnding();
        if ($error_count <= 6 and $is_correct != 0) {
            print("\nGive one letter that you suppose to be in word... ");
            chomp($letter = <>);
            $letter = lc substr($letter, 0, 1); # secure if user type more than one sign
            @indexes = SearchLetter();
            $array_size = @indexes; # check if SearchLetter function found a letter in the word

            if ($array_size == 0) { # empty array -> no letter found
                print("Nope. This letter has not appeared\n");
                HangManAnimate();
                SolutionAnimate();
                $error_count += 1;} 
            else { # success, letter was found in the word
                print("Wonderful! Letter \'$letter\' appears $array_size time(s).\n");
                SolutionAnimate();}}
        elsif ($is_correct == 0) { # end game
            print("\nCongratulations! You won absolutely nothing!");}
        else {
            print("Game over! Your word is: $solution\n");
            HangManAnimate();
            $is_correct = 0;}

    } while ($is_correct > 0); 
    print("Do you want to play again? [Y/N] ");
    $continue = <>;
}

sub Random_Word {
    my $result;
    my @words1 = ("cat", "horse", "plant", "computer", "glass", "pen");
    my @words2 = ("book", "phone", "button", "cable", "console", "mouse");
    my @words3 = ("music", "heroes", "bread", "wall", "calendar", "station");
    my $temp1 = int rand(3); # choose wordset
    my $temp2 = int rand(6); # choose position of word in set

    if ($temp1 == 0) {
        $result = $words1[$temp2];}
    elsif ($temp1 == 1) {
        $result = $words2[$temp2];}
    elsif ($temp1 == 2) {
        $result = $words3[$temp2];}
    return $result;
}

sub SearchLetter {
    my $i = 0;
    my (@set_of_index, @word_array);

    @word_array = split('', $temp_word);
    for (my $k = 0; $k < length($temp_word); $k++) { # main loop where letters are found
        if ($word_array[$k] eq $letter) {
            $set_of_index[$i] = $k;
            $i += 1;
            $word_array[$k] = '*';}
    }
    $temp_word = join('', @word_array);

    return @set_of_index;
}

sub HangManAnimate {
    switch($error_count) {
        case 1 {
            print("X _ _ _ _ _\n");}
        case 2 {
            print("X X _ _ _ _\n");}
        case 3 {
            print("X X X _ _ _\n");}
        case 4 {
            print("X X X X _ _\n");}
        case 5 {
            print("X X X X X _\n");}
        case 6 {
            print("X X X X X X :(\n");}
        }
}

sub SolutionAnimate {
    foreach (@indexes) {
        $letterAnimate[$_] = "[ $letter ]";
    }
    print("@letterAnimate\n");
}

sub CheckEnding {
    my $final_word = "*" x $word_size;
    if ($temp_word eq $final_word) {
        $is_correct = 0;}
}
