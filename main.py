import discord
import os
import re
from datetime import datetime
from pytz import timezone
import json
import random
import asyncio.exceptions
from src import constant, id_conversion, lounge_data, mmr_calculate, point_calculate, meigen_list

intents = discord.Intents.default()
intents.members = True
client = discord.Client(intents=intents)


@client.event
async def on_message(ctx):
    def user_check(ctx_wait):
        return ctx.author.id == ctx_wait.author.id

    def ng_check(ctx_wait):
        return not (ctx_wait.author.bot or ctx_wait.content == "")

    if ctx.author.bot or ctx.content == "":  # Botのメッセージと無入力には反応させない
        return

    if ctx.content.lower() in ["_sda", "_shutdownageha"] and ctx.author.id == constant.Ren:
        update = {"call_time": None, "call_user": 0}
        with open('src/call_backup.json', 'w') as file:
            json.dump(update, file, ensure_ascii=False, indent=2)
        await ctx.channel.send("終了するお～＾ｑ＾")
        await client.close()

    if ctx.content.lower() in ["_cmd", "_command", "_help"]:  # コマンド一覧出力
        await ctx.channel.send(constant.command_lineup)
        await ctx.channel.send(constant.image_lineup)

    if ctx.content.startswith("_") and not constant.flag_war_start:  # 何かのメッセージが入力されたら実行
        id = id_conversion.id_search(ctx.content[1:])
        if id != constant.Bad_Num:
            await ctx.channel.send(file=discord.File(id_conversion.image_search(id)))

    if len(ctx.raw_mentions) >= 5 and ctx.channel.id == constant.Clan_war:  # 何かのメッセージが入力されたら実行
        guild = client.get_guild(constant.Free_talk)
        for i in range(5):
            constant.clan_war_user[i + 1] = guild.get_member(ctx.raw_mentions[i]).display_name
        if "vs" in ctx.content:
            constant.enemy_clan = ctx.content.split("vs")[1].split("\n")[0].strip()

    if ctx.author.id == constant.Futsukin and "戦記事" in ctx.content:  # Futsukinがブログを更新した時
        await ctx.channel.send("ブログ更新おつです＾ｑ＾")
        await ctx.add_reaction('George:353552599070539777')

    if ctx.content.split(" ")[0].lower() in ["_it", "_itemtable"]:
        track = ctx.content[ctx.content.find(" ") + 1:]
        try:
            id = id_conversion.id_search(track)
            await ctx.channel.send(file=discord.File(id_conversion.image_search(id + 300)))
        except:
            await ctx.channel.send("コース名を入力してね＾ｑ＾\n>>> **_itemtable X**\nX = コース名英語略称")

    if ctx.content.split(" ")[0].lower() in ["_race"]:
        num = ctx.content[ctx.content.find(" ") + 1:]
        if num.count(",") == 5:  # 1レースの得点計算の場合
            result = point_calculate.race_point_calculate(num.split(","))
            if 21 <= result <= 61:
                await ctx.channel.send(f"{result} - {82 - result}  (差:{result * 2 - 82}点)")
        elif num.count(",") == 6:  # 複数レースの得点計算の場合
            pts, result = num.split(","), 0
            for i in range(6):
                result += int(pts[i])
            dif = result * 2 - 82 * int(pts[6])  # 得点差の計算
            await ctx.channel.send(f"{result} - {82 * int(pts[6]) - result}  (差:{dif}点)")
        else:
            await ctx.channel.send("順位or得点を入力してね＾ｑ＾\n"
                                   ">>> **_race X,X,X,X,X,X,Y**\nX = 順位 or 得点\nY = レース数(得点を入力した場合のみ記述)")

    if ctx.content.split(" ")[0].lower() in ["_mg", "_meigen"]:  # ふつきん名言選出コマンド
        num = ctx.content[ctx.content.find(" ") + 1:]
        if num.upper() == "UR":  # URが当たるまで
            t = 0
            while True:  # URの名言を抽出するまでループ
                t, msg = t + 1, meigen_list.futsukin_meigen()
                if "[UR]" in msg:
                    break
            await ctx.channel.send(f"{msg}\nガチャ回数：{t}回\t課金額：{t * 300}円")
        elif num.isdecimal() and int(num) <= 30:  # 複連ガチャ
            await ctx.channel.send(f"ふつきん名言ガチャ{num}連! (課金額：{int(num) * 300}円)")
            for _ in range(int(num)):
                await ctx.channel.send(meigen_list.futsukin_meigen())
            await ctx.channel.send("Gacha Finished")
        elif num == ctx.content:  # 単発ガチャ
            await ctx.channel.send(meigen_list.futsukin_meigen())
        else:
            await ctx.channel.send("無効な入力だお＾ｑ＾\n>>> **_meigen X**\nX = ガチャ回数(30回以下) or UR(URを取得する場合)")

    if ctx.content.lower() in ["_hs", "_helpsyuzo"]:  # 修造名言選出コマンド
        icon, num = [0] * 4, random.randint(1, 3)
        icon[0], icon[1] = "syuzo1:353862198776299521", "syuzo2:353862589249355777"
        icon[2], icon[3] = "syuzo3:353863300032757760", "syuzo4:353863535417229326"
        for _ in range(num):
            msg = await ctx.channel.send(meigen_list.syuzo_meigen())
            await msg.add_reaction(icon[random.randint(0, 3)])

    if ctx.content.split(" ")[0].lower() in ["_mmr"]:  # プレイヤーのMMRを表示
        name = ctx.content[ctx.content.find(" ") + 1:]
        if name.lower() != "help":
            if " " not in ctx.content.strip():
                name = lounge_data.get_lounge_name(ctx.author.id)
            msg = await ctx.channel.send(f"{name}のMMRを検索するお＾ｑ＾")

            data = lounge_data.get_lounge_MMR(name)
            error_name = ""
            embed = discord.Embed(color=0xFF8000)
            embed.set_author(name='MMR', icon_url='https://i.imgur.com/83G64rX.gif')
            for i in range(0, len(data), 2):
                if data[i + 1] != "Not Found":
                    embed.add_field(name=data[i], value=data[i + 1])
                else:
                    error_name += data[i] + ", "
            await ctx.channel.send(embed=embed)
            if error_name != "":
                await ctx.channel.send(f"{error_name[:-2]}のMMRは見つからなかったお＾ｑ＾\n**※_mmr Helpで入力の仕方を表示**")
            await msg.delete()
        else:
            await ctx.channel.send(lounge_data.help_input_introduction("mmr"))

    if ctx.content.split(" ")[0].lower() in ["_st", "_stats"]:  # プレイヤーのStatsを表示
        name = ctx.content[ctx.content.find(" ") + 1:]
        if name.lower() != "help":
            if " " not in ctx.content.strip():
                name = lounge_data.get_lounge_name(ctx.author.id)
            msg = await ctx.channel.send(f"{name}のStatsを検索するお＾ｑ＾")

            data = lounge_data.get_lounge_stats(name)
            error_name = ""
            for i in range(0, len(data), 11):
                if data[i + 1] != "Not Found":
                    embed = discord.Embed(title=data[i + 1], color=0xFF8000)
                    embed.set_author(name='Stats', icon_url='https://i.imgur.com/83G64rX.gif')
                    embed.set_thumbnail(url=data[i + 10])
                    embed.add_field(name="Rank", value=data[i])
                    embed.add_field(name="MMR", value=data[i + 2])
                    embed.add_field(name="Peak MMR", value=data[i + 3])
                    embed.add_field(name="Win Rate", value=data[i + 4])
                    embed.add_field(name="W-L (Last 10)", value=data[i + 5])
                    embed.add_field(name="Gain/Loss (Last 10)", value=data[i + 6])
                    embed.add_field(name="Events Played", value=data[i + 7])
                    embed.add_field(name="Largest Gain", value=data[i + 8])
                    embed.add_field(name="Largest Loss", value=data[i + 9])
                    await ctx.channel.send(embed=embed)
                else:
                    error_name += data[i] + ", "
            if error_name != "":
                await ctx.channel.send(f"{error_name[:-2]}のStatsは見つからなかったお＾ｑ＾\n**※_stats Helpで入力の仕方を表示**")
            await msg.delete()
        else:
            await ctx.channel.send(lounge_data.help_input_introduction("stats"))

    if ctx.content.split(" ")[0].lower() in ["_ht", "_history"]:  # プレイヤーのHistoryを表示
        name = ctx.content[ctx.content.find(" ") + 1:]
        if name.lower() != "help":
            if " " not in ctx.content.strip():
                name = lounge_data.get_lounge_name(ctx.author.id)
            msg = await ctx.channel.send(f"{name}のHistoryを検索/作成するお＾ｑ＾")

            name = lounge_data.split_name(name)
            error_name = ""
            for i in range(len(name)):
                try:
                    lounge_data.get_lounge_history(name[i])
                    await ctx.channel.send(file=discord.File('MMR_history.png'))
                    os.remove('MMR_history.png')
                except:
                    error_name += name[i] + ", "
            if error_name != "":
                await ctx.channel.send(f"{error_name[:-2]}のHistoryは見つからなかったお＾ｑ＾\n**※_history Helpで入力の仕方を表示**")
            await msg.delete()
        else:
            await ctx.channel.send(lounge_data.help_input_introduction("history"))

    if ctx.content.split(" ")[0].lower() in ["_am", "_avemmr"]:
        await ctx.channel.send("This command has changed. -> `_BorderRank *type`")

    if ctx.content.split(" ")[0].lower() in ["_br", "_borderrank"]:  # ボーダー順位を表示
        type = ctx.content[ctx.content.find(" ") + 1:]
        if re.fullmatch(r'[fF1]', type[0]):
            type = 1
        elif re.fullmatch(r'[2346]', type[0]):
            type = int(type[0])
        else:
            await ctx.channel.send("形式を入力してね＾ｑ＾\n>>> **_BorderRank X**\nX = 1v1 / 2v2 / 3v3 / 4v4 / 6v6")
            return

        msg1 = await ctx.channel.send(mmr_calculate.borderrank_introduction(type))
        while True:
            try:
                input = (await client.wait_for('message', check=user_check, timeout=180.0)).content.replace("`", "")
                check, error = mmr_calculate.borderrank_check_input(input, type)
                if check:
                    await ctx.channel.send(mmr_calculate.get_border_rank(input, type))
                    break
                elif input.lower() == "cancel":
                    await ctx.channel.send("中止したお＾ｑ＾")
                    break
                else:
                    await ctx.channel.send(f"形式が違うお＾ｑ＾\n{error}")
            except asyncio.exceptions.TimeoutError:
                await ctx.channel.send("一定時間入力が無かったのでキャンセルされたお＾ｑ＾")
                break
        await msg1.delete()

    if ctx.content.split(" ")[0].lower() in ["_cm", "_calcmmr"]:  # ラウンジ結果から増減MMRを計算
        type = ctx.content[ctx.content.find(" ") + 1:]
        if re.fullmatch(r'[fF1]', type[0]):
            type = 1
        elif re.fullmatch(r'[2346]', type[0]):
            type = int(type[0])
        else:
            await ctx.channel.send("形式を入力してね＾ｑ＾\n>>> **_calcmmr X**\nX = FFA / 2v2 / 3v3 / 4v4 / 6v6")
            return

        msg1 = await ctx.channel.send(mmr_calculate.calcMMR_introduction(type))
        while True:
            try:
                input = (await client.wait_for('message', check=user_check, timeout=180.0)).content.replace("`", "")
                check, error = mmr_calculate.calcMMR_check_input(input, type)
                if check:
                    msg2 = await ctx.channel.send("MMRを計算中...")
                    player, tie = mmr_calculate.get_playerlist(input, type)
                    data = lounge_data.get_lounge_MMR(player)
                    await ctx.channel.send(mmr_calculate.get_new_MMR(data, tie, type))
                    await msg1.delete()
                    await msg2.delete()
                    break
                elif input.lower() == "cancel":
                    await ctx.channel.send("中止したお＾ｑ＾")
                    await msg1.delete()
                    break
                else:
                    await ctx.channel.send(f"形式が違うお＾ｑ＾\n{error}")
            except asyncio.exceptions.TimeoutError:
                await ctx.channel.send("一定時間入力が無かったのでキャンセルされたお＾ｑ＾")
                break
            except:
                await ctx.channel.send("サーバーとの通信エラーが発生したお＾ｑ＾")
                break

    if ctx.content.split(" ")[0].lower() in ["_ws", "_warstart"] and not constant.flag_war_start:  # 交流戦中の既出コース記録コマンド
        await ctx.add_reaction('⚔')
        await ctx.channel.send("選択されたコースの記録を開始するお＾ｑ＾")
        constant.flag_war_start = True
        time = datetime.now().strftime('%Y/%m/%d')
        cnt, i, j, track, tmp1, tmp2, select = 1, 0, 0, [], [""] * 30, [""] * 30, ""

        while cnt <= 12:  # 12回コースが記録されるまで
            try:
                ins = await client.wait_for('message', check=ng_check, timeout=240.0)
            except asyncio.exceptions.TimeoutError:
                await ctx.channel.send(f"{cnt}レース目のコース指示、入力し忘れてない？＾ｑ＾")
                ins = await client.wait_for('message')
            ins2 = id_conversion.track_conversion(ins.content[1:])
            id, id2 = id_conversion.id_search(ins.content[1:]), id_conversion.id_search(ins2)
            if ins.content in ["_we", "_warend"]:
                await ins.channel.send("記録を中断したお＾ｑ＾")
                constant.flag_war_start = False
                return
            elif ins2 != "Not Found" or ins.content == "change":
                if ins.content.startswith("_"):  # 自チームの指示コースを控える
                    j, file = j + 1, discord.File(id_conversion.image_search(id))
                    tmp2[j] = await ins.channel.send(f"_**Race {cnt}, Please Select : {ins2}**_", file=file)
                    await ins.delete()
                    if j != 1:
                        await tmp2[j - 1].delete()
                    select = ins2
                elif ins.content.startswith("+"):  # "+"で始まっている場合
                    cnt, i, = cnt + 1, i + 1  # ループカウント1回プラス
                    if ins2 == select:  # 自チームのコースが来た場合
                        track.append(f"__**{ins2}**__")  # 指定文字に太字下線と空白を追加
                    else:
                        track.append(ins2)  # 指定文字と空白を追加
                    send_track, file = "", discord.File(id_conversion.image_search(id2 + 300))
                    for k in range(len(track)):
                        send_track += f"{k + 1}:{track[k]}  "
                    tmp1[i] = await ins.channel.send(f"既出コース(Chosen Track)\n{send_track}", file=file)
                    await ins.delete()  # 発言者のメッセージ削除
                    if i != 1:
                        await tmp1[i - 1].delete()  # botの古いメッセージ削除
                    select = ""
                elif ins.content.startswith("-"):  # "-"で始まっている場合
                    for k in reversed(range(len(track))):  # 指定文字が既に記録されているか確認
                        if re.sub('[_*]', "", track[k]) == ins2:
                            cnt -= 1
                            track.pop(k)  # 一覧から指定文字を削除
                            await ins.channel.send(f"{ins2}を削除したお＾ｑ＾")
                            break
                        elif k == 0:
                            await ins.channel.send(f"{ins2}は記録されていないお＾ｑ＾")
                elif ins.content == "change" and track != []:
                    change_track = re.sub('[_*]', "", track[-1])
                    if "**" in track[-1]:
                        track.append(change_track)
                    else:
                        track.append(f"__**{track[-1]}**__")
                    track.pop(-2)
                    await ins.channel.send(f"{cnt - 1}レース目 {change_track} の選択チームを変更したお＾ｑ＾")
                if cnt > 12:
                    await tmp1[i].delete(delay=240.0)
                    await tmp2[j].delete()
                    temp_name, temp_track, temp_num = "", "", ""
                    for i in range(6):
                        temp_name += f"{constant.clan_war_user[i]}, "
                    for i in range(len(track)):
                        temp_track += f"{re.sub('[_*]', '', track[i])}, "
                        if "__" in track[i]:
                            temp_num += f"{i + 1}, "
                    await ins.channel.send("記録を終了したお＾ｑ＾\n集計表作成テンプレート```"
                                           f"自チームのメンバー [{temp_name[:-2]}]\n自チームの各得点 [, , , , , ]\n\n"
                                           f"敵チーム名 [{constant.enemy_clan}]\n対戦回数 []\n"
                                           f"敵チームのメンバー [, , , , , ]\n敵チームの各得点 [, , , , , ]\n\n"
                                           f"コース名 [{temp_track[:-2]}]\n自チームの選択コース [{temp_num[:-2]}]\n\n"
                                           f"日付 [{time}]```")
                    constant.flag_war_start = False
                    constant.clan_war_user = ["ふつきん", "", "", "", "", ""]
                    constant.enemy_clan = ""
            elif len(ins.content) >= 1:
                if ins.content[0] in ["_", "+", "-"] and ins.content.split(" ")[0].lower() not in constant.commands:
                    await ins.channel.send("それはコース名じゃないお＾ｑ＾")

    if ctx.content.split(" ")[0].lower() in ["_et", "_elapsedtime"]:  # 現在の通話時間を表示
        if constant.call_time:
            bt, at = constant.call_time[0], datetime.now(timezone('UTC')).astimezone(timezone('Asia/Tokyo'))
            td = round((at - bt).total_seconds())
            await ctx.channel.send(f"**```\n現在の通話時間：{td // 3600}時間{td % 3600 // 60}分{td % 3600 % 60}秒\n"
                                   f"(通話開始時刻：{bt.strftime('%Y/%m/%d %H:%M:%S')})```**")
        else:
            await ctx.channel.send("通話が始まっていないお＾ｑ＾")

    if ctx.content.split(" ")[0].lower() in ["_callreset"]:  # 通話データをリセット
        constant.call_user, constant.call_time = 0, []
        reset = {"call_time": None, "call_user": 0}
        with open('src/call_backup.json', 'w') as file:
            json.dump(reset, file, ensure_ascii=False, indent=2)
        await ctx.channel.send("通話データをリセットしたお＾ｑ＾")


