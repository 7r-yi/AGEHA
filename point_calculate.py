def race_point_calculate(pts):  # 1レースの得点を計算
    result, flag = 0, 0

    for i in range(6):
        if int(pts[i]) == 1:  # 1位の場合
            result += 15
        elif int(pts[i]) == 2:  # 2位の場合
            result += 12
        elif 12 >= int(pts[i]) >= 3:  # 3~12位の場合
            result += 13 - int(pts[i])
        else:
            flag = 1

    if flag == 1:  # 1~12位の以外の番号が入力された場合
        result = -1

    return result
