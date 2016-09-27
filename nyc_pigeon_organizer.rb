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

=begin ////// NOTES //////
1. What made this lab challenging? If you didn't finish it, where did you get stuck?
  For me, the challenge was in scraping through the multiple layers of input data and
  reorganizing the data.

2. What were the steps that you needed to take to transform the original pigeon hash into the second hash? Write them out in order.
  First, create a new hash that contains the following hashes.
  Next, collect each pigeon name and insert it as the key to a new hash.
  Within name hash, create attribute keys
  Set values of attribute hash
  Return the new pigeon list hash

A. Problem Solving
  rephrase the problem
  think about how we solve this problem without code
  how would this work in real life

B. Translating this into code
  REJECT information - just to get to core
    data.keys, data.values
    data[:color]
  COERCE - think about the data structure

  C. General techniques - whren stuck
    making the problem less abstract
      puts, binding.pry
        write a comment of the data, to make less
      get a feedback loop
    really understanding the data structure
=end

def nyc_pigeon_organizer(data)
  nyc_pigeon_organizer_v2(data)
end

def nyc_pigeon_organizer_v0(data)
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

def nyc_pigeon_organizer_v1(pigeon_data)
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

def nyc_pigeon_organizer_v2(pigeon_data)
  names = pigeon_data.values.first.values.flatten.uniq

  initial_structure = names.each_with_object({}) do |name,hash|
    hash[name] = {color: [], gender: [], lives: []}
  end

  names.each_with_object(initial_structure) do |pigeon, initial_structure|
    attributes = pigeon_data.keys

    attributes.each do |attribute|
      pigeon_data[attribute].each do |color, names|
        initial_structure[pigeon][attribute] << color.to_s if names.include?(pigeon)
      end
    end
  end
end
