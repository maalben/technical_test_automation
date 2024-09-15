# frozen_string_literal: true

Given("Yo ingreso al sitio web") do
  @login_page.load
end

When("Yo accedo al sistema con usuario {string} y password {string}") do |username, password|
  @login_page.input_username.set(username)
  @login_page.input_password.set(password)
  @login_page.button_login.click
end

Then("Yo deberia ver el titulo {string}") do |expected_title|
  actual_title = @home_page.title_financial_overview.text.strip
  expect(actual_title).to eq(expected_title)
end

When("Yo accedo al sistema sin ingresar ningun dato en los campos") do
  @login_page.button_login.click
end

Then("Yo deberia ver el mensaje {string}") do |expected_title|
  actual_title = @login_page.label_error.text.strip
  expect(actual_title).to eq(expected_title)
end

When("Yo accedo al sistema colocando el password {string}") do |password|
  @login_page.input_password.set(password)
  @login_page.button_login.click
end

When("Yo accedo al sistema colocando el usuario {string}") do |password|
  @login_page.input_username.set(username)
  @login_page.button_login.click
end

Then("Yo deberia encontrar un mensaje con texto {string}") do |expected_title|
  actual_title = @login_page.label_error_transparent.text.strip
  expect(actual_title).to eq(expected_title)
end
