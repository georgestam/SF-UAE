describe 'Locale switching when landing page is in English' do
  
  visit root_path(:en)
    
  it 'changes to locale in arabic when arabic button is selected' do
    expect{ find("#change-to-arabic").click }.to change{ I18n.locale }.from(:en).to(:ea)
    page_ok
  end
  
end