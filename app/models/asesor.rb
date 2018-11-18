class Asesor < ApplicationRecord


  for i in Asesor.where("fecha < ?", Time.now)

     i.disponibilidada=0
     i.save
   end

end
