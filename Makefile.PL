use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'	=> 'Filesys::Statfs',
    'VERSION_FROM' => 'Statfs.pm', # finds $VERSION
    'LIBS'	=> [''],   # e.g., '-lm' 
    'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING' 
    'INC'	=> '',     # e.g., '-I/usr/include/other' 
);
