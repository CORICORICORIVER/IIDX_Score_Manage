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
          data.exscore = row["ANOTHER スコア"]
          data.title = row["タイトル"]
          data.raderval_id = ids[index]
          data.difficulty = "A"
          data.user_id = user
          data.exscore = row["ANOTHER スコア"].to_i 
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a1[index])
          data.notes = (aaa * 100).floor / 100.0
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a2[index])
          data.chord = (aaa * 100).floor / 100.0
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a3[index])
          data.peak = (aaa * 100).floor / 100.0
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a4[index])
          data.charge = (aaa * 100).floor / 100.0
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a5[index])
          data.scratch = (aaa * 100).floor / 100.0
          aaa =  (Float(row["ANOTHER スコア"]) / Float(maxscores[index])) * Float(a6[index])
          data.soflan = (aaa * 100).floor / 100.0
          data.notes_growth_rate   = Float(1 / Float(maxscores[index]) * Float(a1[index]))
          data.chord_growth_rate   = Float(1 / Float(maxscores[index]) * Float(a2[index]))
          data.peak_growth_rate    = Float(1 / Float(maxscores[index]) * Float(a3[index]))
          data.charge_growth_rate  = Float(1 / Float(maxscores[index]) * Float(a4[index]))
          data.scratch_growth_rate = Float(1 / Float(maxscores[index]) * Float(a5[index]))
          data.soflan_growth_rate  = Float(1 / Float(maxscores[index]) * Float(a6[index]))
          data.save
        end
        if row["LEGGENDARIA スコア"]  != "0" 
          data = find_by(title: row["タイトル"]) || new   
          data.exscore = row["LEGGENDARIA スコア"]
          data.title = row["タイトル"]
          data.raderval_id = ids[index]
          data.difficulty = "L"
          data.user_id = user
          data.exscore = row["LEGGENDARIA スコア"].to_i 
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l1[index])
          data.notes = (aaa * 100).floor / 100.0
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l2[index])
          data.chord = (aaa * 100).floor / 100.0
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l3[index])
          data.peak = (aaa * 100).floor / 100.0
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l4[index])
          data.charge = (aaa * 100).floor / 100.0
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l5[index])
          data.scratch = (aaa * 100).floor / 100.0
          aaa =  (Float(row["LEGGENDARIA スコア"]) / Float(l_maxscores[index])) * Float(l6[index])
          data.soflan = (aaa * 100).floor / 100.0
          data.notes_growth_rate   = Float(1 / Float(maxscores[index]) * Float(a1[index]))
          data.chord_growth_rate   = Float(1 / Float(maxscores[index]) * Float(a2[index]))
          data.peak_growth_rate    = Float(1 / Float(maxscores[index]) * Float(a3[index]))
          data.charge_growth_rate  = Float(1 / Float(maxscores[index]) * Float(a4[index]))
          data.scratch_growth_rate = Float(1 / Float(maxscores[index]) * Float(a5[index]))
          data.soflan_growth_rate  = Float(1 / Float(maxscores[index]) * Float(a6[index]))
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

