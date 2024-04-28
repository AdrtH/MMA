# MMA
Min/Max/Average in UNIX type command line tool, written in the most modern language on earth.

# How to build
You'll need a COBOL compiler, pretty sure you didn't expect that.

There is no depedency or library needed.
```
cobc -x ./mma.cbl
```

# Usage
```
./mma
```
Will read from standard input and, after a blank line, will output Min/Max/Average.

The intended use would be to pipe/redirect from file.

Usage Examples:
```
cat data.csv data2.csv | awk -F',' {print $2} | ./mma
```
```
./mma <data.txt
```
The latter works only if your file is just a list of numbers separated by newlines.
