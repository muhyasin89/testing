def add(x,y):
    """ Add a Function """
    return x + y

def substract(x, y):
    """ Substract Function """
    return x -y

def multiply(x,y):
    """ Multiply Function """
    return x * y

def devide(x, y):
    """ Devide Function """
    if y!=0:
        return x/y
    else:
        raise ValueError('Can not devided by zero!')