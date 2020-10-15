def calcMMR_introduction(type)
  str = "レース結果から増減MMRを計算するお＾ｑ＾(Cancelで作成中止)\n```"
  case type
  when 1
    str += "1. P1\n2. P2\n3. P3\n4. P4\n5. P5\n6. P6\n7. P7\n8. P8\n9. P9\n10. P10\n11. P11\n12. P12\n"
    str += "-----------------------------\n"
    str += "1位 [1]\n2位 [2] [上とタイ? → No]\n3位 [3] [上とタイ? → No]\n"
    str += "4位 [4] [上とタイ? → No]\n5位 [5] [上とタイ? → No]\n6位 [6] [上とタイ? → No]\n"
    str += "7位 [7] [上とタイ? → No]\n8位 [8] [上とタイ? → No]\n9位 [9] [上とタイ? → No]\n"
    str += "10位 [10] [上とタイ? → No]\n11位 [11] [上とタイ? → No]\n12位 [12] [上とタイ? → No]```"
  when 2
    str += "Team 1: P1 P2\nTeam 2: P3 P4\nTeam 3: P5 P6\nTeam 4: P7 P8\nTeam 5: P9 P10\nTeam 6: P11 P12\n"
    str += "-----------------------------\n"
    str += "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]\n3位 [Team 3] [上とタイ? → No]\n"
    str += "4位 [Team 4] [上とタイ? → No]\n5位 [Team 5] [上とタイ? → No]\n6位 [Team 6] [上とタイ? → No]```"
  when 3
    str += "Team 1: P1 P2 P3\nTeam 2: P4 P5 P6\nTeam 3: P7 P8 P9\nTeam 4: P10 P11 P12\n"
    str += "-----------------------------\n"
    str += "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]\n"
    str += "3位 [Team 3] [上とタイ? → No]\n4位 [Team 4] [上とタイ? → No]```"
  when 4
    str += "Team 1: P1 P2 P3 P4\nTeam 2: P5 P6 P7 P8\nTeam 3: P9 P10 P11 P12\n"
    str += "-----------------------------\n"
    str += "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]\n3位 [Team 3] [上とタイ? → No]```"
  when 6
    str += "Team 1: P1 P2 P3 P4 P5 P6\nTeam 2: P7 P8 P9 P10 P11 P12\n"
    str += "-----------------------------\n"
    str += "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]```"
  end

  return str
end


