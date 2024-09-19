require 'csv'

# 1 … CSVファイルのパスを設定
csv_file_path = 'db/csv/rader_value.csv'  

# 2 … CSVファイルからデータを読み込み、Hogesテーブルに登録
CSV.foreach(csv_file_path, headers: true) do |row|
  Raderval.create!(
    title: row[0],
    notes: row['NOTES'],
    chord: row['CHORD'],
    peak: row['PEAK'],
    charge: row['CHARGE'],
    scratch: row['SCRATCH'],
    soflan: row['SOFLAN'],
    maxscore: row['maxscore'],
    l_notes: row['L_NOTES'],
    l_chord: row['L_CHORD'],
    l_peak: row['L_PEAK'],
    l_charge: row['L_CHARGE'],
    l_scratch: row['L_SCRATCH'],
    l_soflan: row['L_SOFLAN'],
    l_maxscore: row['L_maxscore'],
  )
end

# 3 … ファイル実行後に、処理が成功したという文章を表示させる。
# ここはお好みで。記述しなくても動作はする。
puts 'data imported successfully!'
