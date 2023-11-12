require "csv" 

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.chomp.to_i
while memo_type != 1 && memo_type != 2
  puts "1か2を入力してください"
  memo_type = gets.chomp.to_i
end

if memo_type == 1
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp.to_s
  
  puts "メモしたい内容を入力してください。完了後、Ctrl+Dを押してください。"
  input_memo = $stdin.read
  memo = input_memo.chomp
  
  CSV.open("#{file_name}.csv","w") do |csv|
    csv << ["#{memo}"]
  end
elsif memo_type == 2
  puts "既存のメモを編集します。拡張子を除いたファイル名を入力してください。" 
  file_name = gets.chomp.to_s
  
  puts "編集内容を入力してください。完了後、Ctrl+Dを押してください。"
  input_memo = $stdin.read
  memo = input_memo.chomp
  
  CSV.open("#{file_name}.csv","a") do |csv|
    csv << ["#{memo}"]
  end
end