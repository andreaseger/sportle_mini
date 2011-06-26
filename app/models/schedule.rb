class Schedule < RedisStorage::Model
  def self.attrs
    [ :id, :content, :long_course, :date, :created_at ]
  end
  attr_accessor *attrs
end
