###############################################################################
#                                                                             #
#           Geo::Postcodes::NO Test Suite 4 - Available methods               #
#           ---------------------------------------------------               #
#               Arne Sommer - arne@cpan.org  - 18. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 4_check.t'.       #
#                                                                             #
###############################################################################

use Test::More tests => 21;

BEGIN { use_ok('Geo::Postcodes::NO') };

###############################################################################

my @methods  = qw(postcode location borough borough_number county type
                  selection);

my @methods1 = Geo::Postcodes::NO::methods();
my @methods2 = Geo::Postcodes::NO->methods();

is_deeply(\@methods, \@methods1, "Geo::Postcodes::NO::methods()");
is_deeply(\@methods, \@methods2, "Geo::Postcodes::NO->methods()");

foreach (@methods)
{
  ok (Geo::Postcodes::NO::is_method($_), "Geo::Postcodes::NO::is_method()");
  ok (Geo::Postcodes::NO->is_method($_), "Geo::Postcodes::NO->is_method()");
}

foreach (qw (just kidding))
{
  ok (! Geo::Postcodes::NO::is_method($_), "Geo::Postcodes::NO::is_method()");
  ok (! Geo::Postcodes::NO->is_method($_), "Geo::Postcodes::NO->is_method()");
}
