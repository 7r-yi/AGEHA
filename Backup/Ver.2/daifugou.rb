$flag_d = 0

def daifugou_rule()                                                             #大富豪のルール文
  send = "```★基本ルール\n場に出ているカードよりも強いカードを出していき、手札が無くなったから勝ち\n手札が早く無くなった人から順番に大富豪～大貧民の称号が割り当てられる\n"
  send += "カードの強さ[ジョーカー > 2 > A > K > Q > J > 10 > ・・・ > 3]\nジョーカー2枚入り(JOKERa,JOKERb)の計54枚\n3s\s→\s3のスペード\s\s7d\s→\s7のダイヤ\s\sJh\s→\sJのハート\s\s2c\s→\s2のクラブ\n\n\n"
  send += "★使用ローカルルール\n・革命\n4枚以上のカードを同時に出すと、ジョーカー以外のカードの強さが反転する\nちなみに、革命発動時に出したカードの効果は8切り以外発動しない\n"
  send += "・しばり\n前の人と同じマークを出すと、山札が流されるまでそのマークしか出せない\n複数枚出した時に一部のマークのみしばることはできない\n※無いマークをジョーカーで補ったしばりも可能だが、その際は前者が出したカードのマークの並び通りに出すこと\n"
  send += "・7渡し\n出した7の枚数分だけ、次の人に手札から好きなカードを必ず渡す\n出した7の枚数より手札が少ない場合は、その手札の枚数分渡す\n"
  send += "・8切り\n8を出すと山札を流すことができる\n"
  send += "・10捨て\n出した10の枚数分だけ、手札から好きなカードを必ず捨てる\n出した10の枚数より手札が少ない場合は、その手札の枚数分捨てる\n"
  send += "・Jバック\nJを出すと山札が流されるまで一時的に革命状態となる\n革命状態の時に使用すると逆革命となり一時的に通常状態に戻る\n"
  send += "・スペ3返し\nジョーカーが単独で出された場合、スペードの3で山札を流すことができる\n"
  send += "・禁止あがり\n最後にベットしたカードが\s3(革命時),8,2(通常時),ジョーカー\sだと反則負けとなる\n反則負けした順番に 大貧民 → 貧民 → ・・・となる\n\n\n"
  send += "★カードの出し方\n「_bet 〇〇」とメッセージを送信する\nパスする場合は「_bet pass」となる\n例1(1枚出し)：_bet 5d\t例2(2枚出し)：_bet As,JOKERa\n\n\n"
  send += "_play\sでゲーム開始\t_cancel\sでゲームを中止```"

  return send
end


def constant_conversion(plyr)                                                   #変数からメンバーの固有定数に変換
  case plyr
  when 1
    trgt = Futsukin
  when 2
    trgt = Mochi
  when 3
    trgt = Lchiki
  when 4
    trgt = K4I
  when 5
    trgt = Ren
  when 6
    trgt = Naoto
  when 7
    trgt = Dark
  when 8
    trgt = Toki
  when 9
    trgt = Yuyuyu
  when 10
    trgt = Danny
  when 11
    trgt = Ejikara
  when 12
    trgt = Kerus
  when 13
    trgt = Liara
  when 14
    trgt = Toi
  when 15
    trgt = Kenn
  when 16
    trgt = Nonono
  end

  return trgt
end


def deal_the_trumps(ppl)                                                        #トランプを切って各プレイヤーに分配
  x, num, card, $send_dm = [], [], [], []

  0.upto(53) do |i|                                                             #1~54の数字を生成
    x[i] = i + 1
  end

  0.upto(53) do |i|                                                             #数字をシャッフル
    j = rand(0..52)
    x[i], x[j] = x[j], x[i]
  end

  0.upto(53) do |i|
    if x[i] == 53 then                                                          #53番目をJOKERaに変換
      num[i] = "JOKERa"
    elsif x[i] == 54 then                                                       #54番目をJOKERbに変換
      num[i] = "JOKERb"
    else
      n = ((x[i] - 1) % 13 + 1).to_s                                            #1~13の数字に変換
      case (x[i] % 4)                                                           #マークに変換してカード生成
      when 0
        num[i] = n + "s"
      when 1
        num[i] = n + "d"
      when 2
        num[i] = n + "h"
      when 3
        num[i] = n + "c"
      end
    end
  end

  0.upto(53) do |i|
    card[i % ppl] = card[i % ppl].to_s + num[i].to_s + ","                      #配列化の準備
  end

  ppl.times do |i|
    sst = selection_sort(card[i].split(","))                                    #配列化してソートする
    0.upto(53 / ppl) do |j|
      unless sst[j].to_s == "" then
        case sst[j].delete("^0-9").to_i                                         #1,11,12,13をA,J,Q,Kに変換
        when 1
          sst[j] = "A" + sst[j].delete("0-9")
        when 11
          sst[j] = "J" + sst[j].delete("0-9")
        when 12
          sst[j] = "Q" + sst[j].delete("0-9")
        when 13
          sst[j] = "K" + sst[j].delete("0-9")
        end
        $send_dm[i] = $send_dm[i].to_s + sst[j].to_s + ", "                     #配列解体して文章整定
      end
    end
    $send_dm[i].chop!.chop!                                                     #最後の2文字(", ")を消去
  end

  return $send_dm
