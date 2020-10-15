require './id_search'
require './track_search'
require './image_search'
require './make_table'
require './points_calculate'
require './constant'
require './command'
require './meigen'
require './time_calculate'
require './lounge_data'
require './mmr_calculate'
require './daifugou'

require 'discordrb'
TOKEN = 'MzQ2MzkyNTQ5NjQ2MjcwNDY1.DHM4fA.YdrtK5nbAUGaglR3K_fr7n6sbsg'.freeze
CLIENT_ID = 346392549646270465.freeze
BOT = Discordrb::Commands::CommandBot.new token: TOKEN, client_id: CLIENT_ID, prefix: '_'


BOT.message(start_with:'_') do |event|                                          #何かのメッセージが入力されたら実行
  unless $flag_war_start
    id = id_search(event.message.content.delete("_"))
    BOT.send_file(event.channel.id, File.open(image_search(id), 'r')) if id != Bad_Num
  end
end


BOT.command(:command) do |event|                                                #コマンド一覧出力
  event.respond(commands_lineup())
end


BOT.message(from:Futsukin, contains:'戦記事') do |event|                         #ふつきんがブログ更新した時
  event.respond("ブログ更新おつです＾ｑ＾")
  event.message.create_reaction("George:353552599070539777")
end


BOT.message(in:Result) do |event|                                               #for-resultに集計が上がった時
  BOT.send_message(Clan_war, "集計おつです＾ｑ＾") if event.user.id != Dark
end


BOT.command(:reboot) do |event|                                                 #botを再起動
  event.respond("再起動するお～＾ｑ＾")
  BOT.stop
end


BOT.command(:shutdown) do |event|                                               #botを終了
  print("shutdown")
  event.respond("終了するお～＾ｑ＾")
  BOT.stop
end


BOT.command(:race) do |event, num|
  if num.count(",") == 5                                                        #1レースの得点計算の場合
    rslt = race_points_calculate(num.split(","))
    if 21 <= rslt && rslt <= 61
      event.respond("#{rslt} - #{82 - rslt}  (差:#{rslt * 2 - 82}点)")
    end
  elsif num.count(",") == 6                                                     #複数レースの得点計算の場合
    pts, rslt = num.split(","), 0
    6.times{|i| rslt += pts[i].to_i}
    dif = rslt * 2 - 82 * pts[6].to_i                                           #得点差の計算
    event.respond("#{rslt} - #{82 * pts[6].to_i - rslt}  (差:#{dif}点)")
  end
end


BOT.message(start_with:'_', contains:'randomtrack') do |event|                  #コース選出コマンド
  if event.message.content.include?("battle")                                   #_randomtrackbattleと入力された場合
    BOT.send_file(event.channel.id, File.open(image_search(rand(101..108)), 'r'))
  else                                                                          #_randomtrackと入力された場合
    BOT.send_file(event.channel.id, File.open(image_search(rand(1..48)), 'r'))
  end
end


BOT.message(start_with:'_', contains:'meigen') do |event|                       #ふつきん名言選出コマンド
  n = event.message.content.delete("^0-9").to_i
  if event.message.content == "_meigenUR"                                       #_meigenURと入力された場合
    t = 0
    while t >= 0 do                                                             #URの名言を抽出するまでループ
      t, saw = t + 1, futsukin_meigen_selection()
      break if saw.include?("[UR]")
    end
    event.respond("#{saw}\nガチャ回数：#{t}回\t課金額：#{t * 300}円")
  elsif n == 0                                                                  #_meigenと入力された場合
    event.respond(futsukin_meigen_selection())
  else                                                                          #_meigen〇〇と入力された場合
    event.respond("ふつきん名言ガチャ#{n}連! (課金額：#{n * 300}円)")
    0.upto(n - 1){event.respond(futsukin_meigen_selection())}
    event.respond("Gacha Finished")
  end
end


