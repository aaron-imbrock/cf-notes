#!/bin/bash

function file_size() {
	# $1:     filename
	# return: filename, filesize in KB

	file_size=$(du -hs "$1" | awk '{print $1}')
	printf "%s,%s" "$1" "$file_size"
}

function blank_logfile() {
	# $1:     /full/path/to/file
	# return: -

	:> "$1"
}

function create_backup() {
	# $1:     /full/path/to/file
	# $2:     save to /directory
	# return: /full/path/to/backup/file 

	now=$(date_stamp)
	filename=$(echo "$1" | awk -F'/' '{print $NF}')
	gzip -c "$1" > "$2/$filename-$now.gz"

	printf "%s/%s-%s.gz" "$2" "filename" "$now"
}

function date_stamp() {
	# return: YYYYMMDDHHMMSS

	timestamp=$(date +"%Y%m%d%H%M%S")

	printf "%s" "$timestamp"
}
	
function print_report() {
	# $1:	  filename before compression
	# $2:	  filename after compression
	# $3:	  file size before compression
	# $4:	  file size after compression
	# return: -

	cat << EOF

	Backup Report

	Logfile Before Compression:
	File: $1
	Size: $3

	Logfile After Compression:
	File: $2
	Size: $4

EOF
}

function main() {
	today=$(date)	
	backup_files=()
	
	# Get file size before compression
	logfile="/var/log/wtmp"
	before_size_info=$(file_size "$logfile")
	before_filename="${before_size_info%,*}"
	before_size="${before_size_info#*,}"
	
	# Create a backup
	backup_filename=$(create_backup "$logfile" "/tmp")
	
	# Clear the contents of the logfile
	blank_logfile "$logfile"
	
	# Get file size after compression
	after_size_info=$(file_size "$backup_filename")
	after_filename="${after_size_info%,*}"
	after_size="${after_size_info#*,}"
	
	# Print the report
	print_report "$before_filename" "$after_filename" "$before_size" "$after_size"
}

main
