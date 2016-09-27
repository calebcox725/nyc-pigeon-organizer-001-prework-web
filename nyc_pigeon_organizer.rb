require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def nyc_pigeon_organizer(data)
  pigeon_list = {}

  data.each do |attribute, values|
    values.each do |value, names|
      names.each do |name|
        pigeon_list[name] ||= {}
        pigeon_list[name][attribute] ||= []
        pigeon_list[name][attribute] << value.to_s
      end
    end
  end

  pigeon_list
end

# 1. What made this lab challenging? If you didn't finish it, where did you get stuck?
#   For me, the challenge was in scraping through the multiple layers of input data and
#   reorganizing the data.
#
# 2. What were the steps that you needed to take to transform the original pigeon hash into the second hash? Write them out in order.
#   First, create a new hash that contains the following hashes.
#   Next, collect each pigeon name and insert it as the key to a new hash.
#   Within name hash, create attribute keys
#   Set values of attribute hash
#   Return the new pigeon list hash

def nyc_pigeon_organizer_new(pigeon_data)
  pigeon_data.each_with_object({}) do |(attribute,values), new_pigeon_data|
    values.each do |value, names|
      names.each do |name|
        new_pigeon_data[name] ||= {}
        new_pigeon_data[name][attribute] ||= []
        new_pigeon_data[name][attribute] << value.to_s
      end
    end
  end
end
