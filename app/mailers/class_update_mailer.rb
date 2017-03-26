class ClassUpdateMailer < ApplicationMailer
  default from: "heidi.dryden@gmail.com"

  def class_updated(site)
    @site = site
    mail(to: "heidi.dryden@gmail.com", subject: "Portland ESL Network - #{@site.name} has been Updated")
  end

  def class_created(site)
    @site = site
    mail(to: "heidi.dryden@gmail.com", subject: "Portland ESL Network - New Class Added")    
  end
end
