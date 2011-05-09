#MONKEY PATCH TO ONLY SELECT EUROPEAN COUNTRIES
class ISO3166::Country
  def self.european_countries
    Data.select do |k,v|
      v["region"] == "Europe" || v["region"].include?("Europe")
    end.map{|k,v| [v['name'],k]}.sort
  end
end

module ActionView
  module Helpers
    module FormOptionsHelper
      def country_options_for_select(selected = nil, priority_countries = nil)
        country_options = ""

        if priority_countries
          priority_countries = [*priority_countries].map {|x| [x,Country::NameIndex[x]] }
          country_options += options_for_select(priority_countries, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        end

        return options_for_select(Country.european_countries, selected)
      end
    end
  end
end