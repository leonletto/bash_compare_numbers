#!/usr/bin/env bash

. ./compare_numbers.sh

# Test the compareNumbers function
echo "Testing compareNumbers function"
testnumbers1=(aaaaaaaaa aaaaaaaab yyyyy 1 1111111111111111118 22222221 1a 1a1 1a2 1a 12 12a 123 123c 1234 1234a 1234c 12344 12344a 12344b 1111111111111111111.1111111111111111118 1.12a 1.12a 1.12b 1.12a.12a 1.12b 1.12b.12a 1.12b.12a.12a 1.12b.12a.12a 1.12b.12a.12b 1.12b.12a.12b1 1.12b.12a.12aa 1.12b.12a.12ba 1.12b.12a.12b 1.12b.12a 1.12b.12a.12b)
testnumbers2=(aaaaaaaab aaaaaaaaa yyyyy 1 1111111111111111119 22222220 1a 1a2 1a1 1b 12 12b 124 123b 1234 1234b 1234b 12344 12344b 12344a 1111111111111111111.1111111111111111119 1.12a 1.12b 1.12a 1.12a.12a 1.12b 1.12b.12a 1.12b.12a.12a 1.12b.12a.12b 1.12b.12a.12a 1.12b.12a.12b2 1.12b.12a.12ab 1.12b.12a.12ab 1.12b.12a 1.12b.12a.12b 1.12b.12b)
testresults=("lt" "gt" "eq" "eq" "lt" "gt" "eq" "lt" "gt" "lt" "eq" "lt" "lt" "gt" "eq" "lt" "gt" "eq" "lt" "gt" "lt" "eq" "lt" "gt" "eq" "eq" "eq" "eq" "lt" "gt" "lt" "lt" "gt" "gt" "lt" "lt")

for i in "${!testnumbers1[@]}"; do
#    echo "comparing ${testnumbers1[$i]} and ${testnumbers2[$i]}"
    result=$(compare_numbers "${testnumbers1[$i]}" "${testnumbers2[$i]}")
    if ! [[ "$result" == "${testresults[$i]}" ]]; then
        echo "comparing ${testnumbers1[$i]} ${testnumbers2[$i]}: ${testresults[$i]} is incorrect"
    fi
done


if [[ ($(compare_numbers 10a 10b) == "lt") ]] ;then
    echo "10a is less than 10b"
fi

if gt 2 1;then
    echo "2 is greater than 1"
fi

if lt a b;then
    echo "a is less than b"
fi

if ge aaaa aaa1;then
    echo "aaaa is greater than or equal to aaa1"
fi

if ge aaaa aaaa;then
    echo "aaaa is greater than or equal to aaaa"
fi

if ge a.a.a.a a.a.a.9;then
    echo "a.a.a.a is greater than or equal to a.a.a.9"
fi
