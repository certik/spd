Hello,

This README.txt describes build instruction for Sage. If you downloaded
a binary, you do not need to do anything, just execute

 ./sage 

from the command line and you are good to go. If you download the sources,
please read below on how to build Sage and work around common issues. 

----------------------------------------------------------------

VERY QUICK INSTRUCTIONS TO BUILD FROM SOURCE:
   1. Make sure you have the dependencies.

     LINUX (install these using your package manager):
          gcc, g++, make, m4, perl, ranlib, and tar.

     OSX: XCode.  WARNING: If "gcc -v" outputs 4.0.0, you 
          *must* upgrade XCode (free from Apple), since that
          version of GCC is very broken. 

     NOTE: On some operating systems it might be necessary
     to install gas/as, gld/ld, gnm/nm, but on most these
     are automatically installed when you install the 
     programs listed above.  Only OS X >= 10.4.x and certain
     Linux distributions are officially supported.  See below
     for a complete list. 
 
   2. Extract the tarball:
          tar xvf sage-*.tar

   3. cd into the sage directory and type make:
          cd sage-*
          make
 
     That's it!  Everything is automatic and non-interactive.

NOTE:  On Linux if you get this error message: 
  " restore segment prot after reloc: Permission denied "
the problem is probably related to SE Linux:
     http://www.ittvis.com/services/techtip.asp?ttid=3092

----------------------------------------------------------------

    Sage: Open Source Mathematical Software
    Copyright (C) 2006, 2007, 2008 William Stein
    Distributed under the terms of the GNU General Public License (GPL) 
                  http://www.sagemath.org
    If you have questions, do not hesitate to email wstein@gmail.com
    or (even better!) sage-support@googlegroups.com:
         http://groups.google.com/group/sage-support

AUTHORS: There are over 125 people who have contributed code 
to Sage.  Please see one of the websites above for a list.  In many 
cases documentation for modules and functions list the authors.

OFFICIALLY SUPPORTED PLATFORMS:
    Building of Sage from source is regularly tested on  
    (minimal installs of) the following platforms:

       PROCESSOR       OPERATING SYSTEM
       x86             32-bit Linux -- Debian, Ubuntu, RHEL5, Fedora Core, CentOS, Suse, Mandriva
       x86_64          64-bit Linux -- Debian, Redhat, Suse
       ia64 itanium2   64-bit Linux -- Redhat, Suse
       x86             Apple Mac OS X 10.5.x 
       ppc             Apple Mac OS X 10.5.x

    Use Sage on Microsoft Windows via VMware.
    We do not always test on OS X 10.4, but Sage should work there fine.

NOTE: If you're using Fortran on a platform without g95 binaries included
      with Sage, e.g., Itanium, you must use a system-wide gfortran.  You 
      have to explicitly tell the build process about the fortran
      compiler and library location.  Do this by typing

          export SAGE_FORTRAN=/exact/path/to/gfortran
          export SAGE_FORTRAN_LIB=/path/to/fortran/libs/libgfortran.so

UNSUPPORTED, BUT HIGH PRIORITY TO SUPPORT SOON:
       sparc           Solaris 9, Solaris 10
       x86_64          Solaris 10
 

IMPLEMENTATION: 
     Sage has significant components written in the following
     languages: C/C++, Python, Lisp, and Fortran.  Lisp and 
     Python are built as part of Sage, and Fortran (g95) is
     included (x86 Linux and OS X only), so you do not need 
     them in order to build Sage.

