```bash
 fcrackzip -v -u -D -p /usr/share/dict/rockyou.txt iaminvincible.zip
```

toKnow if john has cracked it
```sh
 john --show 1111.hash
```



Selecting files and moving them to a folder
```sh
sudo nvim /usr/local/bin/clump
```

```sh
#!/bin/bash

# Check if at least one file is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: clump <file1> [file2] [file3]..."
    exit 1
fi

# 1. Grab the first filename from the arguments
FIRST_PATH="$1"

# 2. Extract just the filename (removes directory path)
BASENAME=$(basename "$FIRST_PATH")

# 3. Extract the directory name (removes the file extension)
# e.g., "challenge.zip" becomes "challenge"
DIR_NAME="${BASENAME%.*}"

# Safety fallback: If the file had no extension (like a binary), 
# append "_dir" to avoid naming conflicts (folder named same as file)
if [ "$DIR_NAME" == "$BASENAME" ]; then
    DIR_NAME="${BASENAME}_dir"
fi

# 4. Create the directory (in the current location)
# If inputs are full paths, we want the folder created where the files are
TARGET_DIR=$(dirname "$FIRST_PATH")/"$DIR_NAME"

if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
    echo "Created directory: $TARGET_DIR"
fi

# 5. Move all selected files into the new directory
mv -t "$TARGET_DIR" "$@"

echo "Moved $# files to $TARGET_DIR"
```


