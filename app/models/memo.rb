class Memo < ApplicationRecord
  belongs_to :raderval
  #importメソッド
def self.import(file)
  begin
    titles = Raderval.pluck(:title)
    ids = Raderval.pluck(:id)
    #@title = Raderval.find_by(title: row["タイトル"])
    CSV.foreach(file.path, headers: true, liberal_parsing: true) do |row|
      if titles.include?(row["タイトル"])
        index = titles.index(row["タイトル"])
        data = find_by(id: row["id"]) || new  
        data.attributes = row.to_hash.slice(*updatable_attributes)
        data.raderval_id = ids[index]
        data.save
        puts row['column_name']
      end
    end
    
    Memo.joins(:radervals).select("memos.*, radervals.*")
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
  ["raderval_id","タイトル","ジャンル","プレー回数","NOTES"]
end
end

