require_relative './browser_factory'

class Browser

  @driver = BrowserFactory.get_driver

  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def self.open_url(url)
    return @driver.get(url)
  end

  def self.max_page
    @driver.manage.window.maximize
  end

  def self.get_driver
    @driver
  end

end