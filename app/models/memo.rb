class Memo < ApplicationRecord
  belongs_to :raderval
  #importメソッド
def self.import(file)
  begin
    titles = Raderval.pluck(:title)
    ids = Raderval.pluck(:id)
    maxscores = Raderval.pluck(:maxscore)
    v1 = Raderval.pluck(:NOTES)
    v2 = Raderval.pluck(:CHORD)
    v3 = Raderval.pluck(:PEAK)
    v4 = Raderval.pluck(:CHARGE)
    v5 = Raderval.pluck(:SCRATCH)
    v6 = Raderval.pluck(:SOFLAN)
    #@title = Raderval.find_by(title: row["タイトル"])
    CSV.foreach(file.path, headers: true, liberal_parsing: true) do |row|
      if titles.include?(row["タイトル"])
        index = titles.index(row["タイトル"])
        data = find_by(id: row["id"]) || new  
        data.attributes = row.to_hash.slice(*updatable_attributes)
        data.raderval_id = ids[index]
        if maxscores[index] != 0
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(v1[index])
          data.A_NOTES = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(v2[index])
          data.A_CHORD = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(v3[index])
          data.A_PEAK = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(v4[index])
          data.A_CHARGE = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(v5[index])
          data.A_SCRATCH = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(v6[index])
          data.A_SOFLAN = aaa.round(2)
        end
        data.save
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
  ["raderval_id","タイトル","ジャンル","プレー回数"]
end
end

