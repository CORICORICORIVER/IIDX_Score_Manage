class Memo < ApplicationRecord
  belongs_to :raderval
  #importメソッド
def self.import(file)
  begin
    titles = Raderval.pluck(:title)
    ids = Raderval.pluck(:id)
    maxscores = Raderval.pluck(:maxscore)
    a1 = Raderval.pluck(:notes)
    a2 = Raderval.pluck(:chord)
    a3 = Raderval.pluck(:peak)
    a4 = Raderval.pluck(:charge)
    a5 = Raderval.pluck(:scratch)
    a6 = Raderval.pluck(:soflan)
    l_maxscores = Raderval.pluck(:l_maxscore)
    l1 = Raderval.pluck(:l_notes)
    l2 = Raderval.pluck(:l_chord)
    l3 = Raderval.pluck(:l_peak)
    l4 = Raderval.pluck(:l_charge)
    l5 = Raderval.pluck(:l_scratch)
    l6 = Raderval.pluck(:l_soflan)
    #@title = Raderval.find_by(title: row["タイトル"])
    CSV.foreach(file.path, headers: true, liberal_parsing: true) do |row|
      if titles.include?(row["タイトル"])
        index = titles.index(row["タイトル"])
        if row["ANOTHER スコア"]  != "0" 
          data = find_by(タイトル: row["タイトル"]) || new  
          data.attributes = row.to_hash.slice(*updatable_attributes)
          data.raderval_id = ids[index]
          data.Difficulty = "A"
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a1[index])
          data.NOTES = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a2[index])
          data.CHORD = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a3[index])
          data.PEAK = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a4[index])
          data.CHARGE = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a5[index])
          data.SCRATCH = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a6[index])
          data.SOFLAN = aaa.round(2)
          data.save
        end
        if row["LEGGENDARIA スコア"]  != "0" 
          data = find_by(タイトル: row["タイトル"]) || new   
          data.attributes = row.to_hash.slice(*updatable_attributes)
          data.raderval_id = ids[index]
          data.Difficulty = "L"
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l1[index])
          data.NOTES = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l2[index])
          data.CHORD = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l3[index])
          data.PEAK = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l4[index])
          data.CHARGE = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l5[index])
          data.SCRATCH = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l6[index])
          data.SOFLAN = aaa.round(2)
          data.save
        end

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
  ["タイトル",]
end
end

