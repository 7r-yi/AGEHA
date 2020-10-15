def image_search(id)                                                               #画像のURLを選出
  if 1 <= id and id <= 48
    pass = 'D:\Ren\Desktop\色々\Data\Discord bot\Race_tracks\track_'
    pass += id.to_s + ".png"

  elsif 101 <= id and id <= 108
    pass = 'D:\Ren\Desktop\色々\Data\Discord bot\Battle_tracks\track_'
    pass += (id - 100).to_s + ".png"

  elsif 201 <= id and id <= 299
    pass = 'D:\Ren\Desktop\色々\Data\Discord bot\NvK_tracks\track_'
    pass += (id - 200).to_s + ".png"

  elsif 301 <= id and id <= 348
    pass = 'D:\Ren\Desktop\色々\Data\Discord bot\Shock_Star_tables\table_'
    pass += (id - 300).to_s + ".jpg"

  elsif 401 <= id and id <= 499
    pass = 'D:\Ren\Desktop\色々\Data\Discord bot\NvK_Mii_images\mii_'
    pass += (id - 400).to_s + ".png"

  elsif 1001 <= id and id <= 1999
    pass = 'D:\Ren\Desktop\色々\Data\Discord bot\Other_images\image_'
    pass += (id - 1000).to_s + ".jpg"
  end

  return pass
end
