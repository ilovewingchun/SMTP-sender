This perl script is used to send emails that attach multiple files as attchments.
Multiple attachments will be sent one by one, resursively.
You will need to specify SMTP server location during the scrpit. By default it is 0.0.0.0, remember to give it a proper location.
You will also be prompted with how many times do you want to repeat. This is for stress testing.
In the end of the script, it will calculate how much time does it spend on sending all emails.


Usage: 
<p><code><pre>smtp_sender_eng.pl [-h] [-f from] [-t to] [-s subject] files(or directory/*)
</code></pre>

For example: 
<code><pre>$ perl smtp_sender_eng.pl -f sender@test.com -t recipient@test.com -s "My Subjects" /var/files/file1 /var/files/file2 
Please enter SMTP server ip : [0.0.0.0] 192.168.1.1

Using SMTP server: 192.168.1.1

How many times do you want to repeat sending?: [1] 

Repeat 1 times!

Apr 18 20:41:28 Start sending emails.
Apr 18 20:41:28 Finished, 2 emails sent within 2 seconds.
$</code></pre>

This script also supports wildcard:
$ perl smtp_sender_eng.pl -f sender@test.com -t recipient@test.com -s "My Subjects" /var/files/*
