import gspread
from oauth2client.service_account import ServiceAccountCredentials
import matplotlib.pyplot as plt
import pandas as pd
import cv2
import numpy as np
import os
import sys
from src import constant

rm_emoji = dict.fromkeys(range(0x10000, sys.maxunicode + 1), '')


def road_spreadsheet(name):
    scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
    credential = {
        "type": 'service_account',
        "project_id": os.environ['PROJECT_ID'],
        "private_key_id": os.environ['PRIVATE_KEY_ID'],
        "private_key": os.environ['PRIVATE_KEY'].replace("\\n", "\n"),
        "client_email": os.environ['CLIENT_EMAIL'],
        "client_id": os.environ['CLIENT_ID'],
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url": os.environ['CLIENT_X509_CERT_URL']
    }
    credentials = ServiceAccountCredentials.from_json_keyfile_dict(credential, scope)
    gc = gspread.authorize(credentials)

    return gc.open_by_key('1GDX4zY3BE2YkU5_Uw2MdtzSagHT9mpaXFPRRZ21Ds4Q').worksheet(name)


def help_input_introduction(str):
    return f"```・1人を検索\n_{str} SeikinTV ○\n_{str} Seikin TV ×\n\n" \
           f"・2人を検索\n_{str} Futsukin SeikinTV ○\n_{str} Futsukin, Seikin TV ○\n_{str} Futsukin Seikin TV ×\n\n" \
           f"※カンマまたは空白でプレイヤーを区切る(併用は不可)\n※特殊文字は修正して入力(ÀGÈHA → AGEHA)```"


def get_lounge_name(name_id):
    if name_id == constant.Futsukin:
        return "Futsukin"
    elif name_id == constant.Mochi:
        return "Mochizy"
    elif name_id == constant.Lchiki:
        return "Eru."
    elif name_id == constant.K4I:
        return "K4I"
    elif name_id == constant.Ren:
        return "7r"
    elif name_id == constant.Naoto:
        return "Naoto"
    elif name_id == constant.Dark:
        return "Dark"
    elif name_id == constant.Toki:
        return "toki"
    elif name_id == constant.Yuyuyu:
        return "yuyuyu"
    elif name_id == constant.Danny:
        return "Danny"
    elif name_id == constant.Ejikara:
        return "Eji"
    elif name_id == constant.Kerus:
        return "Kerus"
    elif name_id == constant.Liara:
        return "riarannu"
    elif name_id == constant.Toi:
        return "101"
    elif name_id == constant.Kenn:
        return "Kenn"
    elif name_id == constant.Nonono:
        return "Ax"
    elif name_id == constant.Syatyou:
        return "tinpo"
    elif name_id == constant.Konkon:
        return "konkon"


def split_name(input):
    name = []

    if input.count(",") > 0:
        name_list = input.split(",")
        for i in range(len(name_list)):
            if name_list[i].translate(rm_emoji) != "":
                name.append(name_list[i].strip())
    else:
        if input.strip().count(" ") != 0:
            name_list = input.split(" ")
            for i in range(len(name_list)):
                if name_list[i].translate(rm_emoji) != "":
                    name.append(name_list[i])
        else:
            name.append(input)

    return name


def get_rank(mmr):
    if mmr < 2000:
        return 'https://cdn.discordapp.com/emojis/731579735544430703.png'  # アイアン
    elif 2000 <= mmr < 3500:
        return 'https://cdn.discordapp.com/emojis/731579759712010320.png'  # ブロンズ
    elif 3500 <= mmr < 5000:
        return 'https://cdn.discordapp.com/emojis/731579781828575243.png'  # シルバー
    elif 5000 <= mmr < 6500:
        return 'https://cdn.discordapp.com/emojis/731579798111125594.png'  # ゴールド
    elif 6500 <= mmr < 8000:
        return 'https://cdn.discordapp.com/emojis/542204444302114826.png'  # プラチナ
    elif 8000 <= mmr < 9500:
        return 'https://cdn.discordapp.com/emojis/731579851802411068.png'  # サファイア
    elif 9500 <= mmr < 11000:
        return 'https://cdn.discordapp.com/emojis/731579813386780722.png'  # ダイヤモンド
    elif 11000 <= mmr < 12500:
        return 'https://cdn.discordapp.com/emojis/731597294914502737.png'  # マスター
    elif 12500 <= mmr:
        return 'https://cdn.discordapp.com/emojis/731579876846338161.png'  # グランドマスター


def get_lounge_MMR(input):
    sheet = road_spreadsheet("Leaderboard")
    name = split_name(input)
    data = sheet.get_all_values()
    user_data = []

    for i in range(len(name)):
        for j in range(len(data)):
            if name[i].replace(" ", "").lower().translate(rm_emoji) == data[j][2].replace(" ", "").lower():
                user_data.append(data[j][2])
                user_data.append(data[j][3])
                break
            elif j == len(data) - 1:
                user_data.append(name[i])
                user_data.append("Not Found")
                break

    return user_data


