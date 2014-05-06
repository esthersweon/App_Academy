def digital_root(num) ## i.e. num = 25
	while num > 10
		num = digital_root_step(num)
	end
	return num
end

def digital_root_step(num)
	step = 0
	while num > 0
		step = step + num % 10 ## 1st: step=0+25%10=5; 2nd: step=5+2%10=7
		num = num/10 ## 1st: num=25/10=2; 2nd: num=2/10=0
	end
	return step ## step=7 (correct!)
end
