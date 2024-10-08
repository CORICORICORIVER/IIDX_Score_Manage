class Memo < ApplicationRecord
  belongs_to :raderval
  #importメソッド
def self.import(file, resource)
  begin
    #user = @current_user.id
    user = resource
    titles = Raderval.pluck(:title)
    ids = Raderval.pluck(:id)
    maxscores = Raderval.pluck(:maxscore)
    a1 = Raderval.pluck(:notesval)
    a2 = Raderval.pluck(:chordval)
    a3 = Raderval.pluck(:peakval)
    a4 = Raderval.pluck(:chargeval)
    a5 = Raderval.pluck(:scratchval)
    a6 = Raderval.pluck(:soflanval)
    l_maxscores = Raderval.pluck(:l_maxscore)
    l1 = Raderval.pluck(:l_notesval)
    l2 = Raderval.pluck(:l_chordval)
    l3 = Raderval.pluck(:l_peakval)
    l4 = Raderval.pluck(:l_chargeval)
    l5 = Raderval.pluck(:l_scratchval)
    l6 = Raderval.pluck(:l_soflanval)
    #@title = Raderval.find_by(title: row["タイトル"])
    CSV.foreach(file.path, headers: true, liberal_parsing: true) do |row|
      if titles.include?(row["タイトル"])
        index = titles.index(row["タイトル"])
        if row["ANOTHER スコア"]  != "0" 
          data = find_by(title: row["タイトル"]) || new  
          data.title = row["タイトル"]
          data.raderval_id = ids[index]
          data.difficulty = "A"
          data.user_id = user
          data.exscore = row["ANOTHER スコア"].to_i 
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a1[index])
          data.notes = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a2[index])
          data.chord = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a3[index])
          data.peak = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a4[index])
          data.charge = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a5[index])
          data.scratch = aaa.round(2)
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a6[index])
          data.soflan = aaa.round(2)
          data.save
        end
        if row["LEGGENDARIA スコア"]  != "0" 
          data = find_by(title: row["タイトル"]) || new   
          data.title = row["タイトル"]
          data.raderval_id = ids[index]
          data.difficulty = "L"
          data.user_id = user
          data.exscore = row["LEGGENDARIA スコア"].to_i 
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l1[index])
          data.notes = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l2[index])
          data.chord = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l3[index])
          data.peak = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l4[index])
          data.charge = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l5[index])
          data.scratch = aaa.round(2)
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l6[index])
          data.soflan = aaa.round(2)
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
  ["title",]
end
end

