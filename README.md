This perl script is used to send emails that attach multiple files as attchments.
Multiple attachments will be sent one by one, resursively.
In the end of the script, it will calculate how much time does it spend on sending all emails.

For example:

$ perl smtp_sender_eng.pl -f sender@test.com -t recipient@test.com -s "My Subjects" /var/files/file1 /var/files/file2 
Please enter SMTP server ip : [0.0.0.0] 192.168.1.1

Using SMTP server: 192.168.1.1

How many times do you want to repeat sending?: [1] 

Repeat 1 times!

Apr 18 20:41:28 Start sending emails.
Apr 18 20:41:28 Finished, 2 emails sent within 2 seconds.
$

This script also supports wildcard:
$ perl smtp_sender_eng.pl -f sender@test.com -t recipient@test.com -s "My Subjects" /var/files/*