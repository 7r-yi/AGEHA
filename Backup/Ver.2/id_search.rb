def id_search(str)
  case str.downcase
  when "mks"
    id = 1
  when "wp","gomipark"
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
  when "rr","nvkroad"
    id = 16
  when "rmmm"
    id = 17
  when "rmc","subarashikosu"
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
  when "rmp","gomipark2"
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
  when "dbp","gomiko","gomipark3"
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
  when "ふつきん"
    id = 401
  when "もち"
    id = 402
  when "lチキ"
    id = 403
  when "k4i"
    id = 404
  when "ren"
    id = 405
  when "naoto"
    id = 406
  when "dark"
    id = 407
  when "toki"
    id = 408
  when "ゆゆゆ"
    id = 409
  when "danny"
    id = 410
  when "えぢから"
    id = 411
  when "kerus"
    id = 412
  when "liara"
    id = 413
  when "101"
    id = 414
  when "kenn"
    id = 415
  when "ののの"
    id = 416
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
  when "mokomoko"
    id = 1006
  when "temee"
    id = 1007
  when "naide"
    id = 1008
  when "nvkimage"
    id = 1009
  when "nvkimage2"
    id = 1010
  else
    id = Bad_Num
  end

  return id
end
