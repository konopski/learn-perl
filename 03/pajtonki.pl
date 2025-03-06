#!/usr/bin/env perl



open (MYFILE, "git diff $ARGV[0]..$ARGV[1] --name-only -- '*.py' |") || die "something failed $!\n";
print $MYFILE, "\n" ;

my %changes;

while ($somefile = <MYFILE>) {
    chop $somefile;
    #print "$somefile \n" ;
    open (DFFF, "git diff $ARGV[0]..$ARGV[1] -- $somefile | head |") || die "something failed $!\n";

    my $old_line = "";
    my $new_line = "";
    DIFF:
    while (<DFFF>) {

        chomp ;
        
        next DIFF if /^---/ || /^\+\+\+/ ;
        

        if(/^-(.*)/) {
            $old_line = "$_";
#            print "old_line: \t $old_line\n";
        }
        if(/^\+(.*)/) {
            $new_line = "$_";
#            print "new_line: \t $new_line\n";
        }
        if($old_line && $new_line ) {
            $change = "$old_line => $new_line";
#            print "$change : \t\t\t $somefile \n";
            push @{$changes{$change}}, "$somefile"; 
            $old_line = "";
            $new_line = "";
        }   
    }
}


foreach (sort keys %changes) {
   print $_, "\n";
   print join("\n\t", @{$changes{$_}}) ;
   print "\n-------\n";
   
}

