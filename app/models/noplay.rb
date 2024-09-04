class Memo < ApplicationRecord
  
  #importメソッド
def self.import(file)
  begin
    #一番上の行をカラムに設定
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
      #find_by→ActiveRecordのメソッド ()の中の条件に一致する最初のレコードをデータベースから検索する。
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      memo = find_by(id: row["id"]) || new    
      #to_hashによって行データをハッシュ（キーと値のペア）に変換
      #slice()によりupdatable_attributesで定義されているカラムだけを抽出

      end
      if soflan_list.include?(row["タイトル"])
        soflan = find_by(id: row["id"]) || new  
        soflan.attributes = row.to_hash.slice(*updatable_attributes)
        soflan.save
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
  ["バージョン","タイトル","ジャンル","プレー回数"]
end
end
