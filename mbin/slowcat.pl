#!/usr/bin/perl
#http://pleac.sourceforge.net/include/perl/ch01/slowcat
# slowcat - emulate a   s l o w   line printer
# usage: slowcat [-DELAY] [files ...]
$DELAY = ($ARGV[0] =~ /^-([.\d]+)/) ? (shift, $1) : 1;
$| = 1;
while (<>) {
    for (split(//)) {
        print;
        select(undef,undef,undef, 0.005 * $DELAY);
    }
}
