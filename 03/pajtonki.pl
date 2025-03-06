#!/usr/bin/env perl

use Data::Dumper;

#print "$ARGV[0] \n";
#print "$ARGV[1] \n";

open (MYFILE, "git diff $ARGV[0]..$ARGV[1] --name-only -- '*.py' |") || die "something failed $!\n";
print $MYFILE, "\n" ;

my %changes;

while ($somefile = <MYFILE>) {
    chop $somefile;
    #print "$somefile \n" ;
    open (DFFF, "git diff $ARGV[0]..$ARGV[1] -- ../$somefile | grep python | grep -v pytzdata |") || die "something failed $!\n";

    my $old_line = "";
    my $new_line = "";
    while ($diff = <DFFF>) {

        chomp $diff;
        if($diff =~ /^-(.*)/) {
            $old_line = "$diff";
        }
        if($diff =~ /^\+(.*)/) {
            $new_line = "$diff";
        }
        if($old_line && $new_line ) {
            $change = "$old_line => $new_line";
            print "$change : \t\t\t $somefile \n";
            push @{$changes{$change}}, "$somefile"; 
            $old_line = "";
            $new_line = "";
        }   
    }
}

#print Dumper(\%changes);

foreach (sort keys %changes) {
   print $_, "\n";
   print join("\n\t", @{$changes{$_}}) ;
   print "\n-------\n";
   
}

