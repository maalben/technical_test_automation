# frozen_string_literal: true

class Utilities

  def rgb_to_hex(rgb_value)
    rgb = rgb_value.scan(/\d+/).map(&:to_i)
    format("#%02x%02x%02x", *rgb)
  end

end