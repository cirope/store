class FeedbackMailer < ActionMailer::Base
  include MandrillHeaders
  include Roadie::Rails::Automatic

  layout 'mailer'

  def feedback feedback
    @feedback = feedback
    @account  = @feedback.account
    Account.current_id = @account.id

    attach_smiley_images

    mail to: @feedback.customer_email, from: "#{@account} <#{ENV['EMAIL_ADDRESS']}>"
  end

  private

    def attach_smiley_images
      ['face-smile.png', 'face-plain.png', 'face-sad.png'].each do |image|
        path = Rails.root + 'vendor' + 'assets' + 'images' + image

        attachments.inline[image] = path.read
      end
    end
end
