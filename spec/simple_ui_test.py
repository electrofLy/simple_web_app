import unittest
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities


class UITest(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Remote(command_executor='http://selenium:4444/wd/hub',
                                       desired_capabilities=DesiredCapabilities.FIREFOX)

    def test_index(self):
        self.driver.get("http://web:8080")
        self.assertIn("Hello World!", self.driver.page_source)

    def tearDown(self):
        self.driver.close()


if __name__ == "__main__":
    unittest.main()

