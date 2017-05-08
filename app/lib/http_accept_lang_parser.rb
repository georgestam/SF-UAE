class HttpAcceptLangParser
  
  def self.parse(language)
    locale = language.scan(/^[a-z]{2}/).first  # => => "en"
  end
  
end