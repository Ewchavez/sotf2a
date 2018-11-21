require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase



test "Crear usuario" do
  article =Asesor.new(horai:12,lugar:"sdadasd",disponibilidada:1)

  assert article.save, "error en relaciòn"
end


end