MORE DETAILED INSTRUCTIONS TO BUILD FROM SOURCE:
    (See the installation guide for more details.)
    1. Make sure you have about 700MB free disk space.
    2. Linux: Install gcc, g++, m4, ranlib, and make.  
              The build should work fine on SUSE, FC, Ubuntu, etc.  If
              it doesn't, we want to know!
       OS X:  Make sure you have XCode version >= 2.4, i.e., gcc -v
              should output build >= 5363.   If you don't, go to
              http://developer.apple.com/ sign up, and download the 
              free XCode package.  Only OS X >= 10.4 is supported. 
       Windows: Download and install VMware, install linux into it, etc. 
    3. Extract the sage source tarball, cd into a directory
       with no spaces in it.  If you have a machine with n processors, say,
       type 
             export MAKE="make -j4"
       To start the build type
             make
    4. Wait about 1 to 8 hours, depending on your computer.
       SOME ACTUAL REAL BUILD TIMES (for SAGE-2.7.1):
          * 1.8Ghz Linux Opteron 64-bit 16-core SMP machine: 67 minutes 
          * G5: 102 minutes
          * Core 2 Duo: 67 minutes
          * Core Duo: 75 minutes
          * 1.5 Ghz G4 (rev 1.2): 167 minutes

    5. Type ./sage to try it out. 
    6. OPTIONAL: Start sage and run the command 
          install_scripts("/usr/local/bin/")   # change /usr/local/bin/
       Type "install_scripts?" in Sage for more details about
       what this command does.
    7. OPTIONAL: Type "make test" to test all examples in the 
       documentation (over 12000 lines of input!) -- this takes from 
       15 minutes to an hour.   Don't get too disturbed if there are 
       2-3 failures, but always feel free to e-mail the section of
       test.log that contains errors to wstein@gmail.com and/or
       sage-support@googlegroups.com:
              http://groups.google.com/group/sage-support
       If there are numerous failures, there was a serious problem
       with your build.
    8. OPTIONAL: Documentation: If you want to (try to) build the
       documentation, change into SAGE_ROOT/devel/doc and type "make
       html" or "make pdf".  This requires having latex and latex2html
       installed, and there are some issues with the \url macro.  Note
       that the latex docs come *pre-built* with Sage, and are in
       SAGE_ROOT/doc/.
    9. OPTIONAL: GAP -- It is highly recommended that you install the 
       optional GAP databases by typing
                            ./sage -optional
       then installing (with ./sage -i) the package whose name
       begins with database_gap.   This will download the package 
       from sage.math.washington.edu and install it.    While you're
       at it you might install other databases of interest to you. 
   10. OPTIONAL: It is highly recommended that you have both latex
       and the imagemagick tools (e.g., the "convert" command) installed
       since some plotting functionality uses it. 

SUPPORTED COMPILERS:
    * Sage builds with GCC >= 3.x and GCC >= 4.1.x.  
    * Sage will not build with gcc 2.9.x.
    * WARNING: Don't build with GCC 4.0.0, which is "buggy as a
      Florida swamp in August".
    * I don't know if Sage has ever been built with a non-GCC compiler.   

   SOLARIS:
     It is reportedly possible, but not recommended yet (see below).
     A fully supported port is planned. 
    
RUNNING SAGE:
    1. Try running sage:
          ./sage

    2. Try running an example Sage script:
          ./sage example.sage

RELOCATION (OS X and Windows):
   You *should* be able to move the sage-x.y.z directory anywhere you
   want.  If you copy the sage script or put a symlink to it, you
   should modify the script to reflect this (as instructed in the top
   of the script).  It is best if the path to Sage does not have any
   spaces in it.

   If you find anything that doesn't work correctly after you moved
   the directory, please email sage-devel.  

REDISTRIBUTION:
 Your local Sage install is exactly the same as any "developer" 
 install.   You can make changes to documentation, source,
 etc., and very easily package up the complete results for 
 redistribution just like we do.

   1. You can make your own source tarball (sage-x.y.z.tar) of Sage by
      typing "sage -sdist x.y.z", where the version is whatever you
      want.  The result is placed in SAGE_ROOT/dist.

  2.  You can make a binary distribution with the packages you've
      installed included by typing "sage -bdist x.y.z".  The 
      result is placed in the SAGE_ROOT/dist directory.


CHANGES TO INCLUDED SOFTWARE: 
    All software included with Sage is copyright by the respective
    authors and released under an open source license that is GPL
    compatible.  See the file COPYING.txt for more details.
    (Note -- jsMath is licensed under the Apache license; Apache 
    claim their license is GPL compatible, but Stallman disagrees.)

    After building Sage, see the directories

          SAGE_ROOT/spkg/build/package-name/
  
    for a file SAGE.txt that details all changes made to the given
    package for inclusion with Sage.  The inclusion of such a file
    detailing changes is specifically required by some of the packages
    included with Sage (e.g., for GAP).
    (These directories are deleted when you type "make clean".)

----

