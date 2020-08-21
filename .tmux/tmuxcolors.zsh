#!/bin/zsh
for i in {0..255}
do
    print -Pn "%K{$i} %K{$i} %K{$i} %K{$i} %K{$i} %K{$i} %K{$i} %K{$i}  %k%F{$i} color${(l:3::0:)i}%f    " ${${(M)$((i%6)):#3}:+$'\n'}
done

