class PlatformSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :alt_code, :lat, :lon, :address, :lines

  def address #using activeModel to access the Address model and display it in Platform
    {street: self.object.address.street,
     city: self.object.address.city,
     state: self.object.address.state,
     zip: self.object.address.zip
   }
  end

  def lines #using activeModel to access the Line model and display it in Platform
    self.object.lines.map do |line|
      { id: line.id,
        color: line.color,
       code: line.code
     }
    end
  end

end
