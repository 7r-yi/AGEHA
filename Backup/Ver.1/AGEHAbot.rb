::RBNACL_LIBSODIUM_GEM_LIB_PATH = 'libsodium.dll'
require 'discordrb'
TOKEN = 'MzQ2MzkyNTQ5NjQ2MjcwNDY1.DHM4fA.YdrtK5nbAUGaglR3K_fr7n6sbsg'.freeze
CLIENT_ID = 346392549646270465.freeze
BOT = Discordrb::Commands::CommandBot.new token: TOKEN, client_id: CLIENT_ID, prefix: '_'
Futsukin = 164012913890164737.freeze
Mochi = 246229232722640897.freeze
Lchiki = 188884941654720513.freeze
K4I = 230273389640679424.freeze
Ren = 193407417256640512.freeze
Naoto = 318222535919534091.freeze
Dark = 111899879277604864.freeze
Toki = 161174268745351168.freeze
Yuyuyu = 318223477498970123.freeze
Danny = 83580299891441664.freeze
Ejikara = 343235424023609348.freeze
Kerus = 330965938654543873.freeze
Liara = 332504577201143810.freeze
Toi = 284913562265321473.freeze
Kenn = 342871055754461194.freeze
Nonono = 334523860714127370.freeze
Free_talk = 164015168227901440.freeze
Clan_wars = 318724226481782784.freeze
Result = 318725712586473472.freeze
Music_bot = 340898898757550083.freeze
Ageha_bot = 347812031216353283.freeze
Call = 164015168227901442.freeze
$trc, $wi, $fir, $key, $time, $line, $flag_d = [], 0, 0, 0, 0, 2, 0             #グローバル変数初期化

def track_search(trc)                                                           #英略称でコースを検索
  case trc
  when "mks"
    id = 1
  when "wp"
    id = 2
  when "ssc"
    id = 3
  when "tr"
    id = 4
  when "mc"
    id = 5
  when "th"
    id = 6
  when "tm"
    id = 7
  when "sgf"
    id = 8
  when "sa"
    id = 9
  when "ds"
    id = 10
  when "ed"
    id = 11
  when "mw"
    id = 12
  when "cc"
    id = 13
  when "bdd"
    id = 14
  when "bc"
    id = 15
  when "rr"
    id = 16
  when "rmmm"
    id = 17
  when "rmc"
    id = 18
  when "rccb"
    id = 19
  when "rtt"
    id = 20
  when "rddd"
    id = 21
  when "rdp3"
    id = 22
  when "rrry"
    id = 23
  when "rdkj"
    id = 24
  when "rws"
    id = 25
  when "rsl"
    id = 26
  when "rmp"
    id = 27
  when "ryv"
    id = 28
  when "rttc"
    id = 29
  when "rpps"
    id = 30
  when "rgv"
    id = 31
  when "rrrd"
    id = 32
  when "dyc"
    id = 33
  when "dea"
    id = 34
  when "ddd"
    id = 35
  when "dmc"
    id = 36
  when "dwgm"
    id = 37
  when "drr"
    id = 38
  when "diio"
    id = 39
  when "dhc"
    id = 40
  when "dbp"
    id = 41
  when "dcl"
    id = 42
  when "dww"
    id = 43
  when "dac"
    id = 44
  when "dnbc"
    id = 45
  when "drir"
    id = 46
  when "dsbs"
    id = 47
  when "dbb"
    id = 48
  when "bs"
    id = 101
  when "ssk"
    id = 102
  when "dp"
    id = 103
  when "lc"
    id = 104
  when "rwt"
    id = 105
  when "rlm"
    id = 106
  when "rbc1"
    id = 107
  when "uu"
    id = 108
  else
    id = -1
  end

  return id
end

def track_search_original(trc)                                                  #オリジナルキーワードでコース等を検索
  case trc
  when "nvkroad"
    id = 16
  when "subarashikosu"
    id = 18
  when "gomipark"
    id = 27
  when "kamiko"
    id = 41
  when "futsukinroad","fr"
    id = 201
  when "mountmochi","mm"
    id = 202
  when "lchikicircuit","dlc"
    id = 203
  when "k4iharbor","kh"
    id = 204
  when "renpark","rrp"
    id = 205
  when "naotoshoals","ns"
    id = 206
  when "jorisvolcano","rjv"
    id = 207
  when "tokistadium","rts"
    id = 208
  when "yuyuyudunes","yd"
    id = 209
  when "dannycruise","dc"
    id = 210
  when "ejisturnpike","ret"
    id = 211
  when "neokeruscity","dnkc"
    id = 212
  when "george"
    id = 1001
  when "joris"
    id = 1002
  when "futoopa"
    id = 1003
  when "mogi"
    id = 1004
  when "neochi"
    id = 1005
  else
    id = -1
  end

  return id
end

