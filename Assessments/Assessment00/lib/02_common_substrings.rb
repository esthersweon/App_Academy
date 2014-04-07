def common_substrings(str1, str2) ## "zooglensnuck", "lenscrafters"
  	common = '' ## the common string
  	start_index = 0
    
  	while start_index < (str1.length - 1) ## start_index=0 (so<11)
    	common_length = 1 ## length of common string
        
    	while (start_index + common_length) <= str1.length
      		if common_length < common.length
        		common_length += 1
        		next
      		end
            
      		end_index = start_index + common_length
      		answer = str1[start_index..end_index]
      		common = answer if str2.include?(answer)
      		common_length += 1
            
    	end
        
    	start_index += 1
  	end
    
  	common
    
end