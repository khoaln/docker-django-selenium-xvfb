from django.test import LiveServerTestCase
from selenium import webdriver
from pyvirtualdisplay import Display
from selenium.common.exceptions import NoSuchElementException

class BaseSeleniumTestCase(LiveServerTestCase):
	@classmethod
	def setUpClass(cls):
		super(BaseSeleniumTestCase, cls).setUpClass()
		cls.display = Display(visible=0, size=(800, 600))
		cls.display.start()
		cls.firefox = webdriver.Firefox()
		cls.chrome = webdriver.Chrome()

	@classmethod
	def tearDownClass(cls):
		cls.firefox.quit()
		cls.chrome.quit()
		cls.display.stop()
		super(BaseSeleniumTestCase, cls).tearDownClass()

	def assertElementIsPresentByCSSSelector(self, driver, css, msg=None):
	    try:
	        driver.find_element_by_css_selector(css)
	        self.assertTrue(True, msg)
	    except NoSuchElementException:
	        self.assertTrue(False, msg)