BOT.command(:helpsyuzo) do |event|                                              #修造名言出力コマンド
  icon, n = Array.new(5), rand(0..2)
  icon[1], icon[2] = "syuzo1:353862198776299521", "syuzo2:353862589249355777"
  icon[3], icon[4] = "syuzo3:353863300032757760", "syuzo4:353863535417229326"
  n.times{event.respond(syuzo_meigen_selection()).create_reaction(icon[rand(1..4)])}
  event.respond(syuzo_meigen_selection()).create_reaction(icon[rand(1..4)])
end


BOT.command(:mmr) do |event|
  name = event.message.content.sub("_mmr", "").strip
  name = get_lounge_name(event.user.id) if name == ""
  event.respond("#{name}のMMRを検索するお＾ｑ＾")
  data = get_lounge_MMR(name)
  event.channel.send_embed do |embed|
    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name:'MMR', icon_url:'https://i.imgur.com/83G64rX.gif')
    embed.colour = 0xFF8000
    0.step(data.size - 1, 2){|i| embed.add_field(name:data[i], value:data[i + 1], inline:true)}
  end
  event.message.create_reaction("\u{2705}")
end


BOT.command(:stats) do |event|
  name = event.message.content.sub("_stats", "").strip
  name = get_lounge_name(event.user.id) if name == ""
  event.respond("#{name}のStatsを検索するお＾ｑ＾")
  data = get_lounge_stats(name)
  0.step(data.size - 1, 11) do |i|
    if data[i + 1] != "Not Found"
      event.channel.send_embed do |embed|
        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name:'Stats', icon_url:'https://i.imgur.com/83G64rX.gif')
        embed.colour = 0xFF8000
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url:data[i + 10])
        embed.title = data[i + 1]
        embed.add_field(name:"Rank", value:data[i].floor, inline:true)
        embed.add_field(name:"MMR", value:data[i + 2], inline:true)
        embed.add_field(name:"Peak MMR", value:data[i + 3], inline:true)
        embed.add_field(name:"Win Rate", value:"#{(data[i + 4] * 100).round(1).to_s}%", inline:true)
        embed.add_field(name:"W-L (Last 10)", value:data[i + 5], inline:true)
        embed.add_field(name:"Gain/Loss (Last 10)", value:data[i + 6], inline:true)
        embed.add_field(name:"Events Played", value:data[i + 7], inline:true)
        embed.add_field(name:"Largest Gain", value:data[i + 8], inline:true)
        embed.add_field(name:"Largest Loss", value:data[i + 9], inline:true)
      end
    else
      event.respond("#{data[i]}のStatsは見つからなかったお＾ｑ＾")
    end
  end
  event.message.create_reaction("\u{2705}")
end


BOT.command [:cm, :calcmmr, :calculatemmr] do |event, type|
  flag = false
  case type
  when /[fF1]/
    type, flag = 1, true
  when /[2346]/
    type, flag = type[0].to_i, true
  else
    event.respond("形式を入力してね＾ｑ＾\n>>> **_calcmmr XX**\nXX = FFA / 2v2 / 3v3 / 4v4 / 6v6")
  end
  event.respond(calcMMR_introduction(type)) if flag

  while flag
    event.user.await(:put) do |event|
      input = event.message.content
      check, msg = calcMMR_check_input(input, type)
      if check
        flag = false
        event.respond("各プレイヤーのMMRを取得＆計算中...")
        player, tie = get_playerlist_and_tie(input, type)
        data = get_lounge_MMR(player)
        event.respond(get_new_MMR(data, tie, type))
      elsif input.downcase == "cancel"
        flag = false
        event.respond("中止したお＾ｑ＾")
      else
        event.respond("形式が違うお＾ｑ＾\n#{msg}")
      end
    end
  end
end


BOT.command(:history) do |event|
  name = event.message.content.sub("_history", "").strip
  name = get_lounge_name(event.user.id) if name == ""
  name = '"' + name + '"' if name.include?("\s")
  event.respond("#{name}のHistoryを検索/作成するお＾ｑ＾")
  system("python make_graph.py #{name}")
  begin
    BOT.send_file(event.channel.id, File.open('MMR_history.png', 'r'))
    File.delete('MMR_history.png')
    event.message.create_reaction("\u{2705}")
  rescue
    event.respond("#{name}のHistoryは見つからなかったお＾ｑ＾")
  end