def get_lounge_stats(input):
    sheet = road_spreadsheet("Leaderboard")
    name = split_name(input)
    data = sheet.get_all_values()
    user_data = []

    for i in range(len(name)):
        for j in range(len(data)):
            if name[i].replace(" ", "").lower().translate(rm_emoji) == data[j][2].replace(" ", "").lower():
                for k in range(1, 11):
                    user_data.append(data[j][k])
                user_data.append(get_rank(int(data[j][3])))
                break
            elif j == len(data) - 1:
                user_data.append(name[i])
                user_data.append("Not Found")
                break

    return user_data


def get_lounge_history(name):
    sheet = road_spreadsheet("Player History")
    players = sheet.col_values(1)

    for i in range(len(players)):
        if name.replace(" ", "").lower().translate(rm_emoji) == players[i].replace(" ", "").lower():
            data = sheet.row_values(i + 1)
            mmr_adv = data[9:]
            mmr_adv_int = []
            mmr = [int(data[8])]

            k = 0
            for j in range(len(mmr_adv)):
                if mmr_adv[j] == "":
                    pass
                else:
                    if (mmr_adv[j])[0] == "+":
                        mmr_adv[j] = int((mmr_adv[j])[1:])
                        mmr_adv_int.append(mmr_adv[j])
                    else:
                        mmr_adv[j] = int(mmr_adv[j])
                        mmr_adv_int.append(mmr_adv[j])
                    mmr.append(mmr[k] + mmr_adv[j])
                    k += 1

            if data[3] == "":
                penalty = 0
            else:
                penalty = -int(data[3])

            adv_count, adv_percent = [0] * 6, []
            for j in range(len(mmr_adv_int)):
                if mmr_adv_int[j] <= -200:
                    adv_count[0] += 1
                elif -199 <= mmr_adv_int[j] <= -100:
                    adv_count[1] += 1
                elif -99 <= mmr_adv_int[j] <= 0:
                    adv_count[2] += 1
                elif 1 <= mmr_adv_int[j] <= 99:
                    adv_count[3] += 1
                elif 100 <= mmr_adv_int[j] <= 199:
                    adv_count[4] += 1
                elif 200 <= mmr_adv_int[j]:
                    adv_count[5] += 1
            for j in range(6):
                adv_percent.append(f"{round((adv_count[j] / len(mmr_adv_int) * 100), 1)}%")

            plt.figure()
            plt.plot(range(len(mmr)), mmr, linewidth=1.8, color='blue', marker=".")
            plt.grid(which='major', color='0.7', linestyle='--')
            plt.title(data[0] + "'s History", fontsize=16)
            plt.xlabel("Events Played", fontsize=12)
            plt.ylabel("MMR (w/o Penalty)", fontsize=12)
            plt.savefig('MMR_history_graph.png')

            df = pd.DataFrame([[data[8], data[6], max(mmr), min(mmr), penalty]],
                              columns=['Base', 'Current', 'Max', 'Min', 'Penalty'])
            plt.subplots()
            plt.axis('off')
            table = plt.table(cellText=df.values, colLabels=df.columns, loc='center',
                              cellLoc='center', colLoc='center', colWidths=[0.18] * 5)
            for j in range(5):
                table[0, j].set_facecolor('#363636')
                table[0, j].set_text_props(color='w')
            table.auto_set_font_size(False)
            table.set_fontsize(13)
            table.scale(1, 1.8)
            plt.savefig('MMR_history_table.png')

            df = pd.DataFrame([adv_count, adv_percent],
                              columns=['~-200', '-199~-100', '-99~0', '+1~99', '+100~199', '+200~'])
            plt.subplots()
            plt.axis('off')
            table = plt.table(cellText=df.values, colLabels=df.columns, loc='center',
                              cellLoc='center', colLoc='center', colWidths=[0.2] * 6)
            for j in range(6):
                table[0, j].set_fontsize(12)
            color = ['#C30606', '#F42121', '#FD8686', '#7AF86F', '#03C511', '#029209']
            for j in range(6):
                table[0, j].set_facecolor(color[j])
            table.auto_set_font_size(False)
            for j in range(6):
                table[1, j].set_fontsize(13)
                table[2, j].set_fontsize(13)
            table.scale(1, 1.8)
            plt.savefig('MMR_history_table2.png')

            cv2.imwrite('white.png', np.ones((480, 20), np.uint8) * 255)
            img_white = cv2.imread('white.png')
            img1 = cv2.imread('MMR_history_graph.png')
            img2 = cv2.imread('MMR_history_table.png')
            img3 = cv2.imread('MMR_history_table2.png')
            img = cv2.hconcat([img_white, img1[:, :-20]])  # img1の左に余白を作って位置を調整
            img = cv2.vconcat([img, img2[200:280, 0:640]])  # img1とimg2を合体
            img = cv2.vconcat([img, img3[190:300, 0:640]])  # img1+2とimg3を合体
            cv2.imwrite('MMR_history.png', img[20:, 15:])
            os.remove('white.png')
            os.remove('MMR_history_graph.png')
            os.remove('MMR_history_table.png')
            os.remove('MMR_history_table2.png')
            break
