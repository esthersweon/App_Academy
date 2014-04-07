def correct_hash(wrong_hash)
  corrected_hash = {}

  wrong_hash.each do |key, value|
    key = value[0].to_sym
    corrected_hash[key] = value
  end

  corrected_hash

end

