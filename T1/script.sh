echo "hello world, $1"
echo "files in input directory:"
find "$1" -maxdepth 1 -type f -print
echo "files in input directory and children directories:"
find "$1" -type f -print
echo "directories in input directory and children directories:"
find "$1" -type d -print
find "$1" -type f -exec bash -c 'file="$1"; dest="$2/$(basename "$file")"; counter=0; while [[ -e "$dest" ]]; do counter=$((counter+1)); dest="$2/${file##*/}_$counter"; done; cp -- "$file" "$dest";' _ {} "$2" \;
