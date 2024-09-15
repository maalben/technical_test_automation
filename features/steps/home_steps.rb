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