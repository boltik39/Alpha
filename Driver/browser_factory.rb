require_relative '../Utils/config_manager'
require 'bundler/setup'
require 'selenium-webdriver'
require 'webdrivers'

class BrowserFactory

  def self.get_driver
    if ConfigManager.get_from_config('browser') == 'chrome'
      driver = Selenium::WebDriver.for(:chrome)
      return driver
      #You can add new browser here
    end

  end

end
