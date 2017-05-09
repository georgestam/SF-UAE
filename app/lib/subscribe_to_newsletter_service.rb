class SubscribeToNewsletterService
  def initialize(user)
    @user = user
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
  end

  def call
      @gibbon.lists(@list_id).members.create(
        body: {
          email_address: @user.email,
          status: "subscribed",
          merge_fields: {
            FNAME: @user.name,
            LOCALE: @user.locale,
            MOBILE: @user.mobile
          }
        }
      )
  rescue => e
    Rails.logger.error e
    raise e unless development?
  end
  
end
