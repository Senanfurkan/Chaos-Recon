#!/bin/bash

input="companyName.txt"

while IFS= read -r line

do
  curl -s https://chaos-data.projectdiscovery.io/"$line".zip -o "$line"/"$line".zip --create-dirs

find "$line"/ -iname "*.txt" | egrep '.*'

if [[ $? -eq 0 ]]; then
        echo "There are some txt found. Renaming..."
    for file in "$line"/*.txt

do
  mv "$file" "${file/.txt/.txt_old}"

done

else
                echo "There isn't any txt found."
fi

unzip "$line"/"$line".zip -d "$line"/

echo "Unzipped"

find "$line"/ -name '*.txt' -exec grep -Fxvf {}_old {} \;  >> "$line"/differences.diff

find "$line"/ -name '*.txt' -exec sh -c 'sort -u $1 $1_old > $1_old' sh {} "$line"  \;

echo "Merged new files with old ones"

echo "deleting new files after merge"

rm "$line"/*.txt

rm "$line"/*.zip

done < "$input"
