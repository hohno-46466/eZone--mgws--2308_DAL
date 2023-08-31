#!/bin/sh

# pseudoAlice3.sh

# Last update: Wed Mar  1 07:19:00 AST 2023

(which -a jot > /dev/null 2>&1 || (echo "We need jot command to run this $0"; exit 1)) || exit 1

key="PseudoAlice3"

cnt=0
Pr=512; Pg=512; Pb=512
Xr=0; Xg=0; Xb=0

while [ 1 ]; do
  cnt=$(expr $cnt + 1000 + $(jot -r 1 -5 5));

  Sr=$(jot -r 1 0 7);  if [ $Sr -le 2 ]; then Sr=0; else Sr=1; fi
  Pr=$(expr $Pr + $(jot -r 1 -31 31)); [ $Pr -lt 0 ] && Pr=0; [ $Pr -gt 1023 ] && Pr=1023;
  Xr=$(expr $Xr + $(jot -r 1 -50 50));

  Sg=$(jot -r 1 0 11); if [ $Sg -le 3 ]; then Sg=0; else Sg=1; fi
  Pg=$(expr $Pg + $(jot -r 1 -31 31)); [ $Pg -lt 0 ] && Pg=0; [ $Pg -gt 1023 ] && Pg=1023;
  Xg=$(expr $Xg + $(jot -r 1 -50 50));

  Sb=$(jot -r 1 0 13); if [ $Sb -le 4 ]; then Sb=0; else Sb=1; fi
  Pb=$(expr $Pb + $(jot -r 1 -31 31)); [ $Pb -lt 0 ] && Pb=0; [ $Pb -gt 1023 ] && Pb=1023;
  Xb=$(expr $Xb + $(jot -r 1 -50 50));

  echo "$key\t$cnt\t$Sr\t$Pr\t$Xr\t$Sg\t$Pg\t$Xg\t$Sb\t$Pb\t$Xb"
  sleep 1
done
