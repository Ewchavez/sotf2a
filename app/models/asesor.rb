class Asesor < ApplicationRecord


  for i in Asesor.where("fecha < ?", Time.now)
     a=Asesor.find_by("fecha < ?", Time.now)

     a.disponibilidada=0
     a.save
   end

end