end


def selection_sort(n)                                                           #選択ソートで数字を小さい順に並び替え
  for i in 0..(n.length - 2)
    min_p = i
    for j in (i + 1)..(n.length - 1)
      if n[min_p].to_i > n[j].to_i
        min_p = j
      end
    end
    n[i], n[min_p] = n[min_p], n[i]
  end

  return n
end


def next_player(win,ppl,cnt)                                                    #次の順番のプレイヤーを決定
  flag = 0

  while flag == 0 do
    turn = constant_conversion($plyr[cnt % ppl].to_i)
    ppl.times do |i|
      if turn == win[i] then                                                    #既出プレイヤーなら順番を飛ばす
        cnt, flag = cnt + 1, 0
        break
      else                                                                      #ゲーム中のプレイヤーならループを抜ける
        flag = 1
      end
    end
  end

  return cnt, turn
end


def cards_judgement(m,n,x,y)                                                    #出されたカードが場に出せるか確認
  conf, s, temp, af, bf, saf, sbf, sm, sn = 0, 0, 0, [], [], [], [], "", ""

  if n != [] then                                                               #山札に何もないかどうか
    x.times do |i|
      sm += m[i] + ","
      sn += n[i] + ","
    end
    sm = sm.chop.split(",")
    sn = sn.chop.split(",")
    if x == y then                                                              #前者が出したカード枚数と一致するかどうか
      if y == 1 && m[0] == "3s" && n[0].include?("JOKER") == true then          #スペ3返し出来るかどうか
        conf, $spe3 = x, 1
      else
        x.times do |i|
          saf[i] = sm[i]
          saf[i].slice!(0).delete!("0-9")
          sbf[i] = sn[i]
          sbf[i].slice!(0).delete!("0-9")
          if saf[i].include?("OKER") == true then
            if sbf[i].include?("OKER") == true then
              temp = $shibari - s
            else
              saf[i] = sbf[i]
            end
          end
          case saf[i]
          when "s"
            s += 1
          when "d"
            s += 10
          when "h"
            s += 100
          when "c"
            s += 1000
          end

          af[i] = m[i].chop
          case af[i]
          when "J"
            af[i] = 11
          when "Q"
            af[i] = 12
          when "K"
            af[i] = 13
          when "A"
            af[i] = 14
          when "2"
            af[i] = 15
          when "JOKER"
            af[i] = $joker
          else
            af[i] = af[i].delete("^0-9").to_i
          end

          bf[i] = n[i].chop
          case bf[i]
          when "J"
            bf[i] = 11
          when "Q"
            bf[i] = 12
          when "K"
            bf[i] = 13
          when "A"
            bf[i] = 14
          when "2"
            bf[i] = 15
          when "JOKER"
            bf[i] = $joker
          else
            bf[i] = bf[i].delete("^0-9").to_i
          end

          if $kakumei == 0 then                                                 #革命未発生
            if (y >= 2 && bf[i] == $joker) || bf[i] < af[i] then                #前者のカードよりも強いか確認
              conf += 1
            end
          else                                                                  #革命発生中
            if (y >= 2 && bf[i] == $joker) || bf[i] > af[i] then                #前者のカードよりも強いか確認
              conf += 1
            end
          end
        end
        if $shibari != 0 && $shibari != s + temp then                           #しばり発生中にマークが違う場合
          conf = 0
        end
        (x - 1).times do |i|
          if (af[i] != $joker && af[i + 1] != $joker) && af[i] != af[i + 1] then  #違う数字のカードがないか確認
            conf = 0
          end
          1.upto(x - 1) do |j|
            if m[i] == m[i + j] then                                            #カードが重複していないか確認
              conf = 0
            end
          end
        end
      end
    end
  else
    conf = x
  end

  return conf
