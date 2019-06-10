#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. "
    echo ""
    echo "Example: "
    echo "convert.sh ./payload.bin"
    echo ""
    exit 0
fi

echo "Parsing file $1"

cat $1 | hexdump | cut -d" " -f1-1 | cut -b 4- > .lines1

cat $1 | hexdump -e '16/1 " %02X"' |  fold -w48 | sed 's/^/  /' > .lines2

paste -d' ' .lines1 .lines2 > output.dump

rm .lines1
rm .lines2

echo ""

cat ./output.dump

echo ""
echo ""
echo "File output.dump generated (Wireshark format)"
echo ""
