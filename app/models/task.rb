class Task < ApplicationRecord
  belongs_to :user
  
  # ステータス（タスク状態）
  STATUS_INCOMPLETE = 0   # 未完
  STATUS_COMPLETE = 1     # 完了
end
