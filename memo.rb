require "csv"
require 'fileutils'

puts "1: 新規ファイルを作成。 \n2: 既存のファイルの編集。 \n3: 既存のファイルにメモを追加。 \n4: 既存ファイルの内容を表示。 \n5: ファイルの削除。"
puts "\n指定された数字を半角で入力してくださ。"
input_number = gets.to_i


if input_number == 1
  puts "\nファイルの作成を行います。"
  puts "拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp

  puts "\nメモの内容を記述してください。"
  puts "メモの編集終了後、Ctrl + Dを押して下さい。"
  input_text = STDIN.read

  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << ["#{input_text}"]
    puts "\nメモの内容を保存しました。"
  end
  
  puts "\n作成した#{file_name}.csvファイルの内容を表示しています。"
  puts "--------------------"

  file_display = CSV.read("#{file_name}.csv")
    puts file_display
    puts "--------------------"

elsif input_number == 2
  puts "\n既存のファイルの編集を行います。"
  puts "拡張子を除いた既存のファイル名を入力してください。"
  file_name = gets.chomp

  puts "\n指定された#{file_name}.csvファイルの内容を表示しています。"
  puts "--------------------"

  CSV.foreach("#{file_name}.csv") do |row|
    puts row
    puts "--------------------"
  end

  puts "\nメモの編集を続ける場合はyを入力。編集を中止する場合はnを入力してください。"
  edit_file = gets.chomp

  if edit_file == "y"
    puts "\nメモの編集を行います。"
    puts "メモの編集終了後、Ctrl + Dを押して下さい。"
    input_text = STDIN.read

    CSV.open("#{file_name}.csv", "w") do |csv|
      csv << ["#{input_text}"]
      puts "\nメモの編集内容を保存しました。"
    end

    puts "\n編集後の#{file_name}.csvファイルの内容を表示しています。"
    puts "--------------------"

    CSV.foreach("#{file_name}.csv") do |row|
      puts row
      puts "--------------------"
    end
    else edit_file == "n"
      puts "\nメモの編集を中止しました。"
  end

elsif input_number == 3
  puts "\n既存のファイルにメモを追加します。"
  puts "拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp

    puts "\n指定された#{file_name}.csvファイルの内容を表示しています。"
    puts "--------------------"

  CSV.foreach("#{file_name}.csv") do |row|
    puts row
    puts "--------------------"
  end

  puts "\nメモの追加を行う場合はyを入力。メモの追加を中止する場合はnを入力してください。"
  add_file = gets.chomp

  if add_file == "y"
    puts "\nメモの追加を行います。"
    puts "メモの編集終了後、Ctrl + Dを押して下さい。"
    input_text = STDIN.read

    CSV.open("#{file_name}.csv", "a") do |csv|
      csv << ["#{input_text}"]
      puts "\nメモの追加を行いました。"
    end

    puts "\nメモ追加後の#{file_name}.csvファイルの内容を表示しています。"
    puts "--------------------"

    CSV.foreach("#{file_name}.csv") do |row|
      puts row
      puts "--------------------"
    end
    else add_file == "n"
      puts "\nメモの追加を中止しました。"
  end

elsif input_number == 4
  puts "\n既存のファイルの内容を表示します。"
  puts "拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp

  file = "\n#{file_name}.csvの内容を表示しています。"
  puts file
  puts "--------------------"

  CSV.foreach("#{file_name}.csv") do |row|
    puts row
    puts "--------------------"
  end  
  
elsif input_number == 5
  puts "\nファイルの削除を行います。"
  puts "削除を行うファイル名を拡張子を除いた状態で入力してください。"
  file_name = gets.chomp

  begin
    FileUtils.remove_file(rm_file = "#{file_name}.csv")
    puts "\n#{rm_file}を削除しました。"
  rescue
    puts "\n#{rm_file}を削除出来ませんでした。"
  end

else
  puts "Error: please enter correct value"
end