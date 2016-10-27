Site.create(
  name: "Barnes Elementary - Impact NW & People-Places-Things",
  address: "13730 SW Walker Rd.",
  city: "Beaverton",
  state: "OR",
  zip: "",
  description: "No classes scheduled.",
  contact: "Zadok Taylor-zadok@pptpdx.com",
  email: "",
  url: "",
  class_resource: "Class",
  site_type: "Public School",
  happening_now: "No",
  notes: "",
  region: "Washington County",
  summer_classes: "No",
  students_served: ""
)
Site.create(
  name: "Beaverton Hispanic Center",
  address: "3800 SW Cedar Hills Blvd. Suite 123",
  city: "Beaverton",
  state: "OR",
  zip: "97005",
  description: "$50 for 9 weeks. May come more than once a week. Students also have access to learn self-instructed English, typing, resume assistance, creating their own email account, or searching the web at no additional charge.Organization is thought to be defunct.",
  contact: "Contact Reem for registration",
  phone: "503-270-0272",
  email: "office@beavertonhc.org",
  url: "http://www.beavertonhc.org/esl.php",
  class_resource: "Class",
  site_type: "Social Service/Government/Non-Profit",
  happening_now: "No",
  notes: "",
  region: "Washington County",
  summer_classes: "No",
  students_served: ""
)
Site.create(
  name: "Camas Library",
  address: "625 NE 3th Ave.",
  city: "Camas",
  state: "WA",
  zip: "98607",
  description: "Multilevel. Free. Not a class. Open-entry. Story time for families with children Ages 3 to 5. Tuesdays & Fridays 11:30-12:00.Come learn English with your children at Family Story time.",
  contact: "",
  phone: "360.834.4692",
  email: "",
  url: "http://www.ci.camas.wa.us/library/index.htm",
  class_resource: "Resource",
  site_type: "Library",
  happening_now: "No",
  notes: "",
  region: "Clark County",
  summer_classes: "No",
  students_served: ""
)
Site.create(
  name: "Capstone English Center",
  address: "1411 SW Morrison Street, Suite 350",
  city: "Portland",
  state: "OR",
  zip: "",
  description: "Tuition Based Program",
  contact: "",
  phone: "503-228-6346",
  email: "",
  url: "http://www.capstone.org/",
  class_resource: "Class",
  site_type: "For-Profit Business",
  happening_now: "Yes",
  notes: "12 week terms, see website for details regarding start dates and tuition",
  region: "Downtown",
  summer_classes: "Yes",
  students_served: ""
)
Site.create(
  name: "Clatsop Community College",
  address: "1653 Jerome Ave.",
  city: "Astoria",
  state: "OR",
  zip: "97103",
  description: "ESOL/Volunteer Literacy10 week quarters -Open entry, Free",
  contact: "",
  phone: "(503) 338-2557",
  email: "",
  url: "https://www.clatsopcc.edu/academics/academic-departments/foundation-skills-institute/english-second-language-esl-education",
  class_resource: "Class",
  site_type: "Community College or University",
  happening_now: "Yes",
  notes: "",
  region: "Other Areas",
  summer_classes: "",
  students_served: ""
)
Admin.create(username: "admin", password: "admin")
Admin.create(username: "Stephanie", password: "eslnetwork")
Admin.create(username: "Heidi", password: "eslnetwork")
Post.create(
  title: "Free English Classes at Bridger Elementary",
  content: "This fall Rachel Kimbrow is teaching a free series of English Classes for parents (and the public) at Bridger Elementary, using materials provided by Intercambio Uniting Communities.
  BEGINS: Oct. 5 5:30-7
  WHERE: 7910 SE Market Street, Portland
  QUESTIONS? Contact coordinator Melany Desrochers at 503-502-1485",
  admin_id: 3
)
Post.create(
  title: "Open Forum: Refugees in Portland",
  content: "Oregon folks, you are welcome to join Lutheran Community Services Northwest in a facilitated open dialogue on refugee resettlement here in Portland. This forum is free to attend and we look forward to addressing the challenges, opportunities and problems that our community is experiencing in welcoming refugees.",
  admin_id: 2
)
