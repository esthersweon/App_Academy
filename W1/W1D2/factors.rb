def factors(int)
    (1..int).select {|factor| int % factor == 0}
end