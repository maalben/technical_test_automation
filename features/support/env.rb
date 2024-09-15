# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require_relative '../../config/capybara'

# Configuración adicional para Cucumber, Capybara y SitePrism
Capybara.default_max_wait_time = 5
Capybara.default_driver = :selenium