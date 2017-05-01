RSpec.describe PagesController, type: :controller do

  describe 'landing page' do

    context 'when it is loaded' do 
      
      it 'diplays the landing page' do
        get 'index'
        controller_ok
      end
      
    end
    
  end
  
end 