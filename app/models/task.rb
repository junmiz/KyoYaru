class Task < ApplicationRecord
  belongs_to :user
  
  #validates :content, presence: true, length: { minimum: 1 }
  
  # ステータス（タスク状態）
  STATUS_INCOMPLETE = 0   # 未完
  STATUS_COMPLETE = 1     # 完了
end
