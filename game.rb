=begin
  ①height ✖️ widthの数の○ ✖️を作成しランダムにハッシュのキーに設定する
  ②①で作成したキーの中に数字をランダムで入れる
=end 


height = gets.to_i
# puts height.include?("\n")
width = gets.to_i

strack_panel_num = width * height 


maru_batsu_string = ["○","✖️"].sample
strack_panel_num_array = []

strack_panel_num.times do 
  number = gets.to_i
 hash = {maru_batsu_string => number}
 strack_panel_num_array.push(hash)
end

puts strack_panel_num_array