# for (let i=0; i < polys.length; i++) {
#     let color = polys[i].getAttribute("class").split("-")[1]
#     colors.push({painting_id: 1, color: parseInt(color)})
# }


#Painting.all[0] - [6] are canvas 1
#Painting.all[7] -[ 13] canvas 2
#Painting.all[14] - [20] are canvas 3


Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed| 
    puts "seeding - #{seed}"
    load seed 
end





# for (let i=0; i < polys.length; i++) {
#     let color = polys[i].getAttribute("class").split("-")[1]
#     col.push({color: parseInt(color)})
# }
# let i = 142
# lastTry = col.map(obj => {
#   return {...obj, polygon_id: i += 1}
# })