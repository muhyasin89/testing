import requests

class Employee:
    raise_amount = 1.04  # variable
    num_of_emps = 0

    def __init__(self, first, last, company, pay):
        self.first = first
        self.last = last
        self.company = company
        self.pay = pay
        self.email = first + '.' + last + '@' + company + '.com'

        Employee.num_of_emps += 1

        # for refactoring

    @property
    def fullname(self):
        return '{} {}'.format(self.first, self.last)

    def apply_raise(self):
        # self.pay = int(self.pay * Employee.raise_amount)
        self.pay = int(self.pay * self.raise_amount)

    def email(self):
        return '{}'.format(self.email)

    def monthly_schedule(self, month):
        response = requests.get(f'http://{self.company}.com/{self.last}/{month}')
        if response.ok:
            return response.text
        else:
            return 'Bad Response!'