def image_url(id)                                                               #画像のURLを選出
  case id
  when 1
    url = "https://www.mariowiki.com/images/0/09/MK8_Mario_Kart_Stadium_Course_Icon.png"
  when 2
    url = "https://www.mariowiki.com/images/4/40/MK8_Water_Park_Course_Icon.png"
  when 3
    url = "https://www.mariowiki.com/images/a/ad/MK8_Sweet_Sweet_Canyon_Course_Icon.png"
  when 4
    url = "https://www.mariowiki.com/images/e/e8/MK8_Thwomp_Ruins_Course_Icon.png"
  when 5
    url = "https://www.mariowiki.com/images/2/28/MK8_Mario_Circuit_Course_Icon.png"
  when 6
    url = "https://www.mariowiki.com/images/2/2a/MK8_Toad_Harbor_Course_Icon.png"
  when 7
    url = "https://www.mariowiki.com/images/6/68/MK8_Twisted_Mansion_Course_Icon.png"
  when 8
    url = "https://www.mariowiki.com/images/2/2a/MK8_Shy_Guy_Falls_Course_Icon.png"
  when 9
    url = "https://www.mariowiki.com/images/9/99/MK8_Sunshine_Airport_Course_Icon.png"
  when 10
    url = "https://www.mariowiki.com/images/f/fc/MK8_Dolphin_Shoals_Course_Icon.png"
  when 11
    url = "https://www.mariowiki.com/images/1/14/MK8_Electrodrome_Course_Icon.png"
  when 12
    url = "https://www.mariowiki.com/images/3/38/MK8_Mount_Wario_Course_Icon.png"
  when 13
    url = "https://www.mariowiki.com/images/8/81/MK8_Cloudtop_Cruise_Course_Icon.png"
  when 14
    url = "https://www.mariowiki.com/images/d/d3/MK8_Bone-Dry_Dunes_Course_Icon.png"
  when 15
    url = "https://www.mariowiki.com/images/2/2b/MK8_Bowser%27s_Castle_Course_Icon.png"
  when 16
    url = "https://www.mariowiki.com/images/7/77/MK8_Rainbow_Road_Course_Icon.png"
  when 17
    url = "https://www.mariowiki.com/images/9/97/MK8_Wii_Moo_Moo_Meadows_Course_Icon.png"
  when 18
    url = "https://www.mariowiki.com/images/f/f7/MK8_GBA_Mario_Circuit_Course_Icon.png"
  when 19
    url = "https://www.mariowiki.com/images/9/9e/MK8_DS_Cheep_Cheep_Beach_Course_Icon.png"
  when 20
    url = "https://www.mariowiki.com/images/5/55/MK8_N64_Toad%27s_Turnpike_Course_Icon.png"
  when 21
    url = "https://www.mariowiki.com/images/6/64/MK8_GCN_Dry_Dry_Desert_Course_Icon.png"
  when 22
    url = "https://www.mariowiki.com/images/b/b1/MK8_SNES_Donut_Plains_3_Course_Icon.png"
  when 23
    url = "https://www.mariowiki.com/images/8/8a/MK8_N64_Royal_Raceway_Course_Icon.png"
  when 24
    url = "https://www.mariowiki.com/images/3/35/MK8_3DS_DK_Jungle_Course_Icon.png"
  when 25
    url = "https://www.mariowiki.com/images/1/1a/MK8_DS_Wario_Stadium_Course_Icon.png"
  when 26
    url = "https://www.mariowiki.com/images/3/3f/MK8_GCN_Sherbet_Land_Course_Icon.png"
  when 27
    url = "https://www.mariowiki.com/images/9/94/MK8_3DS_Music_Park_Course_Icon.png"
  when 28
    url = "https://www.mariowiki.com/images/a/a4/MK8_N64_Yoshi_Valley_Course_Icon.png"
  when 29
    url = "https://www.mariowiki.com/images/0/0b/MK8_DS_Tick-Tock_Clock_Course_Icon.png"
  when 30
    url = "https://www.mariowiki.com/images/d/d1/MK8_3DS_Piranha_Plant_Slide_Course_Icon.png"
  when 31
    url = "https://www.mariowiki.com/images/b/b2/MK8_Wii_Grumble_Volcano_Course_Icon.png"
  when 32
    url = "https://www.mariowiki.com/images/b/b9/MK8_N64_Rainbow_Road_Course_Icon.png"
  when 33
    url = "https://www.mariowiki.com/images/7/7c/MK8_DLC_GCN_Yoshi_Circuit_Course_Icon.png"
  when 34
    url = "https://www.mariowiki.com/images/f/fd/MK8_DLC_Excitebike_Arena_Course_Icon.png"
  when 35
    url = "https://www.mariowiki.com/images/2/21/MK8_DLC_Dragon_Driftway_Course_Icon.png"
  when 36
    url = "https://www.mariowiki.com/images/a/a3/MK8_DLC_Mute_City_Course_Icon.png"
  when 37
    url = "https://www.mariowiki.com/images/b/b4/MK8_DLC_Wii_Wario%27s_Gold_Mine_Course_Icon.png"
  when 38
    url = "https://www.mariowiki.com/images/4/4b/MK8_DLC_SNES_Rainbow_Road_Course_Icon.png"
  when 39
    url = "https://www.mariowiki.com/images/b/b0/MK8_DLC_Ice_Ice_Outpost_Course_Icon.png"
  when 40
    url = "https://www.mariowiki.com/images/2/2e/MK8_DLC_Hyrule_Circuit_Course_Icon.png"
  when 41
    url = "https://www.mariowiki.com/images/c/c2/MK8_DLC_GCN_Baby_Park_Course_Icon.png"
  when 42
    url = "https://www.mariowiki.com/images/5/5c/MK8_DLC_Cheese_Land_Course_Icon.png"
  when 43
    url = "https://www.mariowiki.com/images/7/78/MK8_DLC_Wild_Woods_Course_Icon.png"
  when 44
    url = "https://www.mariowiki.com/images/8/84/MK8_DLC_Animal_Crossing_Course_Icon.png"
  when 45
    url = "https://www.mariowiki.com/images/8/89/MK8_DLC_3DS_Neo_Bowser_City_Course_Icon.png"
  when 46
    url = "https://www.mariowiki.com/images/b/ba/MK8_DLC_GBA_Ribbon_Road_Course_Icon.png"
  when 47
    url = "https://www.mariowiki.com/images/8/8d/MK8_DLC_Super_Bell_Subway_Course_Icon.png"
  when 48
    url = "https://www.mariowiki.com/images/a/ab/MK8_DLC_Big_Blue_Course_Icon.png"
  when 101
    url = "https://www.mariowiki.com/images/7/72/MK8D_Battle_Stadium_Course_Icon.png"
  when 102
    url = "https://www.mariowiki.com/images/9/9f/MK8D_Sweet_Sweet_Kingdom_Course_Icon.png"
  when 103
    url = "https://www.mariowiki.com/images/f/f3/MK8D_Dragon_Palace_Course_Icon.png"
  when 104
    url = "https://www.mariowiki.com/images/3/35/MK8D_Lunar_Colony_Course_Icon.png"
  when 105
    url = "https://www.mariowiki.com/images/e/e6/MK8D_3DS_Wuhu_Town_icon.png"
  when 106
    url = "https://www.mariowiki.com/images/f/f8/MK8D_GCN_Luigi%27s_Mansion_Course_Icon.png"
  when 107
    url = "https://www.mariowiki.com/images/a/ad/MK8D_SNES_Battle_Course_1_Course_Icon.png"
  when 108
    url = "https://www.mariowiki.com/images/3/36/MK8D_Urchin_Underpass_Course_Icon.png"
  when 201
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/4/1/410715f2.png"
  when 202
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/8/7/8738b684.png"
  when 203
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/b/0/b0d73757.png"
  when 204
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/7/7/7703df9d.png"
  when 205
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/0/3/0364218a.png"
  when 206
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/e/0/e0418995.png"
  when 207
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/9/a/9af337d9.png"
  when 208
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/5/3/53a94fc0.png"
  when 209
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/7/4/741bf8c6.png"
  when 210
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/a/5/a5b2e380.png"
  when 211
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/1/8/18d43efa.png"
  when 212
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/e/a/eac1d0cc.png"
  when 301
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/0/4/0425c5f6-s.jpg"
  when 302
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/1/0/102a2551-s.jpg"
  when 303
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/5/0/50a04567-s.jpg"
  when 304
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/d/8/d8b57e42-s.jpg"
  when 305
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/e/7/e7124424-s.jpg"
  when 306
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/5/7/574f2e8e-s.jpg"
  when 307
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/4/d/4d99fe79-s.jpg"
  when 308
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/a/c/acef8d48-s.jpg"
  when 309
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/9/f/9f639800-s.jpg"
  when 310
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/e/7/e7b2df46-s.jpg"
  when 311
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/5/8/581b7373-s.jpg"
  when 312
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/a/0/a0cd8a6f-s.jpg"
  when 313
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/4/6/46b8bc93-s.jpg"
  when 314
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/9/5/958a702a-s.jpg"
  when 315
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/7/f/7ff8212c-s.jpg"
  when 316
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/3/6/361ebab7-s.jpg"
  when 317
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/e/8/e80b7144-s.jpg"
  when 318
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/b/4/b441c081-s.jpg"
  when 319
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/7/5/7584a851-s.jpg"
  when 320
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/d/c/dc10e9dd-s.jpg"
  when 321
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/7/a/7a1f0c33-s.jpg"
  when 322
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/4/6/466d5439-s.jpg"
  when 323
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/e/6/e6cdb944-s.jpg"
  when 324
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/1/5/15fc3e8d-s.jpg"
  when 325
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/0/a/0ac1e441-s.jpg"
  when 326
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/c/0/c09534b3-s.jpg"
  when 327
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/2/4/24713994-s.jpg"
  when 328
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/4/2/42399c7f-s.jpg"
  when 329
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/2/a/2aab3b4a-s.jpg"
  when 330
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/9/4/94256c94-s.jpg"
  when 331
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/0/d/0dcad0d5-s.jpg"
  when 332
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/5/8/58366e15-s.jpg"
  when 333
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/f/d/fd34ca7c-s.jpg"
  when 334
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/2/0/20a16a79-s.jpg"
  when 335
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/6/5/65bafcfa-s.jpg"
  when 336
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/5/f/5ffa7c78-s.jpg"
  when 337
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/6/d/6d3a14e3-s.jpg"
  when 338
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/3/6/36fcb344-s.jpg"
  when 339
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/7/b/7ba71e97-s.jpg"
  when 340
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/2/9/29b2e11c-s.jpg"
  when 341
    url = "No Image"
  when 342
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/e/a/ea12de13-s.jpg"
  when 343
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/a/c/acb399a8-s.jpg"
  when 344
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/3/f/3f9eaab6-s.jpg"
  when 345
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/1/4/141927e8-s.jpg"
  when 346
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/c/9/c9419287-s.jpg"
  when 347
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/3/5/359806dc-s.jpg"
  when 348
    url = "http://livedoor.blogimg.jp/nim_2525/imgs/e/6/e604c435-s.jpg"
  when 1001
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/e/b/eb1b820e.jpg"
  when 1002
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/3/0/30231329.jpg"
  when 1003
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/6/7/67f2c7da.png"
  when 1004
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/9/1/914f76eb.png"
  when 1005
    url = "http://livedoor.blogimg.jp/ren_yster/imgs/c/e/ce03f93b.jpg"
  else
    url = "Not Found"
  end

  return url
