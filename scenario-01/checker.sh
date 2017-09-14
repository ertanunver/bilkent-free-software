#!/bin/bash

### if html_files directory is exist, remove it recursively
if [ -d "html_files" ] 
then
	rm -R "html_files"
fi

### create html_files directory in order to store html files
mkdir "html_files"

### clear screen
clear

### download and save html files
while true
do
	while read line 
	do
		IFS=' ' read -a course <<< "$line"
		file="html_files/${course[0]}-${course[1]}-${course[2]}.html"
		url="https://stars.bilkent.edu.tr/homepage/ajax/plainOfferings.php?COURSE_CODE=${course[0]}&SEMESTER=20171"
		curl -s -o $file $url	
		quota=$(node parser.js $file)
		echo "$line $quota"
		if [ $quota -gt 0 ]; then
			echo -en "\007"
		fi
	done < "courses.txt"
done
