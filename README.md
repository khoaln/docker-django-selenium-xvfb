# docker-django-selenium-xvfb
Docker file for building automation test server using Selenium 2 (WebDriver) for Django

When you want to run Selenium test with Chrome, using below option to prevent from crash: 
<pre>
sudo docker run -d --name=django-selenium-xvfb -v /dev/shm:/dev/shm
</pre>

tests.py contain a sample base testcase. With base testcase, write functions to test an element is visible or not:
<pre>
def test_list_firefox(self):
		self.firefox.get('%s%s' % (self.live_server_url, '/todo/task'))
		self.assertElementIsPresentByCSSSelector(self.firefox, 'table#grisd')
		
def test_list_chrome(self):
		self.chrome.get('%s%s' % (self.live_server_url, '/todo/task'))
		self.assertElementIsPresentByCSSSelector(self.chrome, 'table#grid')
</pre>
