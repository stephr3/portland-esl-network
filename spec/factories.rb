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

  factory(:link) do
    title('Multnomah County Library Web Resources')
    url('https://multcolib.org/learn-english')
    description("Multnomah Public Library's links to multiple websites.")
    tag('General Resources')
    page('Student Learning Resources')
  end

  factory(:volunteer_site) do
    name('Birch Community Services')
    url('http://www.birchcommunityservices.org/participate/volunteer/individual-volunteers/')
    address('17780 NE San Rafael Street')
    city('Portland')
    state('OR')
    zip('97230')
    level('All')
    contact('Andrew Rowlett: 971.506.5673, Andrew@BirchCommunityServices.org')
    description('Opportunities: Food Sorting, Preparing for classes.  Birch can use individual volunteers on M/W/F from 9 am to 5 pm without prior scheduling.  Please plan to volunteer for at least two hours at a time so that we can make the most out of your travel and time commitments. Scheduling is required at all other times by contacting the office at 503.251.5431.')
  end
end
