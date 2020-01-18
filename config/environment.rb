require_relative 'application'

Rails.application.initialize!

WillPaginate::ViewHelpers.pagination_options[:previous_label] = '前'
WillPaginate::ViewHelpers.pagination_options[:next_label] = '次'
