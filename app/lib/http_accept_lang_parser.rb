class HttpAcceptLangParser
  
  def self.parse(language)
    language.scan(/^[a-z]{2}/).first  # => => "en"
  end
  
end