class Schedule < RedisStorage::Model
  def self.attrs
    [ :id, :content, :long_course, :date, :created_at ]
  end
  attr_accessor *attrs
  validates :long_course, :inclusion => {:in => [true,false]}

  def long_course=(v)
    if !!v == v
      @long_course = v
    else
      @long_course = (v == "true")
    end
  end
  def date=(v)
    if v.class == Date
      @date = v
    else
      @date = Date.parse(v) unless v.nil?
    end
  end
  def created_at=(v)
    if v.class == Time
      @created_at = v
    else
      @created_at = Time.parse(v) unless v.nil?
    end
  end

  def previous
    keys = $db.smembers(self.class.persisted_key).sort
    i = keys.index("#{self.class.db_key}:#{id}")
    return nil if i == 0
    self.class.load(keys[i-1])
  end
  def next
    keys = $db.smembers(self.class.persisted_key).sort_by{|s| s.split(':')[1].to_i}
    i = keys.index("#{self.class.db_key}:#{id}")
    return nil if i == keys.length - 1
    self.class.load(keys[i+1])
  end
end
