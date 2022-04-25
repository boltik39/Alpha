require 'selenium-webdriver'
require_relative 'browser'

class Waits

  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def self.wait(locator)
    wait = Selenium::WebDriver::Wait.new :timeout => ConfigManager.get_from_config("wait_time_out")
    wait.until {Browser.get_driver.find_element(xpath: locator)}
  end

end