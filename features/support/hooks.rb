# features/support/hooks.rb

require 'report_builder'

Before do
  @login_page = LoginPage.new
  @home_page = HomePage.new
  @utilities = Utilities.new
end

at_exit do

  timestamp = Time.now.strftime('%Y%m%d_%H%M%S')

  ReportBuilder.configure do |config|
    config.input_path = 'features/reports/report.json'
    config.report_path = "features/reports/report_#{timestamp}"
    config.report_types = [:html]
    config.report_title = 'Reporte de Pruebas Automatizadas'
    config.additional_info = { 'Project Name' => 'Test API', 'Report Generated' => Time.now }
    config.color = 'indigo'  # Color del reporte (puedes usar 'blue', 'green', 'red', etc.)
  end

  # Genera el reporte
  ReportBuilder.build_report
end