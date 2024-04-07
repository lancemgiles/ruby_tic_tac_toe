row1 = [0, 1, 2]
    row2 = [3, 4, 5]
    row3 = [6, 7, 8]
    column1 = [0, 3, 6]
    column2 = [1, 4, 7]
    column3 = [2, 5, 8]
    diag_top_left = [0, 4, 8]
    diag_top_right = [2, 4, 6]

def winner?(p)
    
    # check p move history
    p[:moves].all? {|moves| moves == row1 || row2 || row3 ||
      column1 || column2 || column3 || diag_top_right || diag_top_left}
end
player = {moves: []}
puts player[:moves] == (row1 || row2)
player[:moves].push(0)
player[:moves].push(1)
player[:moves].push(2)
puts player[:moves] == row1
puts player[:moves] == (row1 || row2)