def my_transpose(rows)
    dimension = rows.first.count
    columns = Array.new(dimension) { Array.new(dimension) }
    
    dimension.times do |i|
        dimension.times do |j|
            columns[j][i] = rows[i][j]
        end
    end

    columns
end


puts my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])