end

def customize_search(cus)                                                       #カスタムを検索
  case cus
  when Futsukin
    cus = 7
  when Mochi
    cus = 1
  when Lchiki
    cus = 1
  when K4I
    cus = 2
  when Ren
    cus = 2
  when Naoto
    cus = 19
  when Dark
    cus = 8
  when Toki
    cus = 2
  when Yuyuyu
    cus = 15
  when Danny
    cus = 4
  when Ejikara
    cus = 4
  when Kerus
    cus = 1
  when Liara
    cus = 11
  when Kenn
    cus = 9
  when Nonono
    cus = 14
  end

  case cus
  when 1
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/3/b/3b4e3587.jpg"          #モートンハナチャン
  when 2
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/3/0/300626e0.jpg"          #モートンドリバイ
  when 3
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/7/d/7d310a0d.jpg"          #ワリオハナチャン
  when 4
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/5/5/552f6020.jpg"          #ワリオドリバイ
  when 5
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/4/f/4fbd643a.jpg"          #クッパハナチャン
  when 6
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/4/6/467c32b2.jpg"          #クッパドリバイ
  when 7
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/c/8/c8751954.jpg"          #ほねハナチャン
  when 8
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/b/7/b757c06a.jpg"          #ほねドリバイ
  when 9
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/f/d/fd25176d.jpg"          #ゴルマリハナチャン
  when 10
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/e/c/ec4b2852.jpg"          #ゴルマリドリバイ
  when 11
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/9/f/9fbddb54.jpg"          #メタマリハナチャン
  when 12
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/8/0/807044b4.jpg"          #メタマリドリバイ
  when 13
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/4/b/4b598f96.jpg"          #ワルイージハナチャン
  when 14
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/3/d/3d7d67a0.jpg"          #ワルイージドリバイ
  when 15
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/7/6/7661a272.jpg"          #ワルイージヨシバ
  when 16
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/7/6/764762e0.jpg"          #ドンキーハナチャン
  when 17
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/b/2/b2eb2da6.jpg"          #ドンキードリバイ
  when 18
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/2/4/24211f6a.jpg"          #ロイハナチャン
  when 19
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/e/6/e603ddb2.jpg"          #ロイドリバイ
  when 20
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/4/2/42bfaf70.jpg"          #ベビィロゼッタパタテン
  when 21
    img = "http://livedoor.blogimg.jp/ren_yster/imgs/6/8/68d6f521.jpg"          #ベビィロゼッタそらまめ
  else
    img = "Not Found"
  end

  return img
end

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

def members_list()                                                              #メンバーの名簿
  return "ふつきん  1番,     もち            2番,    Lチキ     3番,\nK4I             4番,     Ren             5番,    Naoto    6番,\nDark           7番,     toki             8番,    ゆゆゆ  9番,\nDanny        10番,   えぢから  11番,   Kerus     12番,\nliara            13番,   101              14番,   Kenn     15番,\nののの      16番"
end

def members_mii_image(pic)                                                      #メンバーのMii画像を選出
  case pic.downcase
  when "ふつきん"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/f/3/f3971e65.png"
  when "もち"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/3/e/3e98bc14.png"
  when "lチキ"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/9/7/9725d21f.png"
  when "k4i"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/d/7/d7615e78.png"
  when "ren"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/7/5/757dd521.png"
  when "naoto"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/8/b/8bdaa023.png"
  when "dark"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/b/a/ba0c19e7.png"
  when "toki"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/9/9/999bb09c.png"
  when "ゆゆゆ"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/3/f/3f7e45d2.png"
  when "danny"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/1/e/1ea52cd8.png"
  when "えぢから"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/4/8/484a24e4.png"
  when "kerus"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/1/a/1a6f4367.png"
  when "liara"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/6/4/64a5179a.png"
  when "101"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/2/b/2bddd7f2.jpg"
  when "kenn"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/a/e/ae56cc40.png"
  when "ののの"
    pic = "http://livedoor.blogimg.jp/ren_yster/imgs/b/5/b5c7ca4f.png"
  else
    pic = "Not Found"
  end

  return pic
end

