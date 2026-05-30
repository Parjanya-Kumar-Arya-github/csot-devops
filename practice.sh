set -euo pipefail
# -e: exit on any error
# -u: error on unset variable
# -o pipefail: fail if any command in a pipe fails

# Variables
NAME="World"
COUNT=5

# Function
greet() {
    local who="$1"           # $1 is the first argument
    echo "Hello, $who!"
}

# Loop
for i in $(seq 1 $COUNT); do
    greet "$NAME #$i"
done