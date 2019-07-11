import unittest
import calc
import pytest
import sys

class TestCalc(unittest.TestCase):

    def test_add(self):
        self.assertEqual(calc.add(10, 5), 15)
        self.assertEqual(calc.add(-1, 1), 0)
        self.assertEqual(calc.add(-1, -1), -2)

    def test_substract(self):
        self.assertEqual(calc.substract(10, 5), 5)
        self.assertEqual(calc.substract(-1, 1), -2)
        self.assertEqual(calc.substract(-1, -1), 0)

    def test_multiply(self):
        self.assertEqual(calc.multiply(10, 5), 50)
        self.assertEqual(calc.multiply(-1, 1), -1)
        self.assertEqual(calc.multiply(-1, -1),1)

    @pytest.mark.skipif(sys.version_info > (3,5), reason="I dont want to run this test for moment")
    def test_devide(self):
        self.assertEqual(calc.devide(10, 5), 2)
        self.assertEqual(calc.devide(1, -1), -1)
        self.assertEqual(calc.devide(-1, -1), 1)



if __name__ == '__main__':
    unittest.main()