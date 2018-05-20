TOOLCHAIN_DIR=avr8-gnu-toolchain-linux_x86_64
TOOLCHAIN_PROMPT="(AVR)"

$(return >/dev/null 2>&1) || { echo "This script should be sourced!"; exit 1; }

function die() {
    echo -e "\e[31mFATAL: $1\e[0m"
    return 1
}


if [ ! -d "${TOOLCHAIN_DIR}" ]; then
    wget -O /tmp/toolchain.tgz https://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en605750 || die "cannot download the toolchain"
    tar -xf /tmp/toolchain.tgz || die "cannot unpack the toolchain"
fi

if [[ "${PS1}" =~ "${TOOLCHAIN_PROMPT}" ]]; then
    die "AVR toolchain already available"
else
    PATH="$PWD/${TOOLCHAIN_DIR}/bin:$PATH"
    PS1="(AVR) $PS1"
fi
