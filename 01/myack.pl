#!/usr/bin/env perl

open (MYFILE, "find . |") || die "something failed $!";

MYFILE:
while ($somefile = <MYFILE> ) {
    chop $somefile;
    if (-T $somefile) {
        ### print "$somefile is text\n";

        if(!open(SOMEFILE_HANDLE, $somefile)) {
            print STDERR "error reading $somefile: $! \n";
            next MYFILE;
        } 
        while(<SOMEFILE_HANDLE>){
            foreach $word (@ARGV) {
                if ( index($_, $word) >= 0 ) {
                   print "$somefile \n"; 
                   next MYFILE;
                }     
            }
        }

#    } else {
#        print "$somefile is not a text\n";
    }


}
