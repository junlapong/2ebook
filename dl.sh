#!/usr/bin/env bash

# ./dl.sh BOOK_ID PAGES

cpdf () { 
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="${1}.pdf" *.pdf
}

ID=$1
START=1
END=$2

if test -d ${ID}
then
    cd ${ID}
    for N in $(eval echo "{$START..$END}")
    do
        # echo $N
        PPPP=$(printf '%04d' ${N})
        URL=https://www.2ebook.com/new/assets/ebook_pdf/nlt/${ID}/${ID}_${PPPP}.pdf
        # echo ${URL}
        wget ${URL}
    done
    # pdfcpu merge ${ID}.pdf *.pdf
    # cpdf ${ID}
    cd -
else
    mkdir ${ID}
fi
