def race_points_calculate(pts)                                                  #1レースの得点を計算
  rslt = flag = 0

  for i in 0..5 do
    if pts[i].to_i == 1 then                                                    #1位の場合
      rslt += 15
    elsif pts[i].to_i == 2 then                                                 #2位の場合
      rslt += 12
    elsif 12 >= pts[i].to_i && pts[i].to_i >= 3                                 #3~12位の場合
      rslt += 13 - pts[i].to_i
    else
      flag = 1
    end
  end

  if flag == 1 then                                                             #1~12位の以外の番号が入力された場合
    rslt = -1
  end

  return rslt
end


def score_forecast()                                                            #交流戦の予想結果を抽出
  i, scr = 1, []
  scr[0] = rand(252..732)

  while i <= 3 do
    flag, scr[i] = 0, rand(252..732)
    1.upto(i) do |j|
      if scr[i - j] - 50 < scr[i] && scr[i] < scr[i - j] + 50 then
        flag = 1
      end
    end
    if flag == 0 then
      i += 1
    end
  end

  return scr
end