def track_conversion(pls)                                                       #コースの大文字小文字などを修正
  trc, flag = pls.downcase, 0

  case trc
  when "nvkroad"
    id = 501
  when "subarashikosu"
    id = 502
  when "gomipark"
    id = 503
  when "kamiko"
    id = 504
  else
    flag = 1
  end

  if flag == 1 then
    id = track_search(trc)                                                      #コース名に対応するidを抽出
    if id == -1 then
      id = track_search_original(trc)
    end
  end

  case id
  when 1..16 then                                                               #ニトロコースの場合
    if id != 11 then                                                            #Edじゃない場合
      pls = trc.upcase                                                          #大文字に変換
    else                                                                        #Edの場合
      pls = "Ed"
    end
  when 17..48 then                                                              #レトロorDLCコースの場合
    if id != 23 && id != 32 && id != 46 then                                    #rRRy,rRRd,dRiRじゃない場合
      pls = trc.capitalize.swapcase                                             #先頭の文字以外を大文字に変換
    elsif id == 23 then
      pls = "rRRy"
    elsif id == 32 then
      pls = "rRRd"
    elsif id == 46 then
      pls = "dRiR"
    end
  when 101..108 then                                                            #バトルコースの場合
    if (101 <= id && id <= 104) || id == 108 then                               #rWT,rLM,rBC1じゃない場合
      pls = trc.upcase
    else
      pls = trc.capitalize.swapcase
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
  end

  return pls
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

def futsukin_meigen_selection()                                                 #ふつきん名言を抽出
  per = rand(1..100)                                                            #UR2個 - SSR5個 - SR9個 - R18個 - N30個

  if 1 <= per && per <= 50 then                                                 #N 50%
    num = rand(10000..10029)
    point = 5
  elsif 51 <= per && per <= 80 then                                             #R 28%
    num = rand(1000..1017)
    point = 4
  elsif 80 <= per && per <= 94 then                                             #SR 15%
    num = rand(100..108)
    point = 3
  elsif 94 <= per && per <= 99 then                                             #SSR 6%
    num = rand(10..14)
    point = 2
  else                                                                          #UR 1%
    num = rand(0..1)
    point = 1
  end

  case num
  when 0
    saw = "**```css\n[UR] ふつきん『アイコンで全てを決めるな!』```**\nhttp://livedoor.blogimg.jp/ren_yster/imgs/e/b/eb1b820e.jpg"
  when 1
    saw = "**```css\n[UR] ふつきん『チーム戦というのはやっている者同士が楽しめたらそれでいいのよ\n勝ち負けは二の次だと私は思ってる\n今日は負けてしまったけど、その悔しさを次に生かして頑張ろうと思えればそれでいいのよ(オカマ風)』\nhttps://twitter.com/futsukin_mk/status/461145986329370625```**"
  when 10
    saw = "そんなことはないで♪"
  when 11
    saw = "ハングオンがやりづらいのは万国共通!"
  when 12
    saw = "top5!!!!!!!\n〇〇(top5じゃなかった人)さんかなり展開きつそうだったね(ﾆﾔﾆﾔ)"
  when 13
    saw = "「よろしくお願いします」も言わずに「当たれ」はNG\nhttps://twitter.com/HiRy_toki/status/634005340065959937"
  when 14
    saw = "ラインを縫っていくイメージ\nhttp://futsugeorgeoretachi.blog.fc2.com/blog-entry-375.html"
  when 100
    saw = "こんなやつの為に自分が有り金はたいて買ったコントローラーを投げて壊すのは勿体ない"
  when 101
    saw = "(気持ち的な意味で)たまんねぇな～"
  when 102
    saw = "展開が良い人が前をミスしないように走って、悪かった人は落ちたなりに場を作ったりやれる事をすればいいだけの話だと思います\n個人点はあくまで結果しか示しませんから、その過程が大事よ"
  when 103
    saw = "けつがラグいですね～"
  when 104
    saw = "こっちはリングやぞぉ！！！TAが足りねぇんじゃねぇのかぁ！！！？"
  when 105
    saw = "あぁ即投げありがとう(笑)、頭悪いねｗ"
  when 106
    saw = "無いのなら\n\t\t\t\t\s\s開いて見せよう\n\t\t\t\t\t\t\sマリカ模擬"
  when 107
    saw = "アイコン的に一生ネタにされ続けられる運命にあるのかなー"
  when 108
    saw = "フフ～モテるモテるぅ～"
  when 1000
    saw = "名言なんて考えて言うもんじゃないから(ドヤ顔)"
  when 1001
    saw = "ハング嫌いだなー..."
  when 1002
    saw = "バックスパム!"
  when 1003
    saw = "1位で引く赤は美味しいねぇ～"
  when 1004
    saw = "行けるぞ!諦めるな!!男だぞ!!!"
  when 1005
    saw = "ハングオン使い「下位潰しは俺らに任せろ!」"
  when 1006
    saw = "時が経てば人は変わるもの"
  when 1007
    saw = "自分が居なくても大丈夫だお＾。＾"
  when 1008
    saw = "(無意味な)停止赤して「俺活躍してるぜ!!!!!」って思わせておけば良いのよ"
  when 1009
    saw = "Twitter裏垢で嫌だとかラグイとか散々愚痴ってるくせに、そのところにわざわざ来るとかツンデレかよ"
  when 1010
    saw = "自分に手出すのは別に良いが、俺の仲間(だち)に手出したら許さんからな"
  when 1011
    saw = "個人名を挙げるな！！"
  when 1012
    saw = "寝落ちしたら首締め上げるぞ！この野郎！！"
  when 1013
    saw = "Tomsu最近誘ってくれてるのに断ってばかりだから、断ろう"
  when 1014
    saw = "スバラシイコォォォォーーース"
  when 1015
    saw = "自分のトーク力を発揮する時が来たか"
  when 1016
    saw = "今年入って一番泣きました。"
  when 1017
    saw = "右足の小指がががああああああああ！！！"
  when 10000
    saw = "もっと情熱的になれ!!"
  when 10001
    saw = "棘受けは男の宿命"
  when 10002
    saw = "エキサイティングじゃねーよ、コラー(怒)"
  when 10003
    saw = "誰かが倒れた時は誰かがカバー出来ればそれでええんやで"
  when 10004
    saw = "ハンドルのゴーストは参考にならない"
  when 10005
    saw = "首締め上げてやろうか、この野郎!!"
  when 10006
    saw = "ありのままの姿が一番いい!"
  when 10007
    saw = "生半可な気持ちで真似されたら困る、真似るなら徹底的に真似ろ！"
  when 10008
    saw = "覚えていないので大丈夫でしゅよ"
  when 10009
    saw = "昨日の今日で忘れるな"
  when 10010
    saw = "ハングに刺受けさせるな"
  when 10011
    saw = "負けた時に立ち直るのが大事なんだよ"
  when 10012
    saw = "出会いがあれば別れもある"
  when 10013
    saw = "集計ツイ(遂)にあげますね"
  when 10014
    saw = "スリックはゴミ"
  when 10015
    saw = "人はいつ何時も学び成長してゆくもの、その心が大事"
  when 10016
    saw = "Nightは抜かさ「ないと」"
  when 10017
    saw = "最後ぐらい漢にならないと、乙女にはなりたくない"
  when 10018
    saw = "いいよ、いちいち「お疲れ様でした」とか言わなくてよ(怒)"
  when 10019
    saw = "即投げすんな脳無し"
  when 10020
    saw = "おいテメェ個人点意識でやってんじゃねぇよ"
  when 10021
    saw = "即投げする人間には即投げしないとなぁ"
  when 10022
    saw = "無視されたからチーム作ったんだよ！"
  when 10023
    saw = "それこそ名言に入れろよ、コロスゾ"
  when 10024
    saw = "K4Iさん絶対下位(K4I)取らないぞ"
  when 10025
    saw = "ハーゲンダッツのクッキークリームを食べたことないのは人生損してる"
  when 10026
    saw = "殺るぞ"
  when 10027
    saw = "まだまだこれからだぜ～～！！！！！"
  when 10028
    saw = "だーく『そんな日もある。』"
  when 10029
    saw = "お喋りのエンジンかけるわ"
  end

  case point
  when 2
    saw = "**```css\n[SSR] ふつきん『" + saw + "』```**"
  when 3
    saw = "**```ini\n[SR] ふつきん『" + saw + "』```**"
  when 4
    saw = "**```ini\n[R] ふつきん『" + saw + "』```**"
  when 5
    saw = "**```ini\n[N] ふつきん『" + saw + "』```**"
  end

  return saw
