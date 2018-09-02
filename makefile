#/usr/bin/env bash
# --------------------------

.RECIPEPREFIX +=

# --------------------------

all: clean README.md

README.md:
  echo "1. Title of project -> The Unix Workbench (peer-graded assigment)" > README.md
  echo "2. README.md creation date -> "`date -u`"" >> README.md
  echo "3. Number of lines in shell script -> `grep -c ".*" guessinggame.sh`" >> README.md

clean:
  rm -f README.md

# --------------------------