end


BOT.command(:warstart) do |event|                                               #交流戦中の既出コース記録コマンド
  event.message.create_reaction("\u{2694}")                                     #剣の絵文字を付ける
  event.respond("選択されたコースの記録を開始するお＾ｑ＾")
  $flag_war_start = true
  $clan_war_time = Time.now.strftime('%Y/%m/%d')
  $import_track = []
  cnt, i, j, track, tmp1, tmp2, tmp3, tmp4 = 1, 0, 0, [], [], [], [], []
  tmp1[0] = tmp2[0] = tmp3[0] = tmp4[0] = select = ""

  while cnt <= 12 do                                                            #12回コースが記録されるまで
    BOT.add_await(:select, Discordrb::Events::MessageEvent) do |event|          #ユーザーからのメッセージ待機
      ins = event.message.content
      ins2 = track_conversion(ins[1..-1])
      id = id_search(ins2)
      if ins == "_warend"                                                       #_warendと入力された場合
        cnt = 999
        $flag_war_start = false
        event.respond("記録を中断したお＾ｑ＾")
      elsif ins2 != "Not Found" or ins == "change"
        if ins.start_with?("_")                                                 #自チームの指示コースを控える
          j += 1
          tmp3[j] = event.respond("_**Race #{cnt}, Please Select : #{ins2}**_")
          tmp4[j] = BOT.send_file(event.channel.id, File.open(image_search(id), 'r'))
          event.message.delete
          tmp3[j - 1].delete
          tmp4[j - 1].delete
          select = ins2
        elsif ins.start_with?("+")                                              #"+"で始まっている場合
          cnt, i, = cnt + 1, i + 1                                              #ループカウント1回プラス
          if ins2 == select                                                     #自チームのコースが来た場合
            track.push("__**" + ins2 + "**__")                                  #指定文字に太字下線と空白を追加
          else
            track.push(ins2)                                                    #指定文字と空白を追加
          end
          send_track = ""
          track.size.times{|k| send_track += (k + 1).to_s + ":" + track[k] + "\s\s"}
          tmp1[i] = event.respond("既出コース(Chosen Track)\n#{send_track}")
          tmp2[i] = BOT.send_file(event.channel.id, File.open(image_search(id + 300), 'r'))
          event.message.delete                                                  #発言者のメッセージ削除
          tmp1[i - 1].delete                                                    #botの古いメッセージ削除
          tmp2[i - 1].delete
          select = ""
        elsif ins.start_with?("-")                                              #"-"で始まっている場合
          chosed = true
          (track.size - 1).downto(0) do |k|                                     #指定文字が既に記録されているか確認
            if track[k].gsub(/[^0-9a-z]/i, "") == ins2
              cnt -= 1                                                          #ループカウント1回マイナス
              track.delete_at(k)                                                #一覧から指定文字を削除
              event.respond("#{ins2}を削除したお＾ｑ＾")
              chosed = false
              break
            end
          end
          event.respond("#{ins2}は記録されていないお＾ｑ＾") if chosed
        elsif ins == "change" and track != []
          if track[-1].include?("**")
            track.push(track[-1].gsub(/[^0-9a-z]/i, ""))
          else
            track.push("__**" + track[-1] + "**__")
          end
          track.delete_at(-2)
          event.respond("#{cnt - 1}レース目 #{track[-1].gsub(/[^0-9a-z]/i, "")} の選択チームを変更したお＾ｑ＾")
        end
        if cnt > 12
          tmp3[j].delete
          tmp4[j].delete
          $import_track = track
          $flag_war_start = false
          event.respond("記録を終了したお＾ｑ＾").create_reaction("\u{1f396}")
        end
      else
        event.respond("それはコース名じゃないお＾ｑ＾") if ins.start_with?("_", "+", "-") or ins == "_helpsyuzo"
      end
    end
  end
