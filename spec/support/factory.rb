module Factory
  def self.valid_user_attributes
    {
      :email => "abc@123.com",
      :password => "password", 
      :password_confirmation => "password",
    }
  end

  def self.create_user(attrs = {})
    create_object(User, valid_user_attributes.merge(attrs))
  end

  def self.create_object(klass, attrs)
    object = klass.new
    attrs.each do |attr_name, value|
      object.send("#{attr_name}=", value)
    end
    object.save!
    object
  end
end