end

def syuzo_meigen_selection()                                                    #修造名言を選出
  case rand(1..35)
  when 1
    saw = "何言ってんだよ！！ その崖っぷちが最高のチャンスなんだぜ！！\n自分の全ての力を出し切れるんだから！！！\n崖っぷちありがとう！！ 最高だぁぁぁぁぁぁぁ！！！！"
  when 2
    saw = "諦めんなよ！諦めんなよ、お前！！\nどうしてそこでやめるんだ、そこで！！  もう少し頑張ってみろよ！\nダメダメダメ！諦めたら！\n周りのこと思えよ、応援してる人たちのこと思ってみろって！\nあともうちょっとのところなんだから！\n俺だってこのマイナス10度のところ、しじみがトゥルルって頑張ってんだよ！\nずっとやってみろ！必ず目標を達成できる！\nだからこそNever Give Up！！"
  when 3
    saw = "一番になるっつったよな？ ナンバー1になるっつったよな！？\nまずは、形から入ってみろよ！\n今日からお前は！！一番だ！！！"
  when 4
    saw = "100回叩くと壊れる壁があったとする。\nでもみんな何回叩けば壊れるかわからないから、90回まで来ていても途中であきらめてしまう。"
  when 5
    saw = "本気になれば自分が変わる！ 本気になれば全てが変わる！！"
  when 6
    saw = "過去のことを思っちゃダメだよ。何であんなことしたんだろ・・・って怒りに変わってくるから。\n未来のことも思っちゃダメ。大丈夫かな、あはぁ～ん。\n不安になってくるでしょ？\nならば、一所懸命、一つの所に命を懸ける！\nそうだ！ 今ここを生きていけば、みんなイキイキするぞ！！"
  when 7
    saw = "一番になるっていったよな？ 日本一なるっつったよな！\nぬるま湯なんかつかってんじゃねぇよお前！！\n今日からお前は！富士山だ！！"
  when 8
    saw = "言い訳してるんじゃないですか？ できないこと、無理だって、諦めてるんじゃないですか？\n駄目だ駄目だ！ あきらめちゃだめだ！\nできる！ できる！ 絶対にできるんだから！"
  when 9
    saw = "よく、時間が解決してくれると言うけれど、そうは思わない。\nでも、行動した時間なら解決してくれるはずだ。"
  when 10
    saw = "予想外の人生になっても、そのとき、幸せだったらいいんじゃないかな"
  when 11
    saw = "人の弱点を見つける天才よりも、人を褒める天才がいい"
  when 12
    saw = "褒め言葉よりも苦言に感謝"
  when 13
    saw = "強い心を持つ そのためには 心の根  しっかりした根っこを作り上げることだ\nほら！　見てください　お米の苗\nこれ…見てよ　根っこですよこれ全部\n力強いよね～　台風が来たり　大雨が来たりしても  この根っこがあれば絶対負けないよね\nそうだよ！　お前もこの苗のように強い根っこを持て!　出来るよ！\nお米食べろ！！"
  when 14
    saw = "プレッシャーを感じられることは幸せなことだ"
  when 15
    saw = "人は完璧を求める。\nしかし、完璧だと思った時から全てがやり直しとなる。"
  when 16
    saw = "暑くなければ夏じゃない。熱くなければ人生じゃない！"
  when 17
    saw = "何かを認識してやってみることが「体験」\nその体験を二度三度重ねていくことで「経験」になっていく"
  when 18
    saw = "最初から何でも考えることが出来る人がいる\nでも、僕にはなかなかそれが出来ない\nだとしたら、努力によってつかむしかない"
  when 19
    saw = "もっと熱くなれよ 熱い血燃やしてけよ！\n- 人間熱くなった時が本当の自分に出会えるんだ！！\n- だからこそもっと熱くなれよおぉぉぉぉぉぉぉぉぉぉぉぉぉぉぉぉ！！！！！！"
  when 20
    saw = "眉間に皺を寄せていたところで怪我が早く治るわけでもない\nむしろ、明るく危機を受け止める姿勢にこそ早く治るきっかけがある"
  when 21
    saw = "弱気になったとき まず一ヵ月後の自分を想像してみる\nそれが自分の好きな姿だとしたら、そのために何をするべきかを考える\nそうすれば、少なくともその日までは目的意識を保ち続けることができる"
  when 22
    saw = "気にすんなよ。くよくよすんなよ。\n大丈夫、どうにかなるって。\nDon't worry！ Be happy！"
  when 23
    saw = "ミスをすることは悪いことじゃない\nそれは上達するためには必ず必要なもの\nただし、同じミスはしないこと"
  when 24
    saw = "みんな！！竹になろうよ\n竹ってさあ台風が来てもしなやかじゃない\n台風負けないんだよ 雪が来てもね おもいっきりそれを跳ね除ける！！力強さがあるんだよ\nそう、みんな！！！竹になろう！！！バンブー！！！"
  when 25
    saw = "泥まみれに生きるってかっこ悪いと思ってるんじゃないですか？\n見てくださいよ生き生きしてるよ！！\n自分らしさを感じられるよ！！\n泥んこばんざーーーい！！\nありがとうっ！！"
  when 26
    saw = "綺麗だよね…。輝っいてるよね。\nこの川のように、君の心もピュアだったじゃねーかよ！\nなんだよ…欲ばかり…。嫉妬、悪口　自分のことばっか考えてんじゃねぇか？\nそんなのすべて洗い流しちゃえ！\n変われるよ…。そうすればこの川のように、みんなは君の思いを…飲み込んでくれるさ。\n自然が一番！"
  when 27
    saw = "偶然にもうまく使えたように見えるアイテム。\nしかし、僕にとっては何千回と練習をしたうちの1つだ。"
  when 28
    saw = "勝敗を分けるのはいつでもたった1つのアイテムだ。\nだが、プレーをしているときは、どれがその1つか分からない。"
  when 29
    saw = "一所懸命生きていれば、不思議なことに疲れない。"
  when 30
    saw = "何よりも大切なのは、あなた自身がどうしたいかだ。"
  when 31
    saw = "心の底から好きなことに本気で取り組めるなら、それは幸せ。"
  when 32
    saw = "勝ち負けなんか、ちっぽけなこと。\n大事なことは、本気だったかどうかだ！"
  when 33
    saw = "真剣に考えても、深刻になるな！"
  when 34
    saw = "悔しがればいい、泣けばいい、喜べばいい。\nそれが人間だ！"
  when 35
    saw = "君が次に使うアイテム1つで、壁は打ち破れるかもしれないんだ！"
  end

  saw = "**```diff\n- " + saw + "```**"

  return saw
end

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



BOT.message do |event|                                                          #何かのメッセージが入力されたら実行
  msg = event.message.content
  if msg.start_with?("_") == true then                                          #"_"で始まっている場合
    msg.delete!("_")
    if members_mii_image(msg) != "Not Found" then                               #メンバーの名前が入力された場合
      event.respond(members_mii_image(msg))
    elsif msg.delete("^0-9").to_i <= 4 then                                     #コース名の場合
      id = track_search(msg.downcase)
      if id == -1 then                                                          #英略称からコースが見つからなかった場合
        id = track_search_original(msg.downcase)
      end
      if id != -1 then                                                          #コースが見つかった場合
        $trc[$wi] = event.respond(image_url(id))
      end
    elsif msg.include?(",") == true then                                        #得点計算の場合
      if msg.count(",") == 5 then                                               #1レースの得点計算の場合
        rslt = race_points_calculate(msg.split(","))
        if 21 <= rslt && rslt <= 61 then
          event.respond("#{rslt} - #{82 - rslt}  (差:#{rslt * 2 - 82}点)")
        end
      elsif msg.count(",") == 6 then                                            #複数レースの得点計算の場合
        pts, rslt = msg.split(","), 0
        6.times do |i|
          rslt += pts[i].to_i
        end
        dif = rslt * 2 - 82 * pts[6].to_i                                       #得点差の計算
        event.respond("#{rslt} - #{82 * pts[6].to_i - rslt}  (差:#{dif}点)")
      end
    end
  end
end


BOT.message(from:Futsukin, contains:'戦記事') do |event|                         #ふつきんがブログ更新した時
  event.respond("ブログ更新おつです＾ｑ＾")
  event.message.create_reaction("George:353552599070539777")
end

BOT.message(from:Dark, contains:'mogi') do |event|                              #Darkが模擬が欲しい時
  event.respond("mogimogiiiiiiiiiiiiiiiiiii＾ｑ＾")
end

BOT.message(in:Result) do |event|                                               #for-resultに集計が上がった時
  if event.user.id != Dark then
    BOT.send_message(Clan_wars,"集計おつです＾ｑ＾")
  end
end


BOT.command(:exit) do |event|                                                   #botをシャットダウン
  event.respond("おやすみ～＾ｑ＾")
  BOT.stop
  exit
end


BOT.message(start_with:'_', contains:'custom') do |event|                       #カスタム選出コマンド
  msg = event.message.content.delete("_")
  if msg.start_with?("my") == true then                                         #_mycostomと入力された場合
    event.respond(customize_search(event.user.id))                              #入力者のidを読み込み
  elsif msg.start_with?("random") == true then                                  #_randomcustomと入力された場合
    event.respond(customize_search(rand(1..21)))
  else                                                                          #_custom〇〇と入力された場合
    event.respond(customize_search(msg.delete("^0-9").to_i))                    #英文字を削除し〇〇を抽出
  end
end


BOT.message(start_with:'_', contains:'randomtrack') do |event|                  #コース選出コマンド
  if event.message.content.include?("battle") == true then                      #_randomtrackbattleと入力された場合
    event.respond(image_url(rand(101..108)))
  else                                                                          #_randomtrackと入力された場合
    event.respond(image_url(rand(1..48)))
  end
end


BOT.message(start_with:'_', contains:'meigen') do |event|                       #ふつきん名言選出コマンド
  n = event.message.content.delete("^0-9").to_i
  if event.message.content == "meigenUR" then                                   #_meigenURと入力された場合
    t = 0
    while t >= 0 do                                                             #URの名言を抽出するまでループ
      t, saw = t + 1, futsukin_meigen_selection()
      if saw.include?("[UR]") == true then
        break
      end
    end
    event.respond("#{saw}\nガチャ回数：#{t}回\t課金額：#{t * 300}円")
  elsif n == 0 then                                                             #_meigenと入力された場合
    event.respond(futsukin_meigen_selection())
  else                                                                          #_meigen〇〇と入力された場合
    event.respond("ふつきん名言ガチャ#{n}連! (課金額：#{n * 300}円)")
    0.upto(n - 1) do                                                            #指定回数分の名言を抽出
      event.respond(futsukin_meigen_selection())
    end
    event.respond("Gacha Finished")
  end
end


BOT.command(:helpsyuzo) do |event|                                              #修造名言出力コマンド
  icon, n = Array.new(5), rand(0..2)
  icon[1], icon[2] = "syuzo1:353862198776299521", "syuzo2:353862589249355777"
  icon[3], icon[4] = "syuzo3:353863300032757760", "syuzo4:353863535417229326"
  n.times do
    event.respond(syuzo_meigen_selection()).create_reaction(icon[rand(1..4)])
  end
  event.respond(syuzo_meigen_selection()).create_reaction(icon[rand(1..4)])
end


