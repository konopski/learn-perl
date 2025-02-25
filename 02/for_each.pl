#!/usr/bin/env perl

foreach $ikx (0 .. 3) {
  print " $ikx \n";
}

print "\n----------\n";

@xyxy = ('A', 'B', 'C');
print @xyxy;
print "\n----------\n";

foreach (@xyxy) {
  print " $_ \n";
}
print "\n----------\n";

foreach $iks (@xyxy) {
  print " $iks \n";
}
print "\n----------\n";

foreach $iks (0 .. $#xyxy) {
  print " $iks \n";
  print " $xyxy[$iks]\n";
}
print "\n----------\n";


@wtfg = (1, 3, sort 4, 2);
print @wtfg;		# prints 1324 :o

print "\n----------\n";
