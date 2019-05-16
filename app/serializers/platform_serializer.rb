class PlatformSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :alt_code, :lat, :lon, :address, :lines

  def address
    {street: self.object.address.street,
     city: self.object.address.city,
     state: self.object.address.state,
     zip: self.object.address.zip
   }
  end

  def lines
    self.object.lines.map do |line|
      {color: line.color,
       code: line.code
     }
    end
  end

end
