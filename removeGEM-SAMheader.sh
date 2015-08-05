#/bin/sh 
#date: 231012
#date of modified: 241012
# - check if the lines are GEM-header, started with @

##########################################################################
# remove the first two lines (headers) of the sam file generated by GEM  #
##########################################################################

for i in $(ls *.sam)
do          
  #headers on the first and second line
  h1FirstCharacter=`sed -n '1{p;q}' $i | cut -c1`
  h2FirstCharacter=`sed -n '2{p;q}' $i | cut -c1`
  if [[ $h1FirstCharacter && $h2FirstCharacter == "@" ]]
  then
  #remove the first two lines in place
    echo "The header of file:$i is being removed" >&2
    sed -i '1,2d' $i && echo "OK" >&2;
  fi
done