end


BOT.command(:maketable) do |event|
  flag, key = 0, 0
  if $import_track != []
    event.respond("直近の_warstartからコースと日付データをインポートしますか＾ｑ＾？(Yes/No)")
    while key == 0 do
      event.user.await(:put) do |event|
        if event.message.content.downcase == "yes"
          flag, key = 1, 1
        elsif event.message.content.downcase == "no"
          key = 1
        else
          event.respond("Yes or Noで解答してね＾ｑ＾")
        end
      end
    end
  end
  event.respond(maketable_introduction(flag))

  while key != 2 do
    event.user.await(:put) do |event|
      input = event.message.content
      check, msg = maketable_check_input(input, flag)
      if check
        event.respond("集計表を作成中...")
        BOT.send_message(Result, make_table(input.gsub("[", "]").split("]"), flag))
        BOT.send_file(Result, File.open('created_sheet.png', 'r'))
        File.delete('created_sheet.png')
        key = 2
        event.respond("集計おつです＾ｑ＾\n集計表を作成したお＾ｑ＾")
      elsif input.downcase == "cancel"
        key = 2
        event.respond("集計表作成を中止したお＾ｑ＾")
      else
        event.respond("形式が違うお＾ｑ＾\n#{msg}")
      end
    end
  end
end


BOT.voice_state_update do |event|                                               #通話時間計測コマンド
  users = BOT.channel(Call).users.size + BOT.channel(Call_cw).users.size
  $call_time.push(Time.now) if users >= 2                                       #現在の時間取得(計測開始)
  if users <= 1 and $call_time != []                                            #2人以上から1人以下になった場合
    rslt = talk_time_calculate($call_time[0], Time.now)                         #計測終了して通話時間計算
    BOT.send_message(Hearing_only, "#{rslt[0]}#{rslt[1]}")                      #for-free-talkにメッセージ送信
    $call_time = []
  end
end


BOT.command(:elapsedtime) do |event|                                            #現在の通話時間計測コマンド
  if $call_time != []
    rslt = talk_time_calculate($call_time[0], Time.now)
    event.respond(rslt[0].sub(/fix\n今回/,"現在") + "```**")                     #文章を修正して通話時間送信
  else
    event.respond("通話が始まっていないお＾ｑ＾")
  end
end


BOT.message(content:'_daifugou') do |event|                                     #大富豪開始コマンド
  event.respond("ゲーム参加者の番号を入力してね＾ｑ＾")
  event.respond(members_list().delete(","))
  BOT.add_await(:select, Discordrb::Events::MessageEvent) do |event|
    flag, key = 0, event.message.content.split(",")
    ppl = key.count
    for i in 0..(ppl - 1) do                                                    #対象範囲外の数字が無いか確認
      if key[i].to_i < 1 || 16 < key[i].to_i
        flag = 1
      else
        for j in (i + 1)..(ppl - 1) do                                          #同じ数字が無いか確認
          if key[i].to_i == key[j].to_i
            flag = 1
          end
        end
      end
    end
    if flag == 0                                                                #入力が正しい場合
      order, $send_dm, $fst_card = "", deal_the_trumps(ppl), []                 #カードの分配
      ppl.times do |i|                                                          #ゲーム進行の順番を決定
        j = rand(0..(ppl - 1))
        key[i], key[j] = key[j], key[i]
      end
      ppl.times do |i|
        trgt = constant_conversion(key[i].to_i)
        BOT.user(trgt).pm("あなたの手札はこちらです\n#{$send_dm[i]}")             #割り当てられたカードをDMで送信
        event.respond("#{BOT.user(trgt).mention}\tカードを配布したお＾ｑ＾")
        $fst_card[i] = $send_dm[i]                                              #カード情報を保持
      end
      $plyr, name = key, members_list().split(",")
      ppl.times do |i|                                                          #決まった順番をテキスト化
        order += name[key[i].to_i - 1].chop.chop.chop.strip + "\s→\s"
      end
      event.respond(daifugou_rule())
      event.respond("今回の順番は\t#{order.chop.chop}\tになるお＾ｑ＾")
      $flag_d = 1                                                               #ゲーム開始準備のフラグを立てる
    else                                                                        #入力が正しくない場合
      event.respond("入力エラー＾ｑ＾")
      false
    end
  end
