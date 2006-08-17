###############################################################################
#                                                                             #
#            Geo::Postcodes::NO Test Suite 2 - Object interface               #
#            --------------------------------------------------               # 
#               Arne Sommer - perl@bbop.org  - 19. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 1_objects.t'.     #
#                                                                             #
###############################################################################

use Test::More tests => 22;

BEGIN { use_ok('Geo::Postcodes::NO') };

#################################################################################

my $P = Geo::Postcodes::NO->new("1178"); # My postal code.
isa_ok($P, "Geo::Postcodes::NO");

is( $P->postcode(),       "1178",         "Postnummerobjekt > Postnummer");
is( $P->location(),       "OSLO",         "Postnummerobjekt > Kommunenummer");
is( $P->borough_number(), "0301",         "Postnummerobjekt > Kommunenummer");
is( $P->borough(),        "OSLO",         "Postnummerobjekt > Kommune");
is( $P->county(),         "OSLO",         "Postnummerobjekt > Fylke");
is( $P->type(),           "ST",           "Postnummer > Kategori");
is( $P->type_verbose(),   "Gateadresse",  "Postnummer > Kategori");
is( $P->Geo::Postcodes::type_verbose(),   "Street address", "Postnummer > Kategori");

## Try another one, where the names differ. #####################################

my $P2 = Geo::Postcodes::NO->new("2542"); # Another one.
isa_ok($P2, "Geo::Postcodes::NO");

is( $P2->postcode(),       "2542",         "Postnummerobjekt > Postnummer");
is( $P2->location(),       "VINGELEN",     "Postnummerobjekt > Kommunenummer");
is( $P2->borough_number(), "0436",         "Postnummerobjekt > Kommunenummer");
is( $P2->borough(),        "TOLGA",        "Postnummerobjekt > Kommune");
is( $P2->county(),         "HEDMARK",      "Postnummerobjekt > Fylke");
is( $P2->type(),           "ST",           "Postnummer > Kategori");
is( $P2->type_verbose(),   "Gateadresse", "Postnummer > Kategori");
is( $P2->Geo::Postcodes::type_verbose(),   "Street address", "Postnummer > Kategori");

## And now, error handling ######################################################

my $P3 = Geo::Postcodes::NO->new("9999"); # Dette postnummeret er ikke i bruk.
is( $P3, undef, "Undef ved ulovlig postnummer");

$P3 = Geo::Postcodes::NO->new(undef); 
is( $P3, undef, "Undef ved ulovlig postnummer");

$P3 = Geo::Postcodes::NO->new("Totusensekshundreognoenogtredve"); 
is( $P3, undef, "Undef ved ulovlig postnummer");

## Really, really nasty errors ##################################################

## $P3 = Geo::Postcodes::NO->new("Totusensekshundreognoenogtredve"); 
## is( $P3->postcode(),    undef,         "Undef ved ulovlig postnummer");


#################################################################################

