module CacheChanged
  def self.write(decision_id, user_id, value)
    puts key(decision_id, user_id)
    Rails.cache.write(key(decision_id, user_id), value)
  end

  def self.read(decision_id, user_id)
    puts key(decision_id, user_id)
    Rails.cache.read(key(decision_id, user_id))
  end

  protected

  def self.key(decision_id, user_id)
    "decision_#{decision_id}_user_#{user_id}_changed"
  end
end