BOT.command(:warstart) do |event|                                               #交流戦中の既出コース記録コマンド
  event.message.create_reaction("\u{2694}")                                     #剣の絵文字を付ける
  event.respond("選択されたコースの記録を開始するお＾ｑ＾")
  cnt, i, f, k, tmp1, tmp2, tmp3 = 1, 0, 0, 0, [], [], []
  cvr = tmp1[0] = tmp2[0] = tmp3[0] = $trc[0] = slc = ""
  while cnt <= 12 do                                                            #12回コースが記録されるまで
    event.user.await(:put) do |event|                                           #ユーザーからのメッセージ待機
      ins = event.message.content
      if ins == "_warend" then                                                  #_warendと入力された場合
        cnt = 999
        event.respond("記録を中断したお＾ｑ＾")
      elsif ins.start_with?("_") == true && ins != "_helpsyuzo" && f == 0 then  #自チームの指示コースを控える
        slc, f, $wi, k = track_conversion(ins.delete("_")), 1, $wi + 1, k + 1
        case cnt
        when 1
          ew = "st"
        when 2
          ew = "nd"
        when 3
          ew = "rd"
        else
          ew = "th"
        end
        tmp3[k] = event.respond("_**#{cnt}#{ew} Race, Please Select : #{slc}**_")
        tmp3[k - 1].delete
        $trc[$wi - 1].delete
        event.message.delete
        false
      elsif ins.start_with?("+") == true then                                   #"+"で始まっている場合
        cnt, i, pls = cnt + 1, i + 1, track_conversion(ins.delete("+"))         #ループカウント1回プラス
        if pls == slc then                                                      #自チームのコースが来た場合
          cvr += "__**" + pls + "**__\s"                                        #指定文字に太字下線と空白を追加
        else
          cvr += pls + "\s"                                                     #指定文字と空白を追加
        end
        if cvr.include?("__****__") == true then                                #自チームのコースを消去した場合
          cvr.slice!("__****__\s")                                              #"_"と"*"と空白を削除
        elsif cvr.start_with?("\s") == true then                                #先頭の文字が空白の場合
          cvr.slice!("\s")
        else
          cvr = cvr.sub(/\s\s/,"\s")                                            #余分な空白があったら消去
        end
        ctk = cvr.gsub(/\s/,",\s").chop.chop                                    #" "を", "に置き換え語尾2文字削除
        tmp1[i] = event.respond("既出コース(Chosen Track)\n#{ctk}")
#        tid = 300 + track_search(pls.downcase)
#        tmp2[i] = event.respond(image_url(tid))
        event.message.delete                                                    #発言者のメッセージ削除
        tmp1[i - 1].delete                                                      #botの古いメッセージ削除
