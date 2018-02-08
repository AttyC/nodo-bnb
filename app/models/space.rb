class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Float
  property :from_date, Date
  property :to_date, Date

  belongs_to :user, :required => false

  def start_date
    from_date.strftime("%d-%m-%Y")
  end

  def end_date
    to_date.strftime("%d-%m-%Y")
  end

  def avaliable_days
   (to_date - from_date).to_i
  end
end
