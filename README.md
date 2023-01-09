# bashCompareNumbers
Comparing integers in bash is included in the base functionality but floating point numbers and version numbers in bash is difficult.
This library makes it easier fast for use in bash functions without having to develop your own strategy.
The base comparison is using integers so any combination of integers, ascii characters, and floating point numbers can be compared.

By necessity it is opinionated but I hope that it is flexible enough to be useful.

I have included 5 helper functions which can be used to compare floating point numbers and version numbers.
The functions are: `gt` `lt` `ge` `le` and `eq`.

## Assumptions
- all numbers are 0 or positive
- all numbers are in the format of `x.y.z` where `x`, `y`, and `z` are integers or ascii characters from a-z and A-Z
- each block of numbers/ascii characters has a maximum of the equivalent of 9223372036854775807 (2^63 - 1).  
- If you have ascii characters interspersed, each ascii character will take up 2 integer numbers so the maximum size of an ascii string to compare is 9 characters long.

## Usage
- `compare_numbers` - compares two numbers and returns eq if they are equal, gt if the first number is greater than the second number, and lt if the first number is less than the second number
- `gt` - compares two numbers and returns true if the first number is greater than the second number
- `lt` - compares two numbers and returns true if the first number is less than the second number
- `ge` - compares two numbers and returns true if the first number is greater than or equal to the second number
- `le` - compares two numbers and returns true if the first number is less than or equal to the second number
- `eq` - compares two numbers and returns true if the first number is equal to the second number


## Examples
- `compare_numbers 1.2.3 1.2.3` returns `eq`
- `compare_numbers 1.2.3 1.2.4` returns `lt`
- `gt 1 2` returns `false` or 0
- `gt 2 1` returns `true` or 1

## Usage in a script
```bash
#!/bin/bash
. ./compare_numbers.sh

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

```

All if these examples and a large sample of comparisons are included in the test script test.sh.

## Suggestions

Any suggestions are welcome and I hope you find this library useful.  Feel free to open a pull request if you have any improvements.

## License

This library is licensed under the MIT license.  See the LICENSE file for more information.