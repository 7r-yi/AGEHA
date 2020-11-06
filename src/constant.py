from datetime import datetime
import json

commands = ["_sd", "_shutdown",
            "_cmd", "_command", "_help", "_mg", "_meigen", "_hs", "_helpsyuzo", "_et", "_elapsedtime",
            "_mmr", "_st", "_stats", "_ht", "_history", "_am", "_avemmr", "_cm", "_calcmmr",
            "_race", "_it", "_itemtable", "_ws", "_warstart", "_mt", "_maketable"]

command_lineup = "```diff\nコマンド一覧(先頭に'_'を付けてコマンド実行)\n\n" \
                 "・交流戦中のコースを記録 : [ws], [WarStart]\n" \
                 "・コースの記録を中断(WarStart実行中のみ) : [we], [WarEnd]\n" \
                 "(・交流戦の集計表を作成 : [mt], [MakeTable])\n" \
                 "・順位or点数からチーム総得点を計算 : [Race *num]\n" \
                 "・コースのスター&サンダーテーブル画像を表示 : [it *track], [ItemTable *track]\n" \
                 "・ふつきん名言ガチャを回す : [mg *num], [Meigen *num]\n" \
                 "・修造名言を表示する : [hs], [HelpSyuzo]\n" \
                 "・プレイヤーのMMRを取得する : [MMR *name]\n" \
                 "・プレイヤーのStatsを取得する : [st *name], [Stats *name]\n" \
                 "・プレイヤーのHistoryを取得する : [ht *name], [History *name]\n" \
                 "・各チームの平均MMRとボーダー順位を計算する : [am *type], [AveMMR *type]\n" \
                 "・ラウンジ結果から増減MMRを計算する : [cm *type], [ClacMMR *type]\n" \
                 "・現在の通話時間を表示する(通話中のみ) : [et], [ElapsedTime]\n" \
                 "・コマンド一覧を表示する : [cmd], [Command], [Help]\n" \
                 "・Botを終了する(管理者のみ) : [sd], [ShutDown]```"

image_lineup = "```diff\n画像出力コマンド一覧(先頭に'_'を付けてコマンド実行)\n\n" \
               "★オリジナルコース\n" \
               "FutsukinRoad, FR, MountMochi, MM, LchikiCircuit, dLC, K4IHarbor, KH, " \
               "RenPark, rRP, NaotoShoals, NS, jorisVolcano, rJV, tokiStadium, rTS, yuyuyuDunes, YD, " \
               "DannyCruise, DC, EjisTurnpike, rET, NeoKerusCity, dNKC\n" \
               "NvKRoad, subarashikosu, gomipark, gomipark2, gomipark3, gomiko\n\n" \
               "★メンバーのMii\n" \
               "Futsukin, Mochi, Lchiki, K4I, 101, riara, Ren, Naoto, Futami, AGEHA, Dark, toki, yuyuyu, Danny, " \
               "Ejikara, Kerus, kenn, Nonono, Lily, Syatyou, KonKon\n\n" \
               "★その他\n" \
               "NvKtheme1, NvKtheme2, TeamNvK1, TeamNvK2, TeamNvK3, George, joris, Futoopa, Mogi, Neochi, MokoMoko, " \
               "temee, naide, FutsuFamily, FutamiGahaku, isogasui, HentaiAGEHA, korosuzo, U-N-CHI\n```"

Futsukin = 164012913890164737
Mochi = 246229232722640897
Lchiki = 188884941654720513
K4I = 230273389640679424
Ren = 193407417256640512
Naoto = 318222535919534091
Dark = 111899879277604864
Toki = 161174268745351168
Yuyuyu = 318223477498970123
Danny = 83580299891441664
Ejikara = 343235424023609348
Kerus = 330965938654543873
Liara = 332504577201143810
Toi = 284913562265321473
Kenn = 342871055754461194
Nonono = 334523860714127370
Syatyou = 314033789921656833
Konkon = 402457281142456321
Free_talk = 164015168227901440
Hearing_only = 415886095558115331
Clan_war = 318724226481782784
Result = 318725712586473472
Music_bot = 340898898757550083
Ageha_bot = 347812031216353283
Bad_Num = -999

Test = 345169020602941453

flag_war_start = False
clan_war_user = ["ふつきん", "", "", "", "", ""]
enemy_clan = ""
with open('src/call_backup.json') as file:
    call = json.load(file)
if call['call_time'] is None:
    call_time = []
else:
    call_time = [datetime.strptime(call['call_time'], '%Y-%m-%d %H:%M:%S.%f')]
call_user = call['call_user']
