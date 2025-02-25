#!/usr/bin/env perl

@testies = (
 '',
 ' ',
 '0',
 0,
 0.0,
 0e1,
 (),
 '\x0'
);

foreach $ikx (0 .. $#testies) {
    print " $ikx) <@testies[$ikx]> ";
    print "true" if @testies[$ikx] ;
    print "false" if ! @testies[$ikx] ;
    print "\n";
}
