class Memo < ApplicationRecord
  
  #importメソッド
def self.import(file)
  begin
    CSV.foreach(file.path, headers: true, liberal_parsing: true) do |row|
      CSV.open(db/seeds/csv/content.csv, 'r', headers: true) do |csv|
        csv.each do |row|
          if scratch_list.include?(row["タイトル"])
            scratch = find_by(id: row["id"]) || new  
            scratch.attributes = row.to_hash.slice(*updatable_attributes)
            scratch.save
          puts row['column_name']
        end
      end
  rescue CSV::MalformedCSVError => e
    Rails.logger.error "CSV ファイルの形式が不正です: #{e.message}"
    # エラー処理: 例) エラー内容を通知するなど
    false
  rescue StandardError => e
    Rails.logger.error "予期しないエラーが発生しました: #{e.message}"
    # エラー処理: 例) エラー内容を通知するなど
    false
  end
end

# 更新を許可するカラムを定義
def self.updatable_attributes
  ["バージョン","title","ジャンル","プレー回数","NOTES","CHORD","PEAK","CHARGE","SCRATCH","SOFLAN"]
end
end


#scratch_list = [
      'Spin the disc',
      'サヨナラ・ヘヴン',
      'Close my Eyes for Me',
      'Driver',
      'route 80s',
      'Somebody Like You',
      '250bpm',
      '5.1.1.',
      'bass 2 bass',
      'Buffalo',
      'Catch Me',
      'Do Back Burn',
      'Feedback',
      'HEARTACHE',
      'Hella Deep',
      'Midnight Drive',
      'NO LIMIT -オレ達に限界は無い-',
      'Non Stop Rock',
      'Really Love',
      'rottel-da-sun',
      'Shamshir',
      'SPEED DEMON',
      'SWEET LAB',
      'Tripping Jumping',
      'WAR GAME',
      'オレはビートマニア！お前は何マニア？',
      '俺ら東京さ行ぐだ',
      '灼熱Beach Side Bunny (Masayoshi Iimori Remix)',
      '廿',
      '27th style',
      'Beat Juggling Mix',
      'Bounce Bounce Bounce',
      'CHECKING YOU OUT',
      'CODE:0',
      'Digitank System',
      'EXODUS SIGN',
      'Halfway of promise',
      'Hydrogen Blueback',
      "IDC feat.REVERBEE (Mo'Cuts Ver)",
      'Just a Little Smile',
      'MAD ATTACK',
      "naughty girl@Queen's Palace",
      'Overload Frontier',
      'rough percussionythm',
      'Routing',
      'SAMURAI-Scramble',
      'Swarm Of Scarabs',
      'SWEETEST SAVAGE',
      'Uh-Oh',
      'VOLCANIC BIGBEAT',
      'Wonder Bullfighter',
      'カジノファイヤーことみちゃん',
      'とろぴかる倶楽部',
      'ベィスドロップ・フリークス',
      'ラクエン',
      '花冠 feat.Aikapin',
      '199024club -Re:BounceKiller-',
      'Be quiet',
      'BLACK.by X-Cross Fade',
      'BLUE MIRAGE',
      'Caterpillar',
      "Don't believe the hype",
      'Double Dribble',
      'GAME ON',
      'Level 2',
      'Level 3',
      'Level 4',
      'Level One',
      'Lords Of The Roundtable',
      'Miracle 5ympho X',
      'Peaktime Booster',
      'Plan 8',
      'Purple Perplex',
      'RAGE feat.H14 of LEONAIR',
      'Red. by Full Metal Jacket',
      'Red. by Jack Trance',
      'SAMURAI-Scramble',
      'SAY BAY',
      'SCREW // owo // SCREW',
      'Skreaming for Salvation',
      'Snake Stick',
      'The Chase',
      'Watch Out Pt.2',
      'WHA',
      'Xperanza',
      'バッド・スイーツ、バッド・ドリーム',
      '灼熱 Pt.2 Long Train Running',
      '灼熱Beach Side Bunny',
      '雪上断火',
      '火影',
#]
#scratch_list.append("灼熱Beach Side Bunny (かめりあ's \"Summertime D'n'B\" Remix)")
#soflan_list=[
      'empathy',
      'Voltage (feat. Hidemaru)',
      '2hot2eat',
      'era (nostalmix)',
      'era (step mix)',
      'mind the gap',
      'Agnus Dei',
      'fun',
      'GRADIUS -FULL SPEED-',
      'op.31 叙情',
      'PARANOIA survivor MAX',
      'Surf on the Light',
      '罪過の聖堂',
      '(This Is Not) The Angels',
      'Ah Hah Yeah',
      'D',
      'four pieces of heaven',
      'FUTURE is Dead',
      'Linus',
      'nostos',
      'Onyx',
      'SABER WING',
      'Theory',
      'ガヴリールドロップキック',
      'Concertino in Blue',
      'DAY DREAM',
      'DropZ-Line-',
      'Fascination MAXX',
      'Glitch N Ride',
      'ICARUS',
      'JOMANDA',
      'n/a',
      'New Castle Legions',
      'PARANOiA ～HADES～',
      'POSSESSION',
      'ruin of opals',
      'Silver Bullet',
      'VØID',
      'Y&Co. is dead or alive',
      'ピアノ協奏曲第１番”蠍火”',
      'ピアノ独奏無言歌 "灰燼"',
      'ワルツ第17番 ト短調”大犬のワルツ”',
      '音楽',
      '桜',
      '聖人の塔',
      '冥',
      '恋愛＝精度×認識力'
    ]