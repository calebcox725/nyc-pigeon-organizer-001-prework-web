require 'pry'

def nyc_pigeon_organizer(data)
  pigeon_list = {}

  data.each do |attribute, values|
    values.each do |value, names|
      names.each do |name|
        pigeon_list[name] = {} if !pigeon_list.has_key?(name)
        pigeon_list[name][attribute] = [] if !pigeon_list[name].has_key?(attribute)
        pigeon_list[name][attribute] << value.to_s
      end
    end
  end

  pigeon_list
end