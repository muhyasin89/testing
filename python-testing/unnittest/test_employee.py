import unittest
from unittest.mock import patch
from employee import Employee

class TestEmployee(unittest.TestCase):

    @classmethod
    def setUp(self):
        self.emp_1 = Employee('muhammad', 'yasin', 'indosterling', 40000)
        self.emp_2 = Employee('miranty', 'lestari', 'home', 10000)

    @classmethod
    def tearDown(self):
        pass

    def test_check_email(self):
        self.assertEqual(self.emp_1.email, 'muhammad.yasin@indosterling.com')
        self.assertEqual(self.emp_2.email, 'miranty.lestari@home.com')

        self.emp_1.first = 'muh'
        self.emp_2.first = 'mir'

        #cannot change already declared only first time
        self.assertNotEqual(self.emp_1.email, 'muh.yasin@indosterling.com')
        self.assertNotEqual(self.emp_2.email, 'mir.lestari@home.com')

    def test_check_fullname(self):
        self.assertEqual(self.emp_1.fullname, 'muhammad yasin')
        self.assertEqual(self.emp_2.fullname, 'miranty lestari')

        self.emp_1.first = 'muh'
        self.emp_2.first = 'mir'

        self.assertEqual(self.emp_1.fullname, 'muh yasin')
        self.assertEqual(self.emp_2.fullname, 'mir lestari')

    def test_raise(self):
        self.emp_1.apply_raise()
        self.emp_2.apply_raise()

        self.assertEqual(self.emp_1.pay, 41600)
        self.assertEqual(self.emp_2.pay, 10400)


    def test_monthly_schedule(self):
        with patch('employee.requests.get') as mocked_get:
            mocked_get.return_value.ok = True
            mocked_get.return_value.text = 'Success'

            schedule = self.emp_1.monthly_schedule('May')
            mocked_get.assert_called_with('http://indosterling.com/yasin/May')
            self.assertEqual(schedule, 'Success')

            mocked_get.return_value.ok = False

            schedule = self.emp_1.monthly_schedule('June')
            mocked_get.assert_called_with('http://indosterling.com/yasin/June')
            self.assertEqual(schedule, 'Success')



if __name__ =='__main__':
    unittest.main()