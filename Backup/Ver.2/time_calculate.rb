$call_time = []

def talk_time_calculate(at,bt)                                                  #通話時間計算
  h = (bt - at).to_i / 3600                                                     #時間計算
  m = ((bt - at).to_i % 3600) / 60                                              #分計算
  s = (bt - at).to_i % 60                                                       #秒計算
  if 0.5 <= ((bt - at).to_f % 60) - s then                                      #小数点以下四捨五入
    s += 1
  end

  rslt = Array.new(2)
  rslt[0] = "**```fix\n今回の通話時間：#{h}時間#{m}分#{s}秒"
  rslt[1] = "\n(通話開始時刻：#{at.strftime('%Y/%m/%d %H:%M:%S')})\n(通話終了時刻：#{bt.strftime('%Y/%m/%d %H:%M:%S')})```**"

  return rslt
end
