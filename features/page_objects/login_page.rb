# frozen_string_literal: true

class LoginPage < SitePrism::Page
  set_url MAIN_HOST

  element :input_username, '#username'
  element :input_password, '#password'
  element :button_login, '#log-in'
  element :label_error, '.alert-warning'
  element :label_error_transparent, '.alert-primary'
end