QTDIR=/home/hekai/qt/qt4.8
if ! echo $PATH | /bin/grep -q $QTDIR/bin ;
then
    PATH=$QTDIR/bin:$PATH
fi

MANPATH=$QTDIR/man:$MANPATH
LD_LIBRARY_PATH=$QTDIR/lib:$ld_library_path

export QTDIR PATH MANPATH LD_LIBRARY_PATH

