require "open-uri"
require 'pry'

class RemoteMenuItems
  class << self

    def parse(uri)
      data_file_contents = open(uri)
      data_file_string = cleanup_and_stringify(data_file_contents)
      data_items = data_file_string.split("\n,")
      target_amount = cleanup_and_floatize(data_items.shift)

      menu = data_items.reduce({}) do |menu, menu_item_csv|
        item_name, item_value = menu_item_csv.split(",")
        item_name.strip!
        item_value = cleanup_and_floatize(item_value)
        menu.merge!(item_name => item_value)
      end
      [target_amount, menu]
    end

    private

    def cleanup_and_stringify(data_file_contents)
      data_file_contents.rewind
      data_array = data_file_contents.to_a
      data_string = data_array .join(",")
    end

    def cleanup_and_floatize(dollar_amount_as_string)
      # remove dollar sign entity
      dollar_amount_as_string[1..-1].to_f
    end

  end
end