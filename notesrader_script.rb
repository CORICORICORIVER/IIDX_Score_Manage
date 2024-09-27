require 'csv'

# 1 … CSVファイルのパスを設定
csv_file_path = 'db/csv/rader_value.csv'  

# 2 … CSVファイルからデータを読み込み、Hogesテーブルに登録
CSV.foreach(csv_file_path, headers: true) do |row|
  Raderval.create!(
    title: row[0],
    notesval: row['NOTES'],
    chordval: row['CHORD'],
    peakval: row['PEAK'],
    chargeval: row['CHARGE'],
    scratchval: row['SCRATCH'],
    soflanval: row['SOFLAN'],
    maxscore: row['maxscore'],
    l_notesval: row['L_NOTES'],
    l_chordval: row['L_CHORD'],
    l_peakval: row['L_PEAK'],
    l_chargeval: row['L_CHARGE'],
    l_scratchval: row['L_SCRATCH'],
    l_soflanval: row['L_SOFLAN'],
    l_maxscore: row['L_maxscore'],
  )
end

# 3 … ファイル実行後に、処理が成功したという文章を表示させる。
# ここはお好みで。記述しなくても動作はする。
puts 'data imported successfully!'
