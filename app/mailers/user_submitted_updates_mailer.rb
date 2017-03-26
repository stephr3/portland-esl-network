class UserSubmittedUpdatesMailer < ApplicationMailer
  default from: "heidi.dryden@gmail.com"

  def class_submitted(site)
    @site = site
    mail(to: "stephr3@gmail.com", subject: "Portland ESL Network - #{@site.user_name} has Submitted a New Class")
  end

  def class_updated(site, update)
    @site = site
    @update = update
    mail(to: "stephr3@gmail.com", subject: "Portland ESL Network - #{@update.user_name} has Requested Updates for #{@site.name}")
  end
end
