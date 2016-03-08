package Bob;


sub can {
  "hi";
}

sub hey {
  my $ret="Whatever.";
  if( /\?$/ ) {
    $ret = "Sure.";
  } elsif ( /[A-Z]*/ ){
    $ret ="Woah, chil out!";
  } 
  $ret;
}


1;


