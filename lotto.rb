
    require 'open-uri'
    require 'json'
    require 'awesome_print'
    
        page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")
        lotto_read = page.read
        lotto_json = JSON.parse(lotto_read)
        
      

my_numbers = Array(1..45).sample(6).sort
drw_numbers = ["#{lotto_json['drwtNo1']}", "#{lotto_json['drwtNo2']}","#{lotto_json['drwtNo3']}","#{lotto_json['drwtNo4']}","#{lotto_json['drwtNo5']}","#{lotto_json['drwtNo6']}"]
bonus_number = "#{lotto_json['bnusNo']}"
hitnumber = []
print("당첨 번호는 ",drw_numbers,"이고 보너스 번호는 
",bonus_number,"번입니다 ")
puts("")
print("추첨한 로또 번호는 ",my_numbers," 입니다.")

my_numbers.each do |item|
    if(drw_numbers.count(item)==1)
        hitnumber.push(item)
    end
end
puts("")
print("겹치는 번호는 ",hitnumber," 입니다 ")
puts("")
if(hitnumber.size==6)
    puts("결과는 1등 입니다")
    elsif (hitnumber.size==5 && my_numbers.count(bonus_number)==1)
    puts("결과는 2등 입니다")
    elsif (hitnumber.size==5 && my_numbers.count(bonus_number)==0)
    puts("결과는 3등 입니다")
    elsif (hitnumber.size==4)
    puts("결과는 4등 입니다")
    elsif (hitnumber.size==3)
    puts("결과는 5등 입니다")
else
    puts("결과는 6등 입니다")
end

