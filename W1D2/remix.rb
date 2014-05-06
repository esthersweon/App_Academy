def remix(drinks)
  alcohols = drinks.map(&:first)
  mixers = drinks.map(&:last)
  
  p alcohols.zip(mixers.shuffle)
end

## version 2

## def remix(drinks)
##     alcohols = drinks.map(&:first)
##     mixers = drinks.map(&:last)
    
##     alcohols.shuffle!
##     mixers.shuffle!
    
##     [].tap do |new_drinks|
##         alcohols.each_index do |i|
##             new_drinks << [alcohols[i], mixers[i]]
##         end
##     end
## end