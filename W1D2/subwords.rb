def subwords(str, dictionary_filename)
    dictionary_contents = File.readlines(dictionary_filename).map(&:chomp)
    
    substrings(str).select { |word| dictionary_contents.include?(word)}
end

def faster_subwords(str, dictionary_filename)
    dictionary_contents_array = File.readlines(dictionary_filename).map(&:chomp)
    dictionary_contents_set = Set.new(dictionary_contents_array)
    
    substrings(str).select { |word| dictionary_contents_set.include?(word)}
end