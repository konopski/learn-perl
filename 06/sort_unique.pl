while (<>) {
  tr/A-Z/a-z/;
  @xyxy =  split(/[^a-z]/, $_);
  @xyxy = sort(@xyxy); 

  foreach $i (0 .. $#xyxy) {
      
          print "$xyxy[$i]  " if ( $xyxy[$i] ne $xyxy[$i+1] ) ; 
  }
  
}
