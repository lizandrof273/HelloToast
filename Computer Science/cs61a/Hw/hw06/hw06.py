# Object Oriented Programming

class Fib():
    """A Fibonacci number.

    >>> start = Fib()
    >>> start
    0
    >>> start.next()
    1
    >>> start.next().next()
    1
    >>> start.next().next().next()
    2
    >>> start.next().next().next().next()
    3
    >>> start.next().next().next().next().next()
    5
    >>> start.next().next().next().next().next().next()
    8
    >>> start.next().next().next().next().next().next() # Ensure start isn't changed
    8
    """

    def __init__(self, value=0):
        self.value = value
    def next(self):
        result = Fib()
        result.previous = 0
        if self.value == 0:
            result.value = 1
            result.previous = 0
            return result
        else:
            result = Fib(self.value + self.previous)
            result.previous = self.value
            return result
    def __repr__(self):
        return str(self.value)

class VendingMachine:
    """A vending machine that vends some product for some price.

    >>> v = VendingMachine('candy', 10)
    >>> v.vend()
    'Machine is out of stock.'
    >>> v.deposit(15)
    'Machine is out of stock. Here is your $15.'
    >>> v.restock(2)
    'Current candy stock: 2'
    >>> v.vend()
    'You must deposit $10 more.'
    >>> v.deposit(7)
    'Current balance: $7'
    >>> v.vend()
    'You must deposit $3 more.'
    >>> v.deposit(5)
    'Current balance: $12'
    >>> v.vend()
    'Here is your candy and $2 change.'
    >>> v.deposit(10)
    'Current balance: $10'
    >>> v.vend()
    'Here is your candy.'
    >>> v.deposit(15)
    'Machine is out of stock. Here is your $15.'

    >>> w = VendingMachine('soda', 2)
    >>> w.restock(3)
    'Current soda stock: 3'
    >>> w.restock(3)
    'Current soda stock: 6'
    >>> w.deposit(2)
    'Current balance: $2'
    >>> w.vend()
    'Here is your soda.'
    """
    balance = 0
    stock = 0
    def __init__(self,type,price):
        self.type = type
        self.price = price

    def vend(self):
        diffrence = self.price-self.balance
        if self.stock == 0:
            return 'Machine is out of stock.'
        elif self.price > self.balance:
            return 'You must deposit ${0} more.'.format(diffrence)
        elif self.price == self.balance:
            self.stock -= 1
            return 'Here is your {0}.'.format(self.type)
        elif self.balance > self.price:
            change = self.balance - self.price
            self.stock -= 1
            self.balance = 0
            return 'Here is your {0} and ${1} change.'.format(self.type,change)

    def deposit(self, amount):
        if self.stock == 0:
            return 'Machine is out of stock. Here is your ${0}.'.format(amount)
        else:
            self.balance += amount
            return 'Current balance: ${0}'.format(self.balance)
        #     gap = price-self.balance
        # if self.balance < price:
        #     return 'You must deposit ${0} more.'.format(gap)

    def restock(self, add_stock):
        self.stock += add_stock
        return 'Current {0} stock: {1}'.format(self.type, self.stock)
