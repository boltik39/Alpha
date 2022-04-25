require_relative '../Driver/browser'
require_relative '../Driver/waits'

class BaseElement

  def initialize(xpath_locator, name)
    @locator = xpath_locator
    @element_name = name
  end

  def is_displayed
    if find_elements.length > 0
      true
    else
      false
    end
  end

  def wait_for_displayed
    Waits.wait(@locator).displayed?
  end

  def click
    find_element.click
  end

  def wait_and_click
    Waits.wait(@locator).click
  end

  def get_text
    find_element.text
  end

  protected
  def find_element
    Browser.get_driver.find_element(xpath: @locator)
  end

  def find_elements
    Browser.get_driver.find_elements(xpath: @locator)
  end

end