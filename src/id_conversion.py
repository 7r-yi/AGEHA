from src.constant import Bad_Num


def id_search(str):
    id = {"mks": 1, "wp": 2, "ssc": 3, "tr": 4, "mc": 5, "th": 6, "tm": 7, "sgf": 8, "sa": 9, "ds": 10,
          "ed": 11, "mw": 12, "cc": 13, "bdd": 14, "bc": 15, "rr": 16,
          "rmmm": 17, "rmc": 18, "rccb": 19, "rtt": 20, "rddd": 21, "rdp3": 22, "rrry": 23, "rdkj": 24, "rws": 25,
          "rsl": 26, "rmp": 27, "ryv": 28, "rttc": 29, "rpps": 30, "rgv": 31, "rrrd": 32,
          "dyc": 33, "dea": 34, "ddd": 35, "dmc": 36, "dwgm": 37, "drr": 38, "diio": 39, "dhc": 40, "dbp": 41,
          "dcl": 42, "dww": 43, "dac": 44, "dnbc": 45, "drir": 46, "dsbs": 47, "dbb": 48,
          "bpp": 49, "btc": 50, "bcma": 51, "bcmo": 52, "btb": 53, "bsr": 54, "bsg": 55, "bnh": 56,
          "bs": 101, "ssk": 102, "dp": 103, "lc": 104, "rwt": 105, "rlm": 106, "rbc1": 107, "uu": 108,
          "futsukinroad": 201, "fr": 201, "mountmochi": 202, "mm": 202, "lchikicircuit": 203, "dlc": 203,
          "k4iharbor": 204, "kh": 204, "renpark": 205, "rrp": 205, "naotoshoals": 206, "ns": 206,
          "jorisvolcano": 207, "rjv": 207, "tokistadium": 208, "rts": 208, "yuyuyudunes": 209, "yd": 209,
          "dannycruise": 210, "dc": 210, "ejisturnpike": 211, "ret": 211, "neokeruscity": 212, "dnkc": 212,
          "futsukin": 401, "mochi": 402, "lchiki": 403, "k4i": 404, "101": 405, "riara": 406, "ren": 407, "naoto": 408,
          "futami": 409, "ageha": 410, "dark": 411, "toki": 412, "yuyuyu": 413, "danny": 414, "ejikara": 415,
          "kerus": 416, "kenn": 417, "nonono": 418, "lily": 419, "syatyou": 420, "konkon": 421,
          "nvkroad": 516, "subarashikosu": 518, "gomipark1": 502, "gomipark2": 527, "gomipark3": 541, "gomiko": 541,
          "nvktheme1": 1001, "nvktheme2": 1002, "teamnvk1": 1003, "teamnvk2": 1004, "george": 1005, "joris": 1006,
          "futoopa": 1007, "mogi": 1008, "neochi": 1009, "mokomoko": 1010, "temee": 1011, "naide": 1012,
          "futsufamily": 1013, "teamnvk3": 1014, "futamigahaku": 1015, "isogasui": 1016, "hentaiageha": 1017,
          "korosuzo": 1018, "u-n-chi": 1019}

    return id.get(str.lower(), Bad_Num)


def image_search(id):
    if 1 <= id <= 56:
        return f'./Race_tracks/track_{id}.png'
    elif 101 <= id <= 108:
        return f'./Battle_tracks/track_{id - 100}.png'
    elif 201 <= id <= 299:
        return f'./NvK_tracks/track_{id - 200}.png'
    elif 301 <= id <= 348:
        return f'./Shock_Star_tables/table_{id - 300}.jpg'
    elif 401 <= id <= 499:
        return f'./NvK_Mii_images/mii_{id - 400}.png'
    elif 501 <= id <= 599:
        return f'./Race_tracks/track_{id - 500}.png'
    elif 1001 <= id <= 1999:
        return f'./Other_images/image_{id - 1000}.jpg'


def track_conversion(pls):  # コースの大文字小文字などを修正
    track_name, flag = pls.lower(), 0
    id = id_search(track_name)  # コース名に対応するidを抽出

    if 1 <= id <= 16:  # ニトロコースの場合
        if id != 11:  # Edじゃない場合
            return track_name.upper()  # 大文字に変換
        else:  # Edの場合
            return "Ed"
    elif 17 <= id <= 56:  # レトロorDLCコースの場合
        if id != 23 and id != 32 and id != 46 and id != 52:  # rRRy,rRRd,dRiR,dCoMじゃない場合
            return track_name.capitalize().swapcase()  # 先頭の文字以外を大文字に変換
        elif id == 23:
            return "rRRy"
        elif id == 32:
            return "rRRd"
        elif id == 46:
            return "dRiR"
        elif id == 51:
            return "bCMa"
        elif id == 52:
            return "bCMo"
    elif 101 <= id <= 108:  # バトルコースの場合
        if (101 <= id <= 104) or id == 108:  # rWT,rLM,rBC1じゃない場合
            return track_name.upper()
        else:
            return track_name.capitalize().swapcase()
    elif id == 201:  # オリジナルネーム
        return "RR"
    elif id == 202:
        return "BC"
    elif id == 203:
        return "dHC"
    elif id == 204:
        return "TH"
    elif id == 205:
        return "rMP"
    elif id == 206:
        return "DS"
    elif id == 207:
        return "rGV"
    elif id == 208:
        return "rWS"
    elif id == 209:
        return "BDD"
    elif id == 210:
        return "CC"
    elif id == 211:
        return "rTT"
    elif id == 212:
        return "dNBC"
    elif id == 502:
        return "WP"
    elif id == 516:
        return "RR"
    elif id == 518:
        return "rMC"
    elif id == 527:
        return "rMP"
    elif id == 541:
        return "dBP"
    else:
        return "Not Found"