def calcMMR_check_input(str, type)
  safe, team_num, msg = true, [], ""

  if str.include?("[")
    loop = [1]
    3.step(48 / type - 5, 4){|i| loop.append(i)}
    for i in loop
      team_num.append(str.gsub("[", "]").split("]")[i].gsub(/[^0-9]/, ""))
    end
  else
    safe = false
  end

  if str.count("[") == 24 / type - 1 and str.count("]") == 24 / type - 1
    5.step(48 / type - 3, 4) do |i|
      unless ["yes", "no"].any? {|j| str.gsub("[", "]").split("]")[i].downcase.include? j}
        safe, msg = false, "タイの欄にYesまたはNoが記述されていないかも？＾ｑ＾"
      end
    end
    if str.include?("--")
      if type != 1
        unless str.scan(/Team [1-#{12 / type}]:/).length == 12 / type
          safe, msg = false, "チーム数が間違っているかも？＾ｑ＾(Team 1～#{12 / type}の番号を付ける)"
        end
        1.upto(12 / type) do |i|
          unless str.gsub(/Team [1-#{12 / type}]:/, "--").split("--")[i].strip.count("\s") == type - 1
            safe, msg = false, "プレイヤー名の数が間違っているかも？＾ｑ＾(空白1文字で区切る)"
          end
        end
        team_num.size.times do |i|
          unless /[1-#{12 / type}]/.match?(team_num[i])
            safe, msg = false, "結果の番号が間違っているかも？＾ｑ＾"
          end
        end
      else
        unless str.scan(/[1-9]\.|1[0-2]\./).length == 12
          safe, msg = false, "プレイヤー数が間違っているかも？＾ｑ＾(1～12.の番号を付ける)"
        end
      end
      team_num.size.times do |i|
        unless /[1-9]|1[0-2]/.match?(team_num[i])
          safe, msg = false, "結果の番号が間違っているかも？＾ｑ＾"
        end
      end
      (team_num.size - 1).times do |i|
        (i + 1).upto(team_num.size - 1) do |j|
          if team_num[i] == team_num[j]
            safe, msg = false, "結果の番号が重複しているかも？＾ｑ＾"
          end
        end
      end
    else
      safe, msg = false, "---------でチームリストと結果欄を区切ってね＾ｑ＾"
    end
  else
    safe, msg = false, "[]で閉じられていない箇所があるかも？＾ｑ＾"
  end

  return safe, msg
end


def get_playerlist_and_tie(str, type)
  name, name_list, rank, all_player, tie = [], [], [], "", []

  loop = [1]
  3.step(48 / type - 5, 4){|i| loop.append(i)}

  if type == 1
    for i in loop
      rank.append(str.gsub("[", "]").split("]")[i].gsub(/[^0-9]/, "").to_i)
    end
    12.times{|i| name.append(str.gsub(/[1-9]\.|1[0-2]\./, "--").split("--")[rank[i]].strip)}
  else
    for i in loop
      rank.append(str.gsub("[", "]").split("]")[i].gsub(/[^0-9]/, "").to_i)
    end
    (12 / type).times{|i| name_list.append(str.gsub(/Team [1-#{12 / type}]:/, "--").split("--")[rank[i]].strip)}
    (12 / type).times{|i| type.times{|j| name.push(name_list[i].split("\s")[j])} }
  end

  12.times{|i| all_player += name[i] + ","}

  5.step(48 / type - 3, 4) do |i|
    if str.gsub("[", "]").split("]")[i].downcase.include?("yes")
      tie.push(1)
    else
      tie.push(0)
    end
  end

  return all_player[0..-2], tie
end


def calculate_MMR(winner, loser, type)
  c = [nil, 60, 120, 180, 240, nil, 300]
  p = [nil, 9500, 5500, 5100, 4800, nil, 4650]
  b = [nil, 2746.116, 1589.856, 1474.230, 1387.511, nil, 1344.151]

  return c[type] / (1 + 11 ** (-(loser - winner - b[type]) / p[type]))
end


def calculate_MMR_tie(p1, p2, type)
  c = [nil, 60, 120, 180, 240, nil, 300]
  p = [nil, 9500, 5500, 5100, 4800, nil, 4650]
  b = [nil, 2746.116, 1589.856, 1474.230, 1387.511, nil, 1344.151]

  adv = c[type] / (1 + 11 ** (-((p1 - p2).abs - b[type]) / p[type])) - (c[type] / 3)

  if p1 < p2
    return adv
  else
    return -adv
  end
end


def get_new_MMR(data, tie, type)
  name, mmr, team_mmr, new_mmr, no_mmr = [], [], [], [], []

  0.step(22, 2){|i| name.push(data[i])}
  1.step(23, 2){|i| mmr.push(data[i])}
  (12 / type).times{new_mmr.push(0)}

  12.times do |i|
    if mmr[i] == "Not Found"
      mmr[i] = 0
      no_mmr.push(i)
    else
      mmr[i] = mmr[i].to_i
    end
  end
  12.times{|i| mmr[i] = rand(mmr.max - 2000 .. mmr.max) if mmr[i] == 0}
  0.step(11, type){|i| team_mmr.push(mmr[i .. i + type - 1].sum.fdiv(type))}

  (12 / type).times do |i|
    tie_flag = 1
    (12 / type - 1 - i).times do |j|
      if tie[i + j] == 0 or tie_flag == 0
        new_mmr[i] += calculate_MMR(team_mmr[i], team_mmr[i + 1 + j], type)
        tie_flag = 0
      elsif tie[i + j] == 1 and tie_flag == 1
        new_mmr[i] += calculate_MMR_tie(team_mmr[i], team_mmr[i + 1 + j], type)
      end
    end
  end

  team_mmr = team_mmr.reverse
  new_mmr = new_mmr.reverse
  tie = tie.reverse

  (12 / type).times do |i|
    tie_flag = 1
    (12 / type - 1 - i).times do |j|
      if tie[i + j] == 0 or tie_flag == 0
        new_mmr[i] -= calculate_MMR(team_mmr[i + 1 + j], team_mmr[i], type)
        tie_flag = 0
      elsif tie[i + j] == 1 and tie_flag == 1
        new_mmr[i] -= calculate_MMR_tie(team_mmr[i + 1 + j], team_mmr[i], type)
      end
    end
  end

  team_mmr = team_mmr.reverse
  new_mmr = new_mmr.reverse

  msg = "```"
  0.step(11, type) do |i|
    adv = new_mmr[i / type].round
    s = "+" if 0 <= adv
    type.times do |j|
      msg += "#{name[i + j]} : MMR #{mmr[i + j]} → #{mmr[i + j] + adv} (#{s}#{adv})\n"
    end
    s = ""
    msg += "\n"
  end
  no_mmr.size.times{|i| msg += "※ #{name[no_mmr[i]]} のMMRは取得できなかったので仮値で計算\n"}
  msg += "```"

  return msg
end
