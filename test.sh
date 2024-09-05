#!/bin/bash

mkdir -p build
rm -f build/*

# Function to trim whitespace
trim_whitespace() {
    echo "$1" | awk '{$1=$1;print}'
}

# Extract answers from Solutions.md
echo "Extracting expected answers from Solutions.md..."
declare -A solutions
while read -r line; do
    if [[ "$line" =~ ^[0-9]+ ]]; then
        problem_id=$(echo $line | cut -d'.' -f1)
        answer=$(echo $line | cut -d' ' -f2)
        solutions[$problem_id]=$(trim_whitespace "$answer")
    fi
done < Solutions.md

# Iterate through each solution file in the solutions directory
for solution_file in solutions/*.ref; do
    # Extract problem ID from the file name
    problem_id=$(basename "$solution_file" .ref)

    echo -n "[PROBLEM $problem_id] "

    # Check if there's an expected answer for this problem ID
    if [[ -n "${solutions[$problem_id]}" ]]; then
        rlc --rich -o build/$problem_id "$solution_file" > /dev/null
        ans=$(./build/$problem_id)
        trimmed_ans=$(trim_whitespace "$ans")
        expected_answer=${solutions[$problem_id]}
        if [ "$trimmed_ans" != "$expected_answer" ]; then
            echo "[Problem $problem_id] incorrect answer: expected '$expected_answer', got '$trimmed_ans'"
            exit 1
        else
            echo "PASS"
        fi
    else
        echo "No expected answer for Problem $problem_id"
        exit 1
    fi
done

echo "All solutions are correct!"
