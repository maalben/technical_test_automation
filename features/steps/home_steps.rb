# frozen_string_literal: true

Then("Yo deberia ser redirigido a la pagina de la tabla de gastos") do
  @home_page.load
  expect(current_url).to eq(HOME_HOST)
end

Then("Yo deberia ver exactamente {int} transacciones en la tabla") do |quantity|
  expect(@home_page.transaction_rows.count).to eq(quantity)
end

Then("Yo deberia ver el saldo total de {int}") do |balance|
  expect(@home_page.total_balance.text).to include(balance.to_s)
end

Then("Yo deberia ver el credito disponible de {string}") do |credit|
  expect(@home_page.credit_available.text).to include(credit.to_s)
end

When("Yo deberia validar que todos los valores {string} deben ser de color {string}") do |value_type, color|
  @home_page.transaction_rows.each do |row|
    values = row.all(".#{value_type}-value")
    values.each do |value|
      expect(@utilities.rgb_to_hex(value.native.style('color'))).to eq(color) # Valida el color
    end
  end
end

Then("Yo deberia ver que el monto mas alto es {string}") do |montoAlto|

  montos = @home_page.transaction_rows.map do |fila|
    monto_texto = fila.find('td.text-right span').text
    monto_texto.gsub(/[^\d\.\-]/, '').to_f
  end

  monto_mayor = montos.max
  monto_formateado = @utilities.formatear_monto(monto_mayor)
  expect(montoAlto).to include(monto_formateado.to_s)
end

Then("Yo deberia ver que el monto mas bajo es {string}") do |expected_lowest|

  montos = @home_page.transaction_rows.map do |fila|
    # Obtener el signo del monto ('+' o '-')
    signo = fila.find("td:nth-child(5) span").text.strip[0]
    # Obtener el valor numérico sin el signo
    valor = fila.find("td:nth-child(5) span").text.strip.gsub(/[^\d,.]/, '').to_f
    # Convertir a negativo si el signo es '-'
    valor = valor * -1 if signo == '-'
    valor
  end

  # Encontrar el monto más bajo
  monto_mas_bajo = montos.min

  # Convertir el monto esperado a número
  monto_esperado = expected_lowest.gsub(/[^\d,.]/, '').to_f
  monto_esperado = monto_esperado * -1 if expected_lowest.include?("-")

  # Validar que el monto más bajo sea igual al esperado
  expect(monto_mas_bajo).to eq(monto_esperado)
end