@client.event
async def on_voice_state_update(_, before, after):
    if before.channel is None and after.channel is not None:
        constant.call_user += 1
    elif before.channel is not None and after.channel is None:
        constant.call_user -= 1

    if constant.call_user >= 2:
        constant.call_time.append(datetime.now(timezone('UTC')).astimezone(timezone('Asia/Tokyo')))
        update = {"call_time": constant.call_time[0].strftime('%Y-%m-%d %H:%M:%S.%f'), "call_user": constant.call_user}
        with open('src/call_backup.json', 'w') as file:
            json.dump(update, file, ensure_ascii=False, indent=2)
    elif constant.call_user <= 1 and constant.call_time:  # 2人以上から1人以下になった場合
        bt, at = constant.call_time[0], datetime.now(timezone('UTC')).astimezone(timezone('Asia/Tokyo'))
        td = round((at - bt).total_seconds())
        msg = f"**```fix\n今回の通話時間：{td // 3600}時間{td % 3600 // 60}分{td % 3600 % 60}秒\n" \
              f"(通話開始時刻：{bt.strftime('%Y/%m/%d %H:%M:%S')})\n" \
              f"(通話終了時刻：{at.strftime('%Y/%m/%d %H:%M:%S')})```**"
        await client.get_channel(constant.Hearing_only).send(msg)
        constant.call_time = []
        reset = {"call_time": None, "call_user": 0}
        with open('src/call_backup.json', 'w') as file:
            json.dump(reset, file, ensure_ascii=False, indent=2)


client.run(os.environ['TOKEN'])
