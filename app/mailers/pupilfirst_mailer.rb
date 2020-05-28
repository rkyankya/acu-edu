class PupilfirstMailer < ActionMailer::Base # rubocop:disable Rails/ApplicationMailer
  include Roadie::Rails::Mailer

  default from: "ACU <kyankya.raymond@student.utamu.ac.ug>"

  layout 'mail/pupil_first'

  protected

  def default_url_options
    { host: Rails.env.production? ? 'www.acu.com' : 'www.acu.localhost' }
  end

  def roadie_options
    host_options = default_url_options.merge(protocol: Rails.env.production? ? 'https' : 'http')

    super.merge(url_options: host_options)
  end
end
