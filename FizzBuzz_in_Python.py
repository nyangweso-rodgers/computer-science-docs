# i is initialized as 1
i = 1
# As far as i is less than or equal to 100, we do the things in the loop
while i <= 100:
    # output initialied to an empty string
    output = ""
    # if i is divisible by 3, output the variable Fizz
    if i % 3 == 0:
        output = 'Fizz'
    # if i is divisible by 5, out variable is Buzz
    elif i % 5 == 0:
        output = 'Buzz'
    elif i % 15 == 0:
        output = 'FizzBuzz'
    # if output is "", a blank string, output = i
    elif output == "":
        output = i
    # increment i
    print(output)
    i += 1
        