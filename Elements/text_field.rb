require_relative 'base_element'

class TextField < BaseElement

  def write_some_text(text)
    find_element.send_keys text
  end
end