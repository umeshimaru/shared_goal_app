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
      @number = rand(1..5)
      @maru_batsu_string = ["○","✖️"].sample
     @hash = {@maru_batsu_string => @number}
     @strack_panel_num_array.push(@hash)
    end
    @answer = 0
  end

  def answer
    @strack_panel_num_array.each do |hash|
      hash_key = hash.keys
      @answer += hash["○"] if hash_key == ["○"]
    end 
  
    puts @answer
 
  end



end 

puts "高さを入力してください"
height = gets.to_i

puts "幅を入力してください"
width = gets.to_i

strack_out = Strack_out.new(height,width)
puts strack_out.answer

