class Post < ApplicationRecord
  has_many :responses , foreign_key: :post_id , dependent: :destroy
  belongs_to :user, optional: true
  
  validates :name, presence: true, length:{maximum: 20}
  validates :local, presence: true
  validates :content, presence: true, length:{maximum: 999}, on: :create
  
  # def self.search(search)
  #   return Post.all unless search
  #   Post.where(['local LIKE ?', "%#{search}%"])
  # end
  scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない

    keyword_like(search_params[:keyword])
      .genre(search_params[:genre])
      .local(search_params[:local])
      .state(search_params[:state])
   #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
  end
  
  scope :keyword_like, -> (keyword) { where('name LIKE ? OR content LIKE ?', "%#{keyword}%" ,"%#{keyword}%") if keyword.present? }  #scopeを定義。
  scope :genre, -> (genre) { where(genre: genre) if genre.present? }
  scope :local, -> (local) { where(local: local) if local.present? }
  scope :state, -> (state) { where(state: state) if state.present? }
 #scope :メソッド名 -> (引数) { SQL文 }
 #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない
end
