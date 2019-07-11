#require 'rspec'
describe StaticPagesController do
  describe 'GET about' do
    it 'should renders the about template' do
      get :about
      expect(response).to render_template :about

    end
  end
end
