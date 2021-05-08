isdirectory() {
  [ -d "$1" ]
}
if isdirectory $1; then echo "is directory"; else echo "nopes"; fi

