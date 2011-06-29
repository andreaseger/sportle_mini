class User < RedisStorage::Model
  include ActiveModel::SecurePassword
  has_secure_password
  validates_presence_of :password, :on => :create

  def self.attrs
    [ :id, :email, :password_digest ]
  end
  attr_accessor *attrs

  validate do
    errors.add(:email, "email is already taken") if $db.exists(email_key)
  end

  def self.find_by(key, value)
    return nil if key.nil? || value.nil? || key.to_sym != :email
    find_by_id($db.get("#{db_key}:#{key}:#{value}"))
  end

  def save
    unless persisted?
      @id = $db.incr(self.class.next_id_key)
    end
    if valid?
      $db.multi do
        $db.set db_key, to_json
        $db.set email_key, id
        #$db.set "#{self.class.db_key}:email:#{email}", id
        $db.sadd self.class.persisted_key, id
      end
      @id
    else
      nil
    end
  end

  def email_key
    "#{self.class.db_key}:email:#{email}"
  end

end
