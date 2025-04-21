while (<>) {
  # lc ;  # lower case # tr/A-Z/a-z/;

  @xyxy = sort split /[^a-z]/, lc ;

  foreach $i (0 .. $#xyxy) {
      
          print "$xyxy[$i]  " if ( $xyxy[$i] ne $xyxy[$i+1] ) ; 
  }
  
}
