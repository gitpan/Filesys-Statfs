# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
require 5.003;
use Filesys::Statfs;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

my $dir='/';
my @fsresult=Filesys::Statfs::statfs($dir);

defined(@fsresult) and
	print"ok 2\n" or
	die "not ok 2\nstatfs\(\) call failed for \"$dir\" $!\n";

print"All tests successful!\n\n";
print"statfs() call was successful. Results for directory: \"$dir\"\n";
my($type, $bsize, $blocks, $bfree, $bavail,
$files, $ffree) = @fsresult;

print"bsize=$bsize type=$type blocks=$blocks\n";
print"bfree=$bfree bavail=$bavail files=$files\n";
print"ffree=$ffree\n\n";
