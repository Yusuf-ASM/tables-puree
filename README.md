
# Table Purée

For A friend ;)

## Usage

```bash
> ./table-puree -h
-u, --username Your account username

(defaults to "potato")

-p, --password Your account password

(defaults to "potato")

-t, --tree-path=<path> Dependency tree location containing these files:

- englIntensive.json

- intensive.json

- mathIntensive.json

- normal.json

-o, --output=<path> Output path location

-h, --[no-]help Help :)

-l, --[no-]lumon If you know, you know

```

## Examples

- Simple use

```bash

> ./table-puree  -u  "YourUsername"  -p  "YourPassword"  -t  "path/to/tree/folder"
> 
> ./table-puree  -u  "potato"  -p  "tomato"  -t  "/home/Desktop/tree" # example

```

- Export output as json file

```bash

>./table-puree -u "YourUsername" -p "YourPassword" -t "path/to/tree/folde" -o "path/to/output/file.json"

> ./table-puree  -u  "potato"  -p  "tomato"  -t  "/home/Desktop/tree" -o "/home/Desktop/res.json"  # example

```
