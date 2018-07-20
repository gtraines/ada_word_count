# The first step in creating an executable program is to compile the units of the program
# using the gcc command. You must compile the following files:
# • the body file (‘.adb’) for a library level subprogram or generic subprogram
# • the spec file (‘.ads’) for a library level package or generic package that has no body
# • the body file (‘.adb’) for a library level package or generic package that has a body
# You need not compile the following files
# • the spec of a library unit which has a body
# • subunits
# because they are compiled as part of compiling related units.
# build_text_counter.sh

if [ -e awordcount ]
then
    rm awordcount
fi

gnat make awordcount.adb
gnat bind awordcount
gnat compile awordcount
gnat link awordcount
chmod +x awordcount

rm awordcount.ali
rm awordcount.o