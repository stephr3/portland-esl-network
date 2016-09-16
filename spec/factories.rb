FactoryGirl.define do
  factory(:site) do
    name('Sunshine ESL Class')
    region('Downtown')
    address('123 ABC St')
    city('Portland')
    state('OR')
    zip('97211')
    description('A free class!')
    contact('Joe Shmo')
    phone('971-4567')
    email('Joe@esl.com')
    url('www.eslclass.com')
    class_resource('Class')
    site_type('Church')
    happening_now('Yes')
    notes('Last contacted 9/16 by Stephanie')
    summer_classes('No')
    students_served(100)
  end

  factory(:admin) do
    username('admin')
    password('admin')
  end


  factory(:post) do
    title('New Class at Bridger Elementary')
    content('There is a new class at Bridger Elementary. Contact Stephanie for further information.')
    admin
  end
end
