#!/bin/bash          
i=0
while IFS="," read col1 col2 col3 col4
do
    # echo "$col1 $col2 $col3 $col4"
    a="$(m4 -DNAME_OF_USER="$col1" -DDONATION_OF_USER="$col4"  -DEMAIL_OF_USER="$col2"  -DPAN_OF_USER="$col3"  my_first_m4_program)"
    #echo -e "$a"
    #"$(m4 -DNAME_OF_USER="$col1" -DDONATION_OF_USER="$col4"  -DEMAIL_OF_USER="$col2"  -DPAN_OF_USER="$col3"  80g.tex.m4 > temp${i}.tex)"
    "$(m4 -DNAME_OF_USER="$col1" -DDONATION_OF_USER="$col4"  -DEMAIL_OF_USER="$col2"  -DPAN_OF_USER="$col3"  80g.tex.m4 > temp.tex)"	
    #echo $i	
    pdflatex temp.tex
#     i=$((i+1))
#    rm -rf temp${i}.aux temp${i}.log temp${i}.tex
    rm -rf temp.aux temp.log temp.tex	 	
#    echo -e "FROM:ppriyank@iitk.ac.in\r\nSUBJECT: Acknowldgement\r\n\r\n $a" |  msmtp -debug --from=ppriyank@cse.iitk.ac.in -t $col2
    echo "$a" | EMAIL="foo@bar" mutt -a "temp.pdf" -s "Acknowldgement" --  $col2
done < exp.csv

# echo test.ml | sudo  msmtp -debug --from=ppriyank@cse.iitk.ac.in -t ppriyank@cse.iitk.ac.i
# echo -e "Subject: Test Mail\r\n\r\nThis is a test mail" |msmtp --debug --from=abhishek.jain.22.11@gmail.com -t `awk -F',' '{ print $2 }' exp.csv`




