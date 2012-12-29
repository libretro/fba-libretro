#!/bin/sh

FORMAT=libretro
SRC_DIR=svn-new/trunk/

#******************
# PROGRAM FUNCTIONS
#******************

clean()
{
   cd $SRC_DIR
	make -f makefile.libretro clean
}

make_libretro()
{
   cd $SRC_DIR
	make -f makefile.libretro -j4
}

make_debug()
{
   cd $SRC_DIR
	make -f makefile.libretro -j4 DEBUG=1
}

#******************
# DISPLAY FUNCTIONS
#******************

title()
{
	echo ""
	echo "***********************"
	echo "COMPILER SCRIPT FOR $FORMAT"
	echo "***********************"
}

display_clean()
{
	echo "clean          Clean the object files"
}

display_make()
{
	echo "make           Compile libretro library"
}

display_make_debug()
{
	echo "make_debug     Compile DEBUG libretro library"
}

display_all_options()
{
	display_clean
	display_make
	display_make_debug
}

display_usage()
{
	echo "Usage: compile_libretro.sh [options]"
	echo "Options:"
	display_all_options
}

#***********************
# MAIN CONTROL FLOW LOOP
#***********************

title
if [ ! -n "$1" ]; then
	display_usage
else
	for i in "$@"
	do
		if [ "$i" = "help" ]; then
			display_usage
		fi
		if [ "$i" = "clean" ]; then
			echo ""
			echo "*************************************"
			echo "DOING:"
			display_clean
			echo "*************************************"
			clean
		fi
		if [ "$i" = "make" ]; then
			echo ""
			echo "*************************************"
			echo "DOING:"
			display_make
			echo "*************************************"
			make_libretro
		fi
		if [ "$i" = "make_debug" ]; then
			echo ""
			echo "*************************************"
			echo "DOING:"
			display_make
			echo "*************************************"
			make_debug
		fi
	done
fi
