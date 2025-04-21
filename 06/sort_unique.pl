while (<>) {
  tr/A-Z/a-z/;
  @xyxy = sort( split(/[^a-z]/, $_));

  foreach $i (0 .. $#xyxy) {
      
          print "$xyxy[$i]  " if ( $xyxy[$i] ne $xyxy[$i+1] ) ; 
  }
  
}
