#!/usr/bin/perl
use MIME::Lite; # If not installed, do # cpan> install MIME::Lite
use Getopt::Std;
my $DEFAULT_SENDER = 'sender@test.com';       #change
my $DEFAULT_RECIPIENT = 'recipient@test.com'; #change
my (%o, $msg);

# process options

getopts('hf:t:s:', \%o);

$o{f} ||= $DEFAULT_SENDER;
$o{t} ||= $DEFAULT_RECIPIENT;
$o{s} ||= 'Virus email test';

if ($o{h} or !@ARGV) {
    die "請輸入相關參數:\n\t$0 [-h] [-f from] [-t to] [-s subject] files(or directory) ...\n";
}

print "SMTP server ip : [0.0.0.0] ";
chomp(my $SMTP_SERVER =  scalar (<STDIN>));
$SMTP_SERVER ||= '0.0.0.0';
print "\nUsing SMTP server: $SMTP_SERVER\n\n";
MIME::Lite->send('smtp', $SMTP_SERVER, Timeout=>60);

print "要重複發送幾次?: [1] ";
chomp(my $limit = scalar (<STDIN>));
$limit ||= 1;
print "\nRepeat $limit times!\n\n";
# construct and send email
for ( $n = 1; $n <= $limit; $n++ ) {
my $count=0;

my ($sec, $min, $hour, $mday, $mon) = localtime();
$mon = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')[$mon];
my $now1 = sprintf("%s %02d %02d:%02d:%02d", $mon, $mday, $hour, $min, $sec);
my $timestamp1= time;
print "$now1 Start sending emails.\n";
foreach my $file (@ARGV) {
$count++;
$msg = new MIME::Lite(
    From => $o{f},
    To   => $o{t},
    Subject => $o{s},
    Data => "Data",
    Type => "multipart/mixed",
);

  $msg->attach('Type' => 'application/octet-stream',
               'Encoding' => 'base64',
               'Path' => $file);
  $msg->send(  );

}

my ($sec, $min, $hour, $mday, $mon) = localtime();
$mon = ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')[$mon];
my $now2 = sprintf("%s %02d %02d:%02d:%02d", $mon, $mday, $hour, $min, $sec);
my $timestamp2= time;
my $diff = $timestamp2 - $timestamp1;
print "$now2 Finished, $count emails sent within $diff seconds.\n";
}