#        tmp2[i - 1].delete
        slc, f = "", 0
      elsif ins.start_with?("-") == true then                                   #"-"で始まっている場合
        ins.delete!("-").downcase!
        j, flag, mns = 0, 0, cvr.delete("*").delete("_").downcase.split("\s")   #"_*"を消去して小文字に変換し配列化
        while j < cnt do                                                        #指定文字が既に記録されているか確認
          if ins == mns[j] then
            flag = 1
          end
          j += 1
        end
        if flag == 1 then                                                       #記録されていた場合
          cnt, ins = cnt - 1, track_conversion(ins)                             #ループカウント1回マイナス
          cvr.sub!(/#{ins}/,"")                                                 #一覧から指定文字を削除
          event.respond("#{ins}を削除したお＾ｑ＾")
        else
          event.respond("#{ins}は記録されていないお＾ｑ＾")
          false
        end
      end
    end
  end
  if cnt != 999 then                                                            #12回入力し終えた場合
    sleep(1)
    event.respond("記録を終了したお＾ｑ＾").create_reaction("\u{1f396}")          #メダルの絵文字を付ける
  end
end


BOT.command(:racingpicks) do |event|                                            #交流戦結果予想コマンド
  scr, pri = score_forecast(), []
  for i in 0..3 do                                                              #オッズの抽出
    min = 100 * ((i + 1) ** 2)
    pri[i], i = (rand(min..(min + 299)).to_f / 100).round(2), i + 1
  end
  event.respond("今回の交流戦オッズ :racehorse:")
  frc = ["◎\s\s\s本命\t", "〇\s対抗\t", "▲\s単穴\t", "△\s\s連下\t"]
  for j in 0..3 do
    event.respond("#{frc[j]}#{scr[j]} - #{984 - scr[j]}\t#{pri[j]}倍")
  end
end


BOT.message(content:'_keyplayer') do |event|                                    #キープレイヤー選出コマンド[この行変更注意]
  del1 = event.respond("参加者6人の番号を入力してね＾ｑ＾")
  del2 = event.respond(members_list().delete(","))                              #","を消去して名簿出力
  event.user.await(:select) do |event|
    flag, key = 0, event.message.content.split(",")
    6.times do |i|                                                              #不正な入力が無いか確認
      if key[i].to_i < 1 || 16 < key[i].to_i then
        flag = 1
      end
    end
    if flag == 0 then                                                           #入力が正しい場合
      name, n = members_list().split(","), key[rand(0..5)].to_i - 1             #抽選番号と選択番号をリンク
      name[n].chop!.chop!.chop!.strip!                                          #後ろ3文字(〇〇番)と空白を消去
      event.respond("キープレイヤーは「#{name[n]}」")
      event.respond(members_mii_image(name[n]))                                 #キープレイヤーの画像を抽出
      del1.delete                                                               #アナウンスメッセージを削除
      del2.delete                                                               #名簿を削除
    else                                                                        #入力が正しくない場合
      event.respond("入力エラー＾ｑ＾")
      false                                                                     #再度やり直し
    end
  end
end


BOT.voice_state_update do |event|                                               #通話時間計測コマンド
  if event.user.current_bot? == true then                                       #botが入退場した場合
    $line = 5 - $line                                                           #タイマー停止の基準人数を調整
  end
  if BOT.channel(Call).users.size >= $line then                                 #ボイスチャンネルにいる人数取得
    if $fir == 0 then                                                           #2人以上になった場合
      $time, $fir, $key = Time.now, 1, 1                                        #現在の時間取得(計測開始)
    end
  elsif $key == 1 then                                                          #2人以上から1人以下になった場合
    rslt = talk_time_calculate($time,Time.now)                                  #計測終了して通話時間計算
    call = BOT.send_message(Free_talk,"#{rslt[0]}#{rslt[1]}")                   #for-free-talkにメッセージ送信
    if $line == 3 then                                                          #botが入場したままの場合
      BOT.send_message(Music_bot,"!disconnect")                                 #for-music-botにメッセージ送信
    end
    $fir, $key, $time, $line = 0, 0, 0, 2                                       #グローバル変数リセット
    call.create_reaction("\u{1f4a4}")                                           #zzzの絵文字を付ける
    call.create_reaction("\u{1f634}")                                           #寝顔の絵文字を付ける
    call.create_reaction("\u{2b50}")                                            #星の絵文字を付ける
  end
end


BOT.command(:elapsedtime) do |event|                                            #現在の通話時間計測コマンド
  if $time != 0 then
    rslt = talk_time_calculate($time,Time.now)
    event.respond(rslt[0].sub(/fix\n今回/,"現在") + "```**")                     #文章を修正して通話時間送信
  else
    event.respond("通話が始まっていないお＾ｑ＾")
  end
end


BOT.message(content:'_daifugou') do |event|                                     #大富豪開始コマンド
  event.respond("ゲーム参加者の番号を入力してね＾ｑ＾")
  event.respond(members_list().delete(","))
  BOT.add_await(:select,Discordrb::Events::MessageEvent) do |event|
    flag, key = 0, event.message.content.split(",")
    ppl = key.count
    for i in 0..(ppl - 1) do                                                    #対象範囲外の数字が無いか確認
      if key[i].to_i < 1 || 16 < key[i].to_i then
        flag = 1
      else
        for j in (i + 1)..(ppl - 1) do                                          #同じ数字が無いか確認
          if key[i].to_i == key[j].to_i then
            flag = 1
          end
        end
      end
    end
    if flag == 0 then                                                           #入力が正しい場合
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
  if $flag_d != 0 then
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
      if $count != -888 && $pass == 0 && $spe3 == 0 then                        #スペ3以外のカードを出した場合
        eve,flg_ab,spcl,sbr,tmp = special_ability($sent.split(","),flg_ab,spcl,sbr,tmp)
        if eve != "" then
          event.respond("**#{eve}**")
          if $ablty >= 20 then
            $flag_d = 3
            while $dm_msg == "" && $flag_d == 3 do                              #プレイヤーからの応答を待つ
            end
            if $ablty == 20 then                                                #7渡しの場合
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
      if $send_dm[$count % ppl] == "なし" then                                  #手札が全て無くなった場合
        n[$count % ppl], flg_ls, foul = 1, 0, ""
        ($before.count).times do |i|                                            #禁止あがりかどうか確認
          bf[i] = $before[i].chop
          if bf[i] == "8" || bf[i] == "JOKER" then
            flg_ls = 1
          elsif bf[i] == "3" && $kakumei == 1 then
            flg_ls = 1
          elsif bf[i] == "2" && $kakumei == 0 then
            flg_ls = 1
          end
        end
        if flg_ls == 1 then                                                     #反則負けの場合
          winner[rank_ls - 1], msg = $turn, rank_selection(rank_ls,ppl)         #プレイヤー情報を保持
          rank_ls, foul = rank_ls - 1, "反則負けだお＾ｑ＾"
        else                                                                    #あがった場合
          rank_wn += 1
          winner[rank_wn - 1], msg = $turn, rank_selection(rank_wn,ppl)
        end
        event.respond("#{foul}\n#{BOT.user($turn).mention}\s#{msg}")            #プレイヤー宛にアナウンス
      end
      if (ppl - 1) == ($skip + (rank_wn + (ppl - rank_ls))) then                #全員パスした場合
        yama, sbr, $before, $shibari, $skip, $flg_jk = "", "", [], 0, 0, 0      #山札・パスカウント初期化
        if flg_ab == 1 then                                                     #Jバック時の場合
          $kakumei, flg_ab, $joker, spcl = 1 - $kakumei, 0, $joker * -1, tmp
        end
        event.respond("**```全員パスしたので山札を流します```**")
      elsif flg_ab == 2 || $spe3 == 1 then                                      #8切り・スペ3返しの場合
        BOT.user($turn).pm("現在の手札\n#{$send_dm[$count % ppl]}")              #ベット後の手札をDM送信
        if $spe3 == 1 then
          event.respond("スペ3返し！")
        end
        yama, sbr, $before, $count = "", "", [], $count - 1
        $ablty = $shibari = $skip = flg_ab = $spe3 = 0
        if $flg_jk == 1 then
          $kakumei, $flg_jk, $joker, spcl = 1 - $kakumei, 0, $joker * -1, tmp
        end
        event.respond("**```山札を流します```**")
      elsif $pass == 0 then                                                     #カードがベットされた場合
        yama += $sent + "\s→\s"                                                 #山札に追加
        BOT.user($turn).pm("現在の手札\n#{$send_dm[$count % ppl]}")
      end
      if (ppl - 1) == (rank_wn + (ppl - rank_ls)) then                          #勝敗が確定した場合
        $count,$turn = next_player(winner,ppl,$count + 1)
        msg = rank_selection(rank_ls,ppl)
        event.respond("#{BOT.user($turn).mention}\s#{msg}")                     #最後の1人になったプレイヤー宛にアナウンス
        $count, winner[rank_ls] = -1000, $turn
      end
      $count += 1
    end
    if $count == -999 then                                                      #強制終了していない場合
      $flag_d = 0                                                               #ゲーム開始のフラグを降ろす
      ppl.times do |i|                                                          #称号の結果リスト作成
        ppl.times do |j|
          if constant_conversion($plyr[i % ppl].to_i) == winner[j] then
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
  if $flag_d == 2 then
    if event.user.id == $turn then                                              #現在の順番の人の入力の場合
      if str != "pass" then                                                     #パスじゃない場合
        conf, num, ppl = 0, str.split(","), $plyr.count
        cnt, k = num.count, $count % ppl
        card = $send_dm[k].split(",")
        cnt.times do |i|                                                        #所持しているカードかどうか確認
          0.upto(52 / ppl) do |j|
            if card[j] != nil then
              if num[i] == card[j].strip then                                   #手札と出したカードが一致した場合
                conf += 1
              end
            end
          end
        end
        if cnt == conf then                                                     #所持している場合
          if cnt == cards_judgement(num,$before,cnt,$before.count) then         #山札の状況からそのカードを出せる場合
            $send_dm[k] = $send_dm[k].to_s + ",\s"                              #語尾に", "を追加
            cnt.times do |i|
              $send_dm[k].slice!("#{num[i]},\s")                                #手札から出したカードを消去
            end
            if $send_dm[k].split(",").count == 0 then                           #手札が無くなった場合
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
  if $flag_d == 3 then
    if event.user.id == $turn then
      conf, num, ppl = 0, str.split(","), $plyr.count
      cnt, k = num.count, $count % ppl
      card = $send_dm[k].split(",")
      cnt.times do |i|                                                          #所持しているカードかどうか確認
        0.upto(52 / ppl) do |j|
          if card[j] != nil then
            if num[i] == card[j].strip then                                     #手札と出したカードが一致した場合
              conf += 1
            end
          end
        end
      end
      if cnt == conf then                                                       #所持している場合
        x, y = $send_dm[k].split(",").count, $sent.split(",").count
        if y > x then
          cnt = x
        end
        if y == cnt then
          $send_dm[k] = $send_dm[k].to_s + ",\s"
          cnt.times do |i|
            $send_dm[k].slice!("#{num[i]},\s")                                  #手札から出したカードを消去
          end
          if $send_dm[k].split(",").count == 0 then                             #手札が無くなった場合
            $send_dm[k] = "なし"
          else                                                                  #手札が無くなっていない場合
            $send_dm[k].chop!.chop!
          end
          $dm_msg = num
          BOT.send_message(Ageha_bot,"取引が終わったお＾ｑ＾")
        else
          event.respond("枚数が違うお＾ｑ＾")
          if cnt == x then
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
  if $flag_d != 0 then
    $flag_d, $count = 0, -888                                                   #ゲーム開始のフラグを降ろしてループ脱出
    event.respond("ゲームを中止したお＾ｑ＾")
  else
    event.respond("ゲームが始まっていないお＾ｑ＾")
  end
end


BOT.run
