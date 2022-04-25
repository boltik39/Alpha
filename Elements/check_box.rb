require_relative 'base_element'

class CheckBox < BaseElement

  def is_checked
    find_element.selected?
  end
end
