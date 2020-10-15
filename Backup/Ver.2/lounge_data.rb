require 'open-uri'
require 'rubyXL'
require 'win32ole'
require 'gnuplot'


def road_excel_file()
  url = "https://docs.google.com/spreadsheets/d/1IPGK_kCgdqSLwcFjzgeLsRW7qV3MLCgcSBABdZHtK4o/export?format=xlsx&gid=341469667"
  open(url) do |file|
    open('lounge_data.xlsx', "w+b") do |out|
      out.write(file.read)
    end
  end

  book = RubyXL::Parser.parse('D:\Ren\Desktop\色々\Data\Discord bot\lounge_data.xlsx')

  return book.first
end



def get_lounge_name(name_id)
  case name_id
  when Futsukin
    name = "Futsukin"
  when Mochi
    name = "Mochizy"
  when Lchiki
    name = "Eru."
  when K4I
    name = "K4I"
  when Ren
    name = "7r"
  when Naoto
    name = "Naoto"
  when Dark
    name = "Dark"
  when Toki
    name = "toki"
  when Yuyuyu
    name = "yuyuyu"
  when Danny
    name = "Danny"
  when Ejikara
    name = "Eji"
  when Kerus
    name = "Kerus"
  when Liara
    name = "riarannu"
  when Toi
    name = "101"
  when Kenn
    name = "Kenn"
  when Nonono
    name = "Ax"
  when Syatyou
    name = "tinpo"
  when Konkon
    name = "konkon"
  end
end


def split_name(input)
  name = []

  if input.count(",") > 0
    list = input.split(",")
    list.size.times{|i| name.push(list[i].strip)}
  else
    name.push(input)
  end

  return name
end


def get_rank(mmr)
  if mmr < 2000
    rank_url = 'https://cdn.discordapp.com/emojis/731579735544430703.png'   #アイアン
  elsif 2000 <= mmr and mmr < 3500
    rank_url = 'https://cdn.discordapp.com/emojis/731579759712010320.png'   #ブロンズ
  elsif 3500 <= mmr and mmr < 5000
    rank_url = 'https://cdn.discordapp.com/emojis/731579781828575243.png'   #シルバー
  elsif 5000 <= mmr and mmr < 6500
    rank_url = 'https://cdn.discordapp.com/emojis/731579798111125594.png'   #ゴールド
  elsif 6500 <= mmr and mmr < 8000
    rank_url = 'https://cdn.discordapp.com/emojis/542204444302114826.png'   #プラチナ
  elsif 8000 <= mmr and mmr < 9500
    rank_url = 'https://cdn.discordapp.com/emojis/731579851802411068.png'   #サファイア
  elsif 9500 <= mmr and mmr < 11000
    rank_url = 'https://cdn.discordapp.com/emojis/731579813386780722.png'   #ダイヤモンド
  elsif 11000 <= mmr and mmr < 12500
    rank_url = 'https://cdn.discordapp.com/emojis/731597294914502737.png'   #マスター
  elsif 12500 <= mmr
    rank_url = 'https://cdn.discordapp.com/emojis/731579876846338161.png'   #グランドマスター
  end

  return rank_url
end


def get_lounge_MMR(input)
  sheet = road_excel_file()
  name = split_name(input)
  data = []

  name.size.times do |i|
    1.upto(10000) do |j|
      a = name[i].gsub(/[^\w\S.-]/, "").downcase.each_char.select{|c| c.bytes.count < 4 }.join('')
      b = sheet[j][2].value.gsub(/[^\w\S.-]/, "").downcase.each_char.select{|c| c.bytes.count < 4 }.join('')
      if a == b
        data.push(sheet[j][2].value)
        data.push(sheet[j][3].value)
        break
      elsif sheet[j][2].value == "\s"
        data.push(name[i])
        data.push("Not Found")
        break
      end
    end
  end

  return data
end


def get_lounge_stats(input)
  sheet = road_excel_file()
  name = split_name(input)
  data = []

  name.size.times do |i|
    1.upto(10000) do |j|
      a = name[i].gsub(/[^\w\S.-]/, "").downcase.each_char.select{|c| c.bytes.count < 4 }.join('')
      b = sheet[j][2].value.gsub(/[^\w\S.-]/, "").downcase.each_char.select{|c| c.bytes.count < 4 }.join('')
      if a == b
        1.upto(10){|k| data.push(sheet[j][k].value)}
        data.push(get_rank(sheet[j][3].value.to_i))
        break
      elsif sheet[j][2].value == "\s"
        data.push(name[i])
        10.times{data.push("Not Found")}
        break
      end
    end
  end

  return data
end
