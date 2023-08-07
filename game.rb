=begin
  ①height ✖️ widthの数の○ ✖️を作成しランダムにハッシュのキーに設定する
  ②①で作成したキーの中に数字をランダムで入れる
=end 


height = gets.to_i

width = gets.to_i

strack_panel_num = width * height 



strack_panel_num_array = []

strack_panel_num.times do 
  number = gets.to_i
  maru_batsu_string = ["○","✖️"].sample
 hash = {maru_batsu_string => number}
 strack_panel_num_array.push(hash)
end

maru_numbers = []
strack_panel_num_array.each do |hash|
  hash_key = hash.keys.to_s


  if hash_key == "○"
  puts "丸"
  end
    
  #  value =  hash[hash_key.to_s]
  #  maru_numbers.push(value)
  # end
end

# puts maru_numbers