end


BOT.command(:play) do |event|                                                   #大富豪プレイコマンド
  if $flag_d != 0
    $flag_d = 2                                                                 #ゲーム開始のフラグを立てる
    $kakumei = $shibari = $ablty = $count = $skip = $flg_jk = $spe3 = 0
    $joker, rank_wn, flg_ab, name = 99, 0, 0, members_list().split(",")
    $before, think, gamer, winner, n, bf = [], [], [], [], [], []
    spcl = sbr = yama = rslt = tmp = ""
    rank_ls = ppl = $plyr.count
    ppl.times do |i|                                                            #ゲーム進行の順番通りの名前を取得
      gamer[i] = name[$plyr[i].to_i - 1].chop.chop.chop.strip
      think[i], n[i] = 0, 0
    end
    while $count >= 0 do
      $sent, $dm_msg, crnt, eve, $pass = "", "", "", "", 0
      $count,$turn = next_player(winner,ppl,$count)                             #次のプレイヤーを決定
      event.respond("#{BOT.user($turn).mention}の番だお＾ｑ＾")                  #そのプレイヤー宛にアナウンス送信
      event.respond("**```fix\n#{spcl}\n#{sbr}\n山札の状況：#{yama.chop.chop}```**")
      ppl.times do |i|
        crnt += "#{gamer[i]}：#{$send_dm[i].split(',').count - n[i]}枚\t"
      end
      event.respond("**```fix\n残り手札枚数\n#{crnt}```**")                      #他の人の手札枚数メッセージ送信
      start = Time.now                                                          #シンキング時間計測開始
      while $sent == "" && $pass == 0 && $flag_d == 2 do                        #プレイヤーからの応答を待つ
      end
      think[$count % ppl] += Time.now - start                                   #計測終了して合計時間に加算
      if $count != -888 && $pass == 0 && $spe3 == 0                             #スペ3以外のカードを出した場合
        eve,flg_ab,spcl,sbr,tmp = special_ability($sent.split(","),flg_ab,spcl,sbr,tmp)
        if eve != ""
          event.respond("**#{eve}**")
          if $ablty >= 20
            $flag_d = 3
            while $dm_msg == "" && $flag_d == 3 do                              #プレイヤーからの応答を待つ
            end
            if $ablty == 20                                                     #7渡しの場合
              cnt,trn = next_player(winner,ppl,$count + 1)
              $send_dm[cnt % ppl] = $send_dm[cnt % ppl].to_s
              ($dm_msg.count).times do |i|
                $send_dm[cnt % ppl] += ",\s#{$dm_msg[i]}"                       #次の順番の人にカードを追加する
              end
              event.respond("#{BOT.user(trn).mention}\sカードを追加したお＾ｑ＾")
              BOT.user(trn).pm("現在の手札\n#{$send_dm[cnt % ppl]}")
            end
            $flag_d, $ablty = 2, 0
          end
        end
      end
      if $send_dm[$count % ppl] == "なし"                                       #手札が全て無くなった場合
        n[$count % ppl], flg_ls, foul = 1, 0, ""
        ($before.count).times do |i|                                            #禁止あがりかどうか確認
          bf[i] = $before[i].chop
          if bf[i] == "8" || bf[i] == "JOKER"
            flg_ls = 1
          elsif bf[i] == "3" && $kakumei == 1
            flg_ls = 1
          elsif bf[i] == "2" && $kakumei == 0
            flg_ls = 1
          end
        end
        if flg_ls == 1                                                          #反則負けの場合
          winner[rank_ls - 1], msg = $turn, rank_selection(rank_ls,ppl)         #プレイヤー情報を保持
          rank_ls, foul = rank_ls - 1, "反則負けだお＾ｑ＾"
        else                                                                    #あがった場合
          rank_wn += 1
          winner[rank_wn - 1], msg = $turn, rank_selection(rank_wn,ppl)
        end
        event.respond("#{foul}\n#{BOT.user($turn).mention}\s#{msg}")            #プレイヤー宛にアナウンス
      end
      if (ppl - 1) == ($skip + (rank_wn + (ppl - rank_ls)))                     #全員パスした場合
        yama, sbr, $before, $shibari, $skip, $flg_jk = "", "", [], 0, 0, 0      #山札・パスカウント初期化
        if flg_ab == 1                                                          #Jバック時の場合
          $kakumei, flg_ab, $joker, spcl = 1 - $kakumei, 0, $joker * -1, tmp
        end
        event.respond("**```全員パスしたので山札を流します```**")
      elsif flg_ab == 2 || $spe3 == 1                                           #8切り・スペ3返しの場合
        BOT.user($turn).pm("現在の手札\n#{$send_dm[$count % ppl]}")              #ベット後の手札をDM送信
        if $spe3 == 1
          event.respond("スペ3返し！")
        end
        yama, sbr, $before, $count = "", "", [], $count - 1
        $ablty = $shibari = $skip = flg_ab = $spe3 = 0
        if $flg_jk == 1
          $kakumei, $flg_jk, $joker, spcl = 1 - $kakumei, 0, $joker * -1, tmp
        end
        event.respond("**```山札を流します```**")
      elsif $pass == 0                                                          #カードがベットされた場合
        yama += $sent + "\s→\s"                                                 #山札に追加
        BOT.user($turn).pm("現在の手札\n#{$send_dm[$count % ppl]}")
      end
      if (ppl - 1) == (rank_wn + (ppl - rank_ls))                               #勝敗が確定した場合
        $count,$turn = next_player(winner,ppl,$count + 1)
        msg = rank_selection(rank_ls,ppl)
        event.respond("#{BOT.user($turn).mention}\s#{msg}")                     #最後の1人になったプレイヤー宛にアナウンス
        $count, winner[rank_ls] = -1000, $turn
      end
      $count += 1
    end
    if $count == -999                                                           #強制終了していない場合
      $flag_d = 0                                                               #ゲーム開始のフラグを降ろす
      ppl.times do |i|                                                          #称号の結果リスト作成
        ppl.times do |j|
          if constant_conversion($plyr[i % ppl].to_i) == winner[j]
            msg = /！/.match(rank_selection(j + 1,ppl))
            rslt += "#{gamer[i]}：#{msg.post_match.delete("だお＾ｑ＾")}\t"      #称号以外の文章を消去
          end
        end
      end
      rslt += "\n\n最初の手札\n"
      ppl.times do |i|                                                          #称号の結果リスト作成
        rslt += "#{gamer[i]}：#{$fst_card[i]}\n"
      end
      rslt += "\n考えていた時間\n"
      ppl.times do |i|                                                          #総シンキング時間計算
        rslt += "#{gamer[i]}：#{thinking_time_calculate(think[i])}\t"
      end
      event.respond("**```diff\n-\sゲームセット\s-\n\n結果\n#{rslt}```**")        #結果のメッセージ送信
      event.respond("ゲームを終了したお＾ｑ＾")
    end
  else
    event.respond("今はそのコマンドは使えないお＾ｑ＾")
  end
