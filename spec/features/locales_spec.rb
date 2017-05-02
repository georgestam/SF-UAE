describe 'locale switching' do

  context 'when arabic is selected' do 
    
    before {
      visit root_path(:en)
    }
    
    it 'loads page' do
      find("#change-to-arabic").click
      page_ok
    end
    
    it 'changes language' do
      expect{ find("#change-to-arabic").click }.to change{ I18n.locale }.from(:en).to(:ea)
    end
    
  end
  
end