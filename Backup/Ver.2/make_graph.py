import gspread
from oauth2client.service_account import ServiceAccountCredentials
import sys
import matplotlib.pyplot as plt
import pandas as pd
import cv2
import os

scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
credentials = ServiceAccountCredentials.from_json_keyfile_name('SpreadsheetAPI.json', scope)
gc = gspread.authorize(credentials)

sheet = gc.open_by_key('1IPGK_kCgdqSLwcFjzgeLsRW7qV3MLCgcSBABdZHtK4o').worksheet('Player History')

name = sys.argv[1]
if '"' in name:
    name = name[1:-2]
players = sheet.col_values(1)

for i in range(len(players)):
    if name.replace(" ", "").lower() == players[i].replace(" ", "").lower():
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

        adv_count = [0] * 6
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

        df = pd.DataFrame([adv_count], columns=['~-200', '-199~-100', '-99~0', '+1~99', '+100~199', '+200~'])
        plt.subplots()
        plt.title("MMR Gain/Loss Count", fontsize=14)
        plt.axis('off')
        table = plt.table(cellText=df.values, colLabels=df.columns, loc='center',
                          cellLoc='center', colLoc='center', colWidths=[0.2] * 6)
        for j in range(6):
            table[0, j].set_fontsize(12)
        table[0, 0].set_facecolor('#C30606')
        table[0, 1].set_facecolor('#F42121')
        table[0, 2].set_facecolor('#FD8686')
        table[0, 3].set_facecolor('#7AF86F')
        table[0, 4].set_facecolor('#03C511')
        table[0, 5].set_facecolor('#029209')
        table.auto_set_font_size(False)
        for j in range(6):
            table[1, j].set_fontsize(13)
        table.scale(1, 1.8)
        plt.savefig('MMR_history_table2.png')

        img1 = cv2.imread('MMR_history_graph.png')
        img2 = cv2.imread('MMR_history_table.png')
        img3 = cv2.imread('MMR_history_table2.png')
        img2 = img2[200:280, 0:640]
        img3 = img3[210:280, 0:640]
        img = cv2.vconcat([img1, img2])
        img = cv2.vconcat([img, img3])
        cv2.imwrite('MMR_history.png', img[20:, :])

        os.remove('MMR_history_graph.png')
        os.remove('MMR_history_table.png')
        os.remove('MMR_history_table2.png')
        sys.exit()