end


def special_ability(card,flag,spcl,sbr,temp)                                    #能力持ちのカード判定
  cnt = s = 0
  num, event, yagi, mark, af, bf = card.count, "", "", "", [], []

  num.times do |i|
    yagi += card[i] + ","
  end
  yagi = yagi.chop.split(",")

  if num >= 4 then                                                              #4枚以上で革命フラグを立てる
    if $kakumei == 0 then
      $kakumei, $joker, spcl = 1, -99, "革命発生中！"
      temp = spcl
      event += "革命開始！\n"
    else
      $kakumei, $joker, spcl = 0, 99, ""
      temp = spcl
      event += "革命返し！\s革命が終了したお＾ｑ＾\n"
    end
  else
    num.times do |i|
      af[i] = card[i].chop
      if af[i] != "JOKER" then
        case af[i]
        when "7"                                                                #7が含まれている場合
          $ablty = 20
        when "10"                                                               #10が含まれている場合
          $ablty = 21
        when "J"                                                                #Jが含まれている場合
          if $kakumei == 0 then
            $kakumei, $joker, spcl = 1, -99, "一時的に革命発生中！"
          else
            $kakumei, $joker, spcl = 0, 99, "一時的に革命解除中！"
          end
          event += "Jバック！\n"
          $flg_jk = flag = 1
        end
        break
      end
    end
    if $shibari == 0 && $before_tmp != [] then                                  #しばりの確認
      num.times do |i|
        af[i] = card[i]
        af[i].slice!(0).delete!("0-9")
        bf[i] = $before_tmp[i]
        bf[i].slice!(0).delete!("0-9")
      end
      num.times do |i|
        num.times do |j|
          if af[i].include?("OKER") == true then
            af[i] = bf[i]
          elsif bf[j].include?("OKER") == true then
            bf[i] = af[i]
          end
          if af[j] == bf[i] then                                                #同じ記号があった場合
            case af[j]
            when "s"
              mark += "スペード\s"
              s += 1
            when "d"
              mark += "ダイヤ\s"
              s += 10
            when "h"
              mark += "ハート\s"
              s += 100
            when "c"
              mark += "クラブ\s"
              s += 1000
            else                                                                #JOKER同士だった場合
              cnt -= 1
            end
            cnt += 1
          end
        end
      end
      if num == cnt then                                                        #同じ記号が枚数分あった場合
        $shibari, sbr = s, "#{mark}でしばり中！"
        event += "しばり開始！\n"
      end
    end
  end

  num.times do |i|
    if yagi[i].chop == "8" then                                                 #8が含まれている場合
      $ablty = 2
    end
  end

  case $ablty
  when 2
    flag = 2
    event += "8切り！\n"
  when 20
    event += "7渡し！\n渡すカードを「_give 〇〇」で”DMにて”送信してね＾ｑ＾\n"
  when 21
    event += "10捨て！\n捨てるカードを「_give 〇〇」で”DMにて”送信してね＾ｑ＾\n"
  end

  return event, flag, spcl, sbr, temp
end


def rank_selection(num,ppl)                                                     #あがった順番から順位を選定
  flag = 0

  if ppl <= 3 then                                                              #3人以下なら富豪と貧民は誰も属さない
    flag = 1
  end

  case num
  when 1
    msg = "おめでとう！大富豪だお＾ｑ＾"
    flag = 0
  when ppl
    msg = "残念！大貧民だお＾ｑ＾"
    flag = 0
  when 2
    unless flag == 1 then
      msg = "あがり！富豪だお＾ｑ＾"
    end
  when (ppl - 1)
    unless flag == 1 then
      msg = "あがり！貧民だお＾ｑ＾"
    end
  else
    msg = "あがり！平民だお＾ｑ＾"
  end
  if flag == 1 then
    msg = "あがり！平民だお＾ｑ＾"
  end

  return msg
end


def thinking_time_calculate(tm)                                                 #シンキング時間計算
  m = (tm.to_i % 3600) / 60
  s = tm.to_i % 60
  if 0.5 <= (tm.to_f % 60) - s then
    s += 1
  end

  return "#{m}分#{s}秒"
end
