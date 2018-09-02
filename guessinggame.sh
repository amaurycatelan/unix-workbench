#!/usr/bin/env bash
# --------------------------

messages() {
  echo $@ | sed "s/^.*${@: -1}:.\([^,]*\),.*/\1/"
}

validate() {
  if [ "$1" -eq "$1" ] 2> /dev/null; then
    return 1
  fi
}

# --------------------------

guess() {
  solution=$(ls -l | grep "^-" | wc -l)

  while true;
  do
    messages $@ "question"
    read number

    if validate "$number"; then
      messages $@ "number"
    elif [ $number -lt $solution ]; then
      messages $@ "higher"
    elif [ $number -gt $solution ]; then
      messages $@ "lower"
    else
      messages $@ "success" && break;
    fi
  done
}

# --------------------------

guess { \
  "question": "How many files are in the current directory?", \
  "success": "Congratulations! That's right!", \
  "error": { \
    "number": "Error. Not a number.", \
    "lower": "Wrong. Choose a lower number.", \
    "higher": "Wrong. Choose a higher number.", \
  } \
}

# --------------------------