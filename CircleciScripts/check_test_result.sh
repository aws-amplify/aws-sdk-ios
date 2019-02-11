target="$1"

if find $target -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
    echo "$target is not empty"
    exit 1
else
    echo "Did not find failure test result"
fi
