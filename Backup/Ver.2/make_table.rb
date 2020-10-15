require 'rubyXL'
require 'win32ole'

$flag_war_start = false
$import_track = []


def maketable_introduction(flag)
  msg = "集計表を作成するお＾ｑ＾(Cancelで作成中止)\nコピペ用テンプレート↓\n"
  msg += "```自チームのメンバー [ふつきん,P2,P3,P4,P5,P6]\n自チームの各得点 [80,80,80,80,80,80]\n\n"
  msg += "敵チーム名 [ABC]\n対戦回数 [1]\n"
  msg += "敵チームのメンバー [P7,P8,P9,P10,P11,P12]\n敵チームの各得点 [80,80,80,80,80,80]"

  if flag == 1
    msg += "```※コースと交流戦日付は記入不要だお＾ｑ＾"
  else
    msg += "\n\nコース名 [T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12]\n"
    msg += "自チームの選択コース [1,2,3,4,5,6]\n\n日付 [2020/01/01]```"
  end

  return msg
end


def maketable_check_input(str, flag)
  safe, msg = true, ""
  n1 = str.count('[')
  n2 = str.count(']')

  if !str.start_with?("自チームのメンバー")
    safe = false
    msg = "Cancelと入力で作成中止できるお＾ｑ＾"
  elsif n1 >= 6 and n2 >= 6
    input = str.gsub("[", "]").split("]")
    1.step(11, 2) do |i|
      unless (i == 5 or i == 7) or input[i].count(',') == 5
        safe = false
        msg = "名前または得点が6つずつ入力されていないかも？＾ｑ＾"
      end
    end
    if flag == 0 and safe == true
      safe = false unless input[13].count(',') == 11
      msg = "コースが12個入力されていないかも？＾ｑ＾"
    end
    if flag == 1 and safe == true
      safe = false unless n1 == 6 and n2 == 6
      msg = "余計なデータがある or []で閉じられていない箇所があるかも？＾ｑ＾"
    elsif flag == 0 and safe == true
      safe = false unless n1 == 9 and n2 == 9
      msg = "余計なデータがある or []で閉じられていない箇所があるかも？＾ｑ＾"
    end
  else
    safe = false
    msg = "[]で閉じられていない箇所があるかも？＾ｑ＾"
  end

  return safe, msg
end


def make_table(input, flag)
  book = RubyXL::Parser.parse('D:\Ren\Desktop\色々\Data\Discord bot\Clan_War_table.xlsx')
  book.calc_pr.full_calc_on_load = true
  book.calc_pr.calc_completed = true
  book.calc_pr.calc_on_save = true
  book.calc_pr.force_full_calc = true
  sheet = book['6 vs 6']

  ally_name = input[1].split(',')
  6.times{|i| sheet[2 + i][3].change_contents(ally_name[i])}

  ally_point = input[3].split(',')
  6.times{|i| sheet[2 + i][5].change_contents(ally_point[i].to_i)}

  sheet[8][0].change_contents(input[5])

  enemy_name = input[9].split(',')
  6.times{|i| sheet[8 + i][3].change_contents(enemy_name[i])}

  enemy_point = input[11].split(',')
  6.times{|i| sheet[8 + i][5].change_contents(enemy_point[i].to_i)}

  if flag == 1
    12.times do |i|
      if $import_track[i].include?('__')
        sheet[2 + i][11].change_contents($import_track[i].gsub(/[^0-9a-z]/i, ""))
        sheet[2 + i][11].change_font_color('00B0F0')
      else
        sheet[2 + i][11].change_contents($import_track[i])
      end
    end
    date = $clan_war_time
  else
    track = input[13].split(',')
    select_num = input[15].split(',')
    j = 0
    12.times do |i|
      sheet[2 + i][11].change_contents(track[i])
      if i + 1 == select_num[j].to_i
        sheet[2 + i][11].change_font_color('00B0F0')
        j += 1
      end
    end
    date = input[17]
  end

  if input[7].to_i == 1
    send_str = "vs #{input[5]} - #{date}"
  else
    send_str = "vs #{input[5]} (#{input[7]}回目) - #{date}"
  end

  book.write('created_sheet.xlsx')


  excel = WIN32OLE.new('Excel.Application')
  book = excel.Workbooks.Open('D:\Ren\Desktop\色々\Data\Discord bot\created_sheet.xlsx')
  book.ExportAsFixedFormat({
        "FileName" => 'D:\Ren\Desktop\色々\Data\Discord bot\created_sheet.pdf',
        "Type" => 0,
        "OpenAfterPublish" => false
      })
  book.Close
  excel.Quit

  system('python convertPDFtoPNG.py')
  File.delete('created_sheet.xlsx')
  File.delete('created_sheet.pdf')

  return send_str
end
