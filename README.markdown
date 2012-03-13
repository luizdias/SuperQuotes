# StarWrkrs

This is my take on Square's <i>Employees</i> iOS app challenge.

#### The challenge:
<blockquote> Assume you have an Employee class which defines four properties: name, job title, date of birth, and number of years employed. Create an iOS app which consists of a UITableView for displaying a list of Employees. It should scroll smoothly and look beautiful, but the design is up to you. Bonus points for including a photo of the user, multiple device support (iPhone and iPad), and attention to detail. </blockquote>

#### The implementation:
I've taken quite a bit of liberty with the above specifications, primarily because I wanted to showcase a performant `UITableView` that contains images. Finding an adequate set of photos, along with generating the pseudo-randomized data to provide the aura of realism to this challenge app was proving to be a bit of a challenge in itself. Discovering and then scraping a source for a diverse set of personnel photos of people, then generating fictitious names, titles, birth and hire dates opened up a bit of a rabbit hole.

My solution was to simply scrape the photos and data from the character encyclopedia on the StarWars.com website. I wrote a little app to gather up the various pieces of HTML, then parsed them, extracting pertinent data into a rudimentary JSON feed. This JSON file currently serves as the data source for the items in the table view as well as the data in the details pane.

The current implementation does not display any personnel-related information like job title, date of birth or number of years employed. Again, I'm taking great liberties with the specifications here, but since I'm using data from the StarWars universe, which although fictional, technically is from a time in our past, much like the light we see from distant stars is from the past. Not to mention there currently is no iOS [Galactic Standard Calendar](http://starwars.wikia.com/wiki/Galactic_Standard_Calendar "Galactic Standard Calendar") implementation available, any dates would have to be artificially migrated to our Gregorian calendar.

The app itself is targeted for devices running iOS 5.0+. It takes advantage of ARC, and is designed to run on both iPhone and iPad. The iPad version has a split-view display.

To facilitate the retrieval, caching and subsequent display of the photos in the app I turned to [SDWebImage](https://github.com/rs/SDWebImage "SDWebImage"). At the time I wrote this app an ARC version didn't exist, so I forked and converted it to use ARC.

One of the highlights of this project is the customized table view cell display. The `EmployeeTableViewCell` utilizes a `CAGradientLayer` to paint the background gradient. The `updateCell:withEmployee:` class method is called upon to draw the contents of the cell. It handles initiating the retrieval of the thumbnail photo, and updates the values of the labels with the values from the supplied cell. I chose to use a class method for this, as well as for looking up the sub-view components merely as a design choice. They could have been implemented as instance methods, but I felt these methods serve a utilitarian purpose, therefore chose the class method approach.

The detail pane again utilizes `SDWebImage` to handle the download and caching of the larger photo images. The `UIView.layer` properties are tweaked to produce the borders around the info and biography pods.

For the overall design of the app I chose a gray palette for its neutrality and to accentuate the rich colors found in the photos.

There are many ways in which this app could be improved. For example, the table view list itself could be indexed to provide an alphabetized access to the characters. The ability to filter the list by affiliation, species, or gender might prove useful. Audio or film clips could be added for each character. Likewise their quotes from the movies, books and comics. The dataset itself could be expanded to include places and technologies in addition to characters.

As such, let's consider this a minimum viable product implementation. It is designed to look good and perform well, to provide a quick and easy insight into the various characters found in the StarWars universe.