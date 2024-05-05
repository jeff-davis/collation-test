
use Text::Lorem;

my $lines = $ARGV[0];
my $maxwords = $ARGV[1];

my $lorem = Text::Lorem->new();

my @replacements = (
    [qr/a/, "Ă"],
    [qr/n/, "И"],
    [qr/y/, "ÿ"],
    [qr/d/, "Ð"],
    [qr/e/, "E"],
    [qr/f/, "Æ"],
    [qr/g/, "国"]
    );

for ($i = 0; $i < $lines ; $i++) {
    my $nwords = int(rand($maxwords)) + 1;
    my $text = $lorem->words($nwords);

    foreach (@replacements) {
	my ($pattern, $replacement) = @$_;
	$text =~ s/$pattern/$replacement/g;
    }

    print $text . "\n";
}
