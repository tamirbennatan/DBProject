import sys

def get_integer_option(n_options):
    """
    Loop infinitely until the user has inputed an integer between 0 and <n_inputs>. 
    return this integer.
    """
    while True:
        line = sys.stdin.readline()
        """
        Check if input is valid. 
        Only valid inputs are integers between 0 and <num options>
        """
        try:
            # convert the option to an integer
            option = int(line)
            # is the input in the correct range? 
            if option < 0 or option >= n_options:
                raise ValueError
            # return valid option
            return(option)
        except ValueError:
            """User has inputed an invalid option. 
            Yell at him, and ask for a different option. 
            """
            print(
                """You have inputed an invalid option.
                Please insert an integer between 0 and NUM OPTIONS HERE. 
                """)
            continue

def get_integer_input():
    """
    Loop infinitely until the user has inpted an integer
    """
    while True:
        line = sys.stdin.readline()
        """
        Check if input is valid. 
        Only valid inputs are integers between 0 and <num options>
        """
        try:
            # convert the option to an integer
            inpt = int(line)
            return(inpt)
        except ValueError:
            """User has inputed an invalid option. 
            Yell at him, and ask for a different option. 
            """
            print(
                """You have inputed an invalid input.
                Please insert an integer.
                """)
            continue


def get_confirmation():
    """
    Loop infinitely until user inputs either "yes" (return 1), or 
    "no" (return zero)
    """
    while True:
        print("Please input 'yes' or 'no':")
        line = sys.stdin.readline().strip()
        """
        check if either inputed 'yes' or 'no'
        """
        if line == "yes":
            return (1)
        elif line == "no":
            return (0)
        else:
            pass





