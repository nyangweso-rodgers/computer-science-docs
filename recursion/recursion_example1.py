# Recursion
#%%
## Example - Countdown Function
def countdown(x):
    if x == 0:
        print('countdown completed')
    else:
        
        print(x)
        countdown(x -1)
print(countdown(3))

# %%
## Example2 - Power Function
def power(a, b):
    # taking care of special cases first
    if b == 0:
        return 1
    else:
        return a * power(a, b-1)
power(2,10)

# %%
## Example 3 - Factorial Function
def factorial(num):
    # taking care of special cases first
    if (num == 0):
        return 1
    else:
        return num * factorial(num-1)
factorial(4)