require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase


  test "the truth" do
     assert true
  end


test "should not save article without title" do
  article = Usuario.new
  assert_not article.save
end


end
