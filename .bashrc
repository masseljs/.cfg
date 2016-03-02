# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias gdb='/spot/dev/3rdParty/cpp/gnu/gcc/gcc-4.9.1/bin/gdb'
alias gyp='/spot/dev/3rdParty/cpp/python/python-2.7.3/gcc-4.7.3/bin/python /spot/dev/3rdParty/python/gyp/gyp-0.1/gyp_main.py'
alias ninja='/spot/dev/3rdParty/cpp/misc/ninja/ninja-v1.4.0/gcc-4.7.3/bin/ninja'
alias qtcreator='/spot/dev/3rdParty/cpp/qt/qt-4.8.5/gcc-4.7.3/bin/qtcreator -graphicssystem native &'
alias grepcpp='grep -r --include=*.h --include=*.cpp'

export GCC=/spot/dev/3rdParty/cpp/gnu/gcc/gcc-4.9.1/bin/g++

export LBM_USE_ORIG_DEFAULT_PORTS=1
export GYP_GENERATORS=ninja
alias config='/usr/bin/git --git-dir=/home/jeff.masselink/linux/.cfg/ --work-tree=/home/jeff.masselink/linux'
