describe 'Locale switching when landing page is in English' do
  
  before {
    visit root_path(:en)
  }
    
  it 'changes to locale in Arabic when Arabic button is clicked' do
    expect{ find("#change-to-arabic").click }.to change{ I18n.locale }.from(:en).to(:ea)
    page_ok
  end
  
end