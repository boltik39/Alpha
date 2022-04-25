require_relative '../Driver/waits'

class BaseForm

  def initialize(unique_elem, page_name)
    @unique_element = unique_elem
    @page_name = page_name
  end

  def is_page_open
    @unique_element.is_displayed
  end

  def wait_for_displayed
    @unique_element.wait_for_displayed
  end

end
