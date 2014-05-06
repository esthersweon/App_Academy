def super_print(str, options = {})
    defaults = {
        :time => 1,
        :upcase => false,
        :reverse => false
    }
    
    options = defaults.merge(options)
    
    str = str.upcase if options[:upcase]
    str = str.reverse if options[:reverse]
    
    options[:time].times { puts str }
end