class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         #認証のキーをusernameに設定
         authentication_keys: [:username]
  
  #usernameの重複を許さない
  validates_uniqueness_of :username
  #usernameの空白を許さない
  validates_presence_of :username
   
  #ユーザーの認証条件に基づいて最初のユーザーを見つける関数
  #warden_conditions→devise上でuserを認証するのに必要な条件を含むハッシュ
  def self.find_first_by_auth_conditions(warden_conditions)
    #dupでwarden_conditionを複製してconditionsに格納
    conditions = warden_conditions.dup
    #loginキーがnilだった場合はfalse
    #Trueだった場合はconditionsからloginキーを削除され、そのキーを変数loginに格納もする
    if login = conditions.delete(:login)
      #これはusernameが一致する最初のレコードを取得する。
      #最初のusernameはconditionsにおけるusernameで
      #2番目のusernameはカラムとしてのusernameである
      #valueはプレースホルダーでfirstが条件に合う最初のレコードを取得するもの。
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
