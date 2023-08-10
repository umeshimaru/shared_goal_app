=begin
  ①height ✖️ widthの数の○ ✖️を作成しランダムにハッシュのキーに設定する
  ②①で作成したキーの中に数字をランダムで入れる
=end 


class Strack_out

  def initialize(height,width)
    @height = height
    @width = width
    @strack_panel_num = width * height 

    @strack_panel_num_array = []
    @strack_panel_num.times do 
      @number = rand(1..100)
      @maru_batsu_string = ["○","✖️"].sample
     @hash = {@maru_batsu_string => @number}
     @strack_panel_num_array.push(hash)
    end
    @answer = 0
  end

  def answer
    @maru_numbers = []
    @strack_panel_num_array.each do |hash|
      hash_key = hash.keys
      @answer += hash["○"] if hash_key == ["○"]
  end


    
 
end
puts answer 


end 

puts 高さを入力してください
height = gets.to_i

puts 幅を入力してください
width = gets.to_i

strack_out = Strack_out.new(height,width)
# puts maru_numbers
