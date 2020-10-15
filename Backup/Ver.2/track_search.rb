def track_conversion(pls)                                                       #コースの大文字小文字などを修正
  track_name, flag = pls.downcase, 0

  id = id_search(track_name)                                                    #コース名に対応するidを抽出
  case track_name
  when "nvkroad"
    id = 501
  when "subarashikosu"
    id = 502
  when "gomipark"
    id = 503
  when "kamiko"
    id = 504
  end

  case id
  when 1..16 then                                                               #ニトロコースの場合
    if id != 11 then                                                            #Edじゃない場合
      pls = track_name.upcase                                                   #大文字に変換
    else                                                                        #Edの場合
      pls = "Ed"
    end
  when 17..48 then                                                              #レトロorDLCコースの場合
    if id != 23 and id != 32 and id != 46 then                                  #rRRy,rRRd,dRiRじゃない場合
      pls = track_name.capitalize.swapcase                                      #先頭の文字以外を大文字に変換
    elsif id == 23 then
      pls = "rRRy"
    elsif id == 32 then
      pls = "rRRd"
    elsif id == 46 then
      pls = "dRiR"
    end
  when 101..108 then                                                            #バトルコースの場合
    if (101 <= id and id <= 104) or id == 108 then                              #rWT,rLM,rBC1じゃない場合
      pls = track_name.upcase
    else
      pls = track_name.capitalize.swapcase
    end
  when 201
    pls = "RR"
  when 202
    pls = "BC"
  when 203
    pls = "dHC"
  when 204
    pls = "TH"
  when 205
    pls = "rMP"
  when 206
    pls = "DS"
  when 207
    pls = "rGV"
  when 208
    pls = "rWS"
  when 209
    pls = "BDD"
  when 210
    pls = "CC"
  when 211
    pls = "rTT"
  when 212
    pls = "dNBC"
  when 501
    pls = "RR"
  when 502
    pls = "rMC"
  when 503
    pls = "rMP"
  when 504
    pls = "dBP"
  else
    pls = "Not Found"
  end

  return pls
end
