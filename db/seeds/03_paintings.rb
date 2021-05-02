#Create 21 user paintings (canvas order: 1, 2, 3, 1, 2, 3... )

7.times do
  i = 1
  while i < 4 do
    Painting.create!(canvas_id: i)
    i += 1
  end
end
