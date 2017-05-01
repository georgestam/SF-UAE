describe 'locale' do

  context 'when arabic is selected' do 
    
    it 'works' do
      visit root_path(:en)
      find("#change-to-arabic").click
      page_ok
    end
    
  end
  
end