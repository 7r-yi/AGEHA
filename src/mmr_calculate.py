import re
import random
import math
from statistics import mean
from itertools import combinations
from src import lounge_data


def borderrank_introduction(type):
    str = f"{type}v{type}形式で指定チームのボーダー順位を計算するお＾ｑ＾(Cancelで作成中止)\n```"
    if type == 1:
        str += "1. P1 (MMR: xxxx)\n2. P2 (MMR: xxxx)\n3. P3 (MMR: xxxx)\n4. P4 (MMR: xxxx)\n" \
               "5. P5 (MMR: xxxx)\n6. P6 (MMR: xxxx)\n7. P7 (MMR: xxxx)\n8. P8 (MMR: xxxx)\n" \
               "9. P9 (MMR: xxxx)\n10. P10 (MMR: xxxx)\n11. P11 (MMR: xxxx)\n12. P12 (MMR: xxxx)\n"
    elif type == 2:
        str += "Team 1: P1, P2 (MMR: xxxx)\nTeam 2: P3, P4 (MMR: xxxx)\nTeam 3: P5, P6 (MMR: xxxx)\n" \
               "Team 4: P7, P8 (MMR: xxxx)\nTeam 5: P9, P10 (MMR: xxxx)\nTeam 6: P11, P12 (MMR: xxxx)\n"
    elif type == 3:
        str += "Team 1: P1, P2, P3 (MMR: xxxx)\nTeam 2: P4, P5, P6 (MMR: xxxx)\n" \
               "Team 3: P7, P8, P9 (MMR: xxxx)\nTeam 4: P10, P11, P12 (MMR: xxxx)\n"
    elif type == 4:
        str += "Team 1: P1, P2, P3, P4 (MMR: xxxx)\nTeam 2: P5, P6, P7, P8 (MMR: xxxx)\n" \
               "Team 3: P9, P10, P11, P12 (MMR: xxxx)\n"
    elif type == 6:
        str += "Team 1: P1, P2, P3, P4, P5, P6 (MMR: xxxx)\nTeam 2: P7, P8, P9, P10, P11, P12 (MMR: xxxx)\n"
    str += "-----------------------------\nMy Number is [1]```"

    return str


def borderrank_check_input(str, type):
    msg = ""

    try:
        teams = str.split("\n")
        for i in range(12 // type):
            team_mmr = (teams[i])[teams[i].find("(") + 1: teams[i].rfind(")")].strip()
            if "Unknown" not in team_mmr and re.sub(r'[^0-9]', "", team_mmr) == "":
                msg += "MMRが記載されていないかも？＾ｑ＾\n"
        if "--" in str:
            if str.replace("[", "]").count("]") == 2:
                if not 1 <= int(re.sub(r'[^0-9]', "", str.replace("[", "]").split("]")[1])) <= (12 // type):
                    msg += "自チーム番号が間違っているかも？＾ｑ＾\n"
            else:
                msg += "自チーム番号が記載されていないかも？＾ｑ＾([]で閉じる)\n"
        else:
            msg += "-------でチームリストと自チーム記入欄番号を区切ってね＾ｑ＾\n"
    except:
        msg = "何らかの入力エラーが発生したお＾ｑ＾"

    return (msg == ""), msg


def calcMMR_introduction(type):
    str = f"{type}v{type}形式のレース結果から増減MMRを計算するお＾ｑ＾(Cancelで作成中止)\n```"
    if type == 1:
        str += "1. P1 (MMR: xxxx)\n2. P2 (MMR: xxxx)\n3. P3 (MMR: xxxx)\n4. P4 (MMR: xxxx)\n" \
               "5. P5 (MMR: xxxx)\n6. P6 (MMR: xxxx)\n7. P7 (MMR: xxxx)\n8. P8 (MMR: xxxx)\n" \
               "9. P9 (MMR: xxxx)\n10. P10 (MMR: xxxx)\n11. P11 (MMR: xxxx)\n12. P12 (MMR: xxxx)\n" \
               "-----------------------------\n" \
               "1位 [1]\n2位 [2] [上とタイ? → No]\n3位 [3] [上とタイ? → No]\n" \
               "4位 [4] [上とタイ? → No]\n5位 [5] [上とタイ? → No]\n6位 [6] [上とタイ? → No]\n" \
               "7位 [7] [上とタイ? → No]\n8位 [8] [上とタイ? → No]\n9位 [9] [上とタイ? → No]\n" \
               "10位 [10] [上とタイ? → No]\n11位 [11] [上とタイ? → No]\n12位 [12] [上とタイ? → No]```"
    elif type == 2:
        str += "Team 1: P1, P2 (MMR: xxxx)\nTeam 2: P3, P4 (MMR: xxxx)\nTeam 3: P5, P6 (MMR: xxxx)\n" \
               "Team 4: P7, P8 (MMR: xxxx)\nTeam 5: P9, P10 (MMR: xxxx)\nTeam 6: P11, P12 (MMR: xxxx)\n" \
               "-----------------------------\n" \
               "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]\n3位 [Team 3] [上とタイ? → No]\n" \
               "4位 [Team 4] [上とタイ? → No]\n5位 [Team 5] [上とタイ? → No]\n6位 [Team 6] [上とタイ? → No]```"
    elif type == 3:
        str += "Team 1: P1, P2, P3 (MMR: xxxx)\nTeam 2: P4, P5, P6 (MMR: xxxx)\n" \
               "Team 3: P7, P8, P9 (MMR: xxxx)\nTeam 4: P10, P11, P12 (MMR: xxxx)\n" \
               "-----------------------------\n" \
               "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]\n" \
               "3位 [Team 3] [上とタイ? → No]\n4位 [Team 4] [上とタイ? → No]```"
    elif type == 4:
        str += "Team 1: P1, P2, P3, P4 (MMR: xxxx)\nTeam 2: P5, P6, P7, P8 (MMR: xxxx)\n" \
               "Team 3: P9, P10, P11, P12 (MMR: xxxx)\n" \
               "-----------------------------\n" \
               "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]\n3位 [Team 3] [上とタイ? → No]```"
    elif type == 6:
        str += "Team 1: P1, P2, P3, P4, P5, P6 (MMR: xxxx)\nTeam 2: P7, P8, P9, P10, P11, P12 (MMR: xxxx)\n" \
               "-----------------------------\n" \
               "1位 [Team 1]\n2位 [Team 2] [上とタイ? → No]```"

    return str


def calcMMR_check_input(str, type):
    team_num, msg = [], ""

    try:
        if "[" in str:
            loop = [1]
            for i in range(3, 48 // type - 4, 4):
                loop.append(i)
            for i in loop:
                team_num.append(re.sub(r'[^0-9]', "", str.replace("[", "]").split("]")[i]))

        if str.count("[") == 24 // type - 1 and str.count("]") == 24 // type - 1:
            for i in range(5, 48 // type - 2, 4):
                yn = str.replace("[", "]").split("]")[i].lower()
                if not (("yes" in yn) or ("no" in yn)):
                    msg += "タイの欄にYesまたはNoが記述されていないかも？＾ｑ＾\n"
            if "--" in str:
                if type != 1:
                    if len(re.findall(f'Team [1-{12 // type}]:', str)) != 12 // type:
                        msg += f"チーム数が間違っているかも？＾ｑ＾(Team 1～{12 // type}の番号を付ける)\n"
                    for i in range(1, 12 // type + 1):
                        if re.sub(f'Team [1-{12 // type}]:', "--", str).split("--")[i].strip().count(",") != type - 1:
                            msg += "プレイヤー名の数が間違っているかも？＾ｑ＾(カンマで区切る)\n"
                    for i in range(len(team_num)):
                        if not re.match(f'[1-{12 // type}]', team_num[i]):
                            msg += "結果の番号が間違っているかも？＾ｑ＾"
                else:
                    if len(re.findall(r'[1-9]\.|1[0-2]\.', str)) != 12:
                        msg += "プレイヤー数が間違っているかも？＾ｑ＾(1～12.の番号を付ける)\n"
                for i in range(len(team_num)):
                    if not re.match(f'[1-9]|1[0-2]', team_num[i]):
                        msg += "結果の番号が間違っているかも？＾ｑ＾\n"
                for i in range(len(team_num) - 1):
                    for j in range(i + 1, len(team_num)):
                        if team_num[i] == team_num[j]:
                            msg += "結果の番号が重複しているかも？＾ｑ＾\n"
            else:
                msg += "-------でチームリストと結果欄を区切ってね＾ｑ＾\n"
        else:
            msg += "[]で閉じられていない箇所があるかも？＾ｑ＾\n"
    except:
        msg = "何らかの入力エラーが発生したお＾ｑ＾"

    return (msg == ""), msg


def get_playerlist(str, type):
    name, name_list, tie = [], [], []

    teams = str.split("\n")
    if "Room MMR" in teams[0]:
        teams.pop(0)

    if type == 1:
        for i in range(12):
            if "(" in teams[i]:
                name.append((teams[i])[teams[i].find(".") + 1: teams[i].rfind("(")].strip())
            else:
                name.append((teams[i])[teams[i].find(".") + 1:].strip())
    else:
        for i in range(12 // type):
            if "(" in teams[i]:
                name_list.append((teams[i])[teams[i].find(":") + 1: teams[i].rfind("(")].strip())
            else:
                name_list.append((teams[i])[teams[i].find(":") + 1:].strip())
            for j in range(type):
                name.append(name_list[i].split(",")[j].strip())

    for i in range(5, 48 // type - 2, 4):
        if "yes" in str.replace("[", "]").split("]")[i].lower():
            tie.append(1)
        else:
            tie.append(0)

    return ",".join(name), tie


def calculate_MMR(winner, loser, type):
    c = [None, 60, 120, 180, 240, None, 300]
    p = [None, 9500, 5500, 5100, 4800, None, 4650]
    b = [None, 2746.116, 1589.856, 1474.230, 1387.511, None, 1344.151]

    return c[type] / (1 + 11 ** (-(loser - winner - b[type]) / p[type]))


def calculate_MMR_tie(p1, p2, type):
    c = [None, 60, 120, 180, 240, None, 300]
    p = [None, 9500, 5500, 5100, 4800, None, 4650]
    b = [None, 2746.116, 1589.856, 1474.230, 1387.511, None, 1344.151]

    adv = c[type] / (1 + 11 ** (-(abs(p1 - p2) - b[type]) / p[type])) - (c[type] / 3)

    if p1 < p2:
        return adv
    else:
        return -adv


def get_border_rank(str, type):
    team_mmr, no_mmr, unknown_flag = [], [], False
    teams = str.split("\n")
    if "Room MMR" in teams[0]:
        teams.pop(0)
    for i in range(12 // type):
        team_mmr.append((teams[i])[teams[i].find("(") + 1: teams[i].rfind(")")].strip())

    for i in range(12 // type):
        if "Unknown" in team_mmr[i]:
            unknown_flag = True
            team_mmr[i] = 0
            no_mmr.append(i)
        else:
            team_mmr[i] = int(re.sub(r'[^0-9]', "", team_mmr[i]))
    for i in range(12 // type):
        if team_mmr[i] == 0:
            team_mmr[i] = random.randint(max(team_mmr) - 2000, max(team_mmr))

    team_mmr_sub_win, team_mmr_sub_lose = [], []
    num = [i for i in range(len(team_mmr) - 1)]
    confirm_border, psblty_border, down_border = 1, None, 2
    my_team = int(re.sub(r'[^0-9]', "", str.replace("[", "]").split("]")[1]))
    for i in range(len(team_mmr)):  # 対全チームとのMMR増加/減少値をリスト化
        if my_team - 1 != i:
            team_mmr_sub_win.append(calculate_MMR(team_mmr[my_team - 1], team_mmr[i], type))
            team_mmr_sub_lose.append(calculate_MMR(team_mmr[i], team_mmr[my_team - 1], type))
    for i in range(1, 12 // type + 1):
        win_cnt = 0
        for pair in combinations(num, i):
            win, lose = 0, 0
            for j in list(set(num) - set(list(pair))):  # 勝利チームから得る総MMR
                win += team_mmr_sub_win[j]
            for j in list(pair):  # 敗北チームから奪われる総MMR
                lose += team_mmr_sub_lose[j]
            if round(win - lose) > 0:
                win_cnt += 1
        if win_cnt == math.factorial(len(num)) // (math.factorial(len(num) - i) * math.factorial(i)):  # 全パターンでMMR増加
            confirm_border = i + 1
        elif win_cnt >= 1:  # 1パターン以上でMMR増加
            psblty_border = i + 1
        else:  # どんなパターンでもMMR減少
            down_border = i + 1
            break

    msg = f"Team {my_team}は{confirm_border}位以上でMMR増加確定、"
    if psblty_border is not None:
        msg += f"{psblty_border}位は勝利/敗北チーム次第で増加の可能性あり、"
    msg += f"{down_border}位以下は減少確定(タイは考慮しない)\n"
    if unknown_flag:
        msg += "※MMR: Unknown のチームは仮値で計算\n"

    return msg


def get_new_MMR(data, tie, type):
    name, mmr, team_mmr, new_mmr, no_mmr = [], [], [], [], []

    for i in range(0, 23, 2):
        name.append(data[i])
    for i in range(1, 24, 2):
        mmr.append(data[i])
    for i in range(12 // type):
        new_mmr.append(0)

    for i in range(12):
        if mmr[i] == "Not Found":
            mmr[i] = 0
            no_mmr.append(i)
        else:
            mmr[i] = int(mmr[i])
    for i in range(12):
        if mmr[i] == 0:
            mmr[i] = random.randint(max(mmr) - 2000, max(mmr))
    for i in range(0, 12, type):
        team_mmr.append(mean(mmr[i: i + type]))

    for i in range(12 // type):
        tie_flag = 1
        for j in range(12 // type - 1 - i):
            if tie[i + j] == 0 or tie_flag == 0:
                new_mmr[i] += calculate_MMR(team_mmr[i], team_mmr[i + 1 + j], type)
                tie_flag = 0
            elif tie[i + j] == 1 and tie_flag == 1:
                new_mmr[i] += calculate_MMR_tie(team_mmr[i], team_mmr[i + 1 + j], type)

    team_mmr.reverse()
    new_mmr.reverse()
    tie.reverse()

    for i in range(12 // type):
        tie_flag = 1
        for j in range(12 // type - 1 - i):
            if tie[i + j] == 0 or tie_flag == 0:
                new_mmr[i] -= calculate_MMR(team_mmr[i + 1 + j], team_mmr[i], type)
                tie_flag = 0
            elif tie[i + j] == 1 and tie_flag == 1:
                new_mmr[i] -= calculate_MMR_tie(team_mmr[i + 1 + j], team_mmr[i], type)

    team_mmr.reverse()
    new_mmr.reverse()

    msg = "```"
    for i in range(0, 12, type):
        adv = round(new_mmr[i // type])
        if 0 <= adv:
            s = "+"
        else:
            s = ""
        for j in range(type):
            msg += f"{name[i + j]} : MMR {mmr[i + j]} → {mmr[i + j] + adv} ({s}{adv})\n"
        msg += "\n"
    for i in range(len(no_mmr)):
        msg += f"※ {name[no_mmr[i]]} のMMRは取得できなかったので仮値で計算\n"
    msg += "```"

    return msg