end


BOT.command(:bet) do |event, str|                                               #カードベットコマンド
  if $flag_d == 2
    if event.user.id == $turn                                                   #現在の順番の人の入力の場合
      if str != "pass"                                                          #パスじゃない場合
        conf, num, ppl = 0, str.split(","), $plyr.count
        cnt, k = num.count, $count % ppl
        card = $send_dm[k].split(",")
        cnt.times do |i|                                                        #所持しているカードかどうか確認
          0.upto(52 / ppl) do |j|
            if card[j] != nil
              if num[i] == card[j].strip                                        #手札と出したカードが一致した場合
                conf += 1
              end
            end
          end
        end
        if cnt == conf                                                          #所持している場合
          if cnt == cards_judgement(num,$before,cnt,$before.count)              #山札の状況からそのカードを出せる場合
            $send_dm[k] = $send_dm[k].to_s + ",\s"                              #語尾に", "を追加
            cnt.times do |i|
              $send_dm[k].slice!("#{num[i]},\s")                                #手札から出したカードを消去
            end
            if $send_dm[k].split(",").count == 0                                #手札が無くなった場合
              $send_dm[k] = "なし"
            else                                                                #手札が無くなっていない場合
              $send_dm[k].chop!.chop!                                           #語尾の", "を消去
            end
            $sent, $before, $before_tmp, $skip = str, num, $before, 0           #出したカード情報を保持
            event.respond("**```「#{str}」がベットされました```**")
          else                                                                  #山札の状況からそのカードを出せない場合
            event.respond("今そのカードは出せないお＾ｑ＾")
            event.message.create_reaction("AHO:357604820129021953")
          end
        else                                                                    #所持していない場合
          event.respond("あなたはそのカードは持っていないお＾ｑ＾")
          event.message.create_reaction("AHO:357604820129021953")
        end
      else                                                                      #パスした場合
        $pass, $skip, $sent = 1, $skip + 1, str
        event.respond("**```パスされました```**")
      end
    else                                                                        #現在の順番の人の入力じゃない場合
      event.respond("あなたの番じゃないお＾ｑ＾")
      event.message.create_reaction("AHO:357604820129021953")
    end
  else
    event.respond("今はそのコマンドは使えないお＾ｑ＾")
  end
