# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Do view helpers work?
Project.create(
  {title: "Wosaic",
    url: "https://code.google.com/p/wosaic/",
    description: "Third place non-technical winner at Engineering Open House, University of Illinois, 2008 recipient, Wosaic is an open-source project that takes several sources of photos - Flickr, Facebook, or local files - and creates mosaics comprised of those pictures.  It was developed as a fun way to share photos, and put them to an interesting use, other than collecting dust on a hard drive.  We entered the project as an interactive exhibit at Engineering Open House at UIUC in 2008, and had a lot of fun doing live demos for students and visitors.  Though the code base has not changed much since 2008, it lives on in various forms as a project for some classes at UIUC."
  })
Project.create(
  {title: "GiveChange",
    url: "https://www.facebook.com/GiveChange",
    description: "GiveChange was a non-profit startup based in San Francisco, whose goal was to engage the online generation in "\
                 "philanthropy by incentivizing small donations and attendance at interesting events throughout the city.  I helped "\
                 "on their web development team implementing a Ruby on Rails app that hosted fundraising goals, and provided an "\
                 "online marketplace for charitable donations.  For about a year, I was part of this dynamic, 4-person team.  "
  })
Project.create(
  {title: "CupCakes",
    description: "I designed and sold three pieces for a fund-raising event for a design organization at the University "\
                 "of Illinois at Urbana-Champaign in 2009.  I chose cupcakes as the subject, and played around with GIMP "\
                 "to come up with some interesting pictures."
  })
Project.create(
  {title: "Apptini",
    url: "http://www.apptini.com/",
    description: "Apptini was a concept that a college friend of mine came up with.  The idea was to virtualize a workstation, "\
                 "something that was a relatively young idea back in 2008.  As a proof of concept, I designed a website for "\
                 "connecting users with a prototype platform running Linux, with several apps pre-installed.  The connection "\
                 "was made with a secure Java applet running directly on the website itself.  I implemented and designed the website, "\
                 "and worked on the Java applet that facilitated the connection."
  })
Project.create(
  {title: "Men's Glee",
   description: "From 2007 to 2009, I participated in the University of Illinois Varisty Men's Glee Club - a men's choir.  I served "\
                " as a member and webmaster, where I brought the group to iTunes, set up an online payment system, and of course, "\
                " redesigned the website.  I also designed one of our concert posters - a parody of the Wii Music video game cover, "\
                " advertising our spring concert.  The website has since gone under new ownership, but the group is still going strong."
  })
Project.create(
  {
    title: "openfootball",
    url: "https://github.com/openfootball/major-league-soccer",
    description: "The openfootball project is dedicated to maintaining a database of free, historical soccer statistics.  I started contributing to "\
                 " this project in mid-2014 with US Major League Soccer (MLS) win/loss and roster data.  I found it to be a fun side project, "\
                 " and an interesting way to keep up with the league.  I am working on automating the process, but currently also maintain a set "\
                 " of scripts for gathering and organizing the data.  Updates are done manually as I have time."
  })
Project.create(
  {
    title: "SportDB Fork",
    url: "https://github.com/cecomp64/sport.db.ruby",
    description: "SportDB is part of the openfootball project.  It is the tool that parses the data of various leagues and rosters, and refactors it in "\
                 " the database of your choice.  I forked this project so I could add statistics to the roster.  For example, any given player on a team "\
                 " may have some number of goals, assists, red cards, yellow cards, and so on.  This allows me to maintain the MLS Almanac with more interesting "\
                 " information."
  })
Project.create(
  {
    title: "MLS Almanac",
    url: "http://mls-almanac.herokuapp.com/",
    description: "The MLS Almanac is an app I created based on the openfootball data for US Major League Soccer.  It is intended to be a historical reference, "\
                 " and tool to understand trends throughout the MLS by presenting the data in an accessible format.  The site is structured by season and team, "\
                 " and provides JSON hooks to all the information in the database back-end.  This includes matchup results between all teams for the entire season, "\
                 " as well as roster information and stats for each player."
  })

# Add some tags
Project.find_by(title: "Wosaic").tags << Tag.create(value: "code") << Tag.create(value: "college") << Tag.create(value: "open source")
Project.find_by(title: "GiveChange").tags << Tag.create(value: "code") << Tag.create(value: "web") << Tag.create(value: "open source") << Tag.create(value: "nonprofit")
Project.find_by(title: "CupCakes").tags << Tag.create(value: "nonprofit") << Tag.create(value: "design")
Project.find_by(title: "Apptini").tags << Tag.create(value: "code") << Tag.create(value: "web") << Tag.create(value: "design") << Tag.create(value: "college")
Project.find_by(title: "Men's Glee").tags << Tag.create(value: "web") << Tag.create(value: "design") << Tag.create(value: "college") << Tag.create(value: "music")
Project.find_by(title: "openfootball").tags << Tag.create(value: "code") << Tag.create(value: "sports") << Tag.create(value: "open source")
Project.find_by(title: "SportDB Fork").tags << Tag.create(value: "code") << Tag.create(value: "sports") << Tag.create(value: "open source")
Project.find_by(title: "MLS Almanac").tags << Tag.create(value: "web") << Tag.create(value: "sports") << Tag.create(value: "open source") << Tag.create(value: "code")

