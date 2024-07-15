class Memo < ApplicationRecord
  
  #importメソッド
def self.import(file)
  #一番上の行をカラムに設定
  CSV.foreach(file.path, headers: true) do |row|
    #find_by→ActiveRecordのメソッド ()の中の条件に一致する最初のレコードをデータベースから検索する。
    # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
    memo = find_by(id: row["id"]) || new
    #CSVからデータを取得し、設定する
    #to_hashによって行データをハッシュ（キーと値のペア）に変換
    #slice()によりupdatable_attributesで定義されているカラムだけを抽出
    memo.attributes = row.to_hash.slice(*updatable_attributes)
    memo.save
  end
end

# 更新を許可するカラムを定義
def self.updatable_attributes
  ["バージョン","タイトル","ジャンル","プレー回数"]
end
end