end


BOT.command(:give) do |event, str|                                              #7渡し・10捨て時のカード譲渡コマンド
  if $flag_d == 3
    if event.user.id == $turn
      conf, num, ppl = 0, str.split(","), $plyr.count
      cnt, k = num.count, $count % ppl
      card = $send_dm[k].split(",")
      cnt.times do |i|                                                          #所持しているカードかどうか確認
        0.upto(52 / ppl) do |j|
          if card[j] != nil
            if num[i] == card[j].strip                                          #手札と出したカードが一致した場合
              conf += 1
            end
          end
        end
      end
      if cnt == conf                                                            #所持している場合
        x, y = $send_dm[k].split(",").count, $sent.split(",").count
        if y > x
          cnt = x
        end
        if y == cnt
          $send_dm[k] = $send_dm[k].to_s + ",\s"
          cnt.times do |i|
            $send_dm[k].slice!("#{num[i]},\s")                                  #手札から出したカードを消去
          end
          if $send_dm[k].split(",").count == 0                                  #手札が無くなった場合
            $send_dm[k] = "なし"
          else                                                                  #手札が無くなっていない場合
            $send_dm[k].chop!.chop!
          end
          $dm_msg = num
          BOT.send_message(Ageha_bot,"取引が終わったお＾ｑ＾")
        else
          event.respond("枚数が違うお＾ｑ＾")
          if cnt == x
            event.respond("※手札が#{x}枚しかないので#{x}枚分入力してください")
          end
        end
      else
        event.respond("あなたはそのカードは持っていないお＾ｑ＾")
      end
    else
      event.respond("あなたの番じゃないお＾ｑ＾")
    end
  else
    event.respond("今はそのコマンドは使えないお＾ｑ＾")
  end
end


BOT.command(:cancel) do |event|                                                 #大富豪中止コマンド
  if $flag_d != 0
    $flag_d, $count = 0, -888                                                   #ゲーム開始のフラグを降ろしてループ脱出
    event.respond("ゲームを中止したお＾ｑ＾")
  else
    event.respond("ゲームが始まっていないお＾ｑ＾")
  end
end


BOT.run
