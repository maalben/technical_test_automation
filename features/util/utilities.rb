# frozen_string_literal: true

class Utilities

  def rgb_to_hex(rgb_value)
    rgb = rgb_value.scan(/\d+/).map(&:to_i)
    format("#%02x%02x%02x", *rgb)
  end

  def formatear_monto(numero)
    # Usa '%.2f' para asegurarte de que haya dos decimales y 'gsub' para agregar las comas
    formatted = '%.2f' % numero
    formatted.gsub(/(\d)(?=(\d{3})+\.)/, '\1,')
  end

end