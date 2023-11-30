----------- Create database -----------
create database `MarsBook`;

----------- use database -----------
use `MarsBook`;

-------------------------------------- CREATE TABLE --------------------------------------

----------- Create Admin table -----------
create table `Admin_info`(
`AdminID` int(11) NOT NULL,
`Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Surname`varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Phone_Number` varchar(10) NOT NULL,
`Address` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
);
create table `User_info`(
`Email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Surname`varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Password`varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
);
select * from User_info;

----- Delete Admin table -----
-- drop table `Admin_info`;

----------- Create User table -----------
create table `Admin_login`(
`Username` varchar(45) NOT NULL,
`Email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Surname`varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Password`varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
);


----- Delete User table -----
 drop table `User_login`;

----------- Create Book table -----------
create table `Book_info`(
`BookID` int(11) NOT NULL,
`Title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Author` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Publisher`varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Price`varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
`Bookimg` longtext
);

----- Delete Book table -----
 drop table `Book_info`;

-------------------------------------- INSERT DATA --------------------------------------
----------- Insert Admin data -----------
INSERT INTO `Admin_info`(`AdminID`, `Name`, `Surname`, `Phone_Number`, `Address`) values
(6487008, 'Supanut', 'Kijprach', '0834455667', 'Salaya'),
(6487014, 'Kanchanok', 'Kaewmola', '0919998877', 'Salaya'),
(6487061, 'Sunpetch', 'Siripunt', '0848616637', 'Salaya'),
(6487082, 'Princhon', 'Sriurairatana', '0894658153', 'Salaya'),
(6487087, 'Montita', 'Baimontha', '0858945687', 'Salaya');

----- View Admin info -----
-- select * from `Admin_info`;

----------- Insert Admin login -----------
INSERT INTO `Admin_login`(`Username`, `Email`, `Name`, `Surname`, `Password`) values
('u6487008', 'Petch@student.mahidol.ac.th', 'Supanut', 'Kijprach', 'ict555'),
('u6487014', 'Keen@student.mahidol.ac.th', 'Kanchanok', 'Kaewmola', 'ict555'),
('u6487061', 'Tung@student.mahidol.ac.th', 'Sunpetch', 'Siripunt', 'ict555'),
('u6487082', 'Plai@student.mahidol.ac.th', 'Princhon', 'Sriurairatana', 'ict555'),
('u6487087', 'Mook@student.mahidol.ac.th', 'Montita', 'Baimontha', 'ict555');

SELECT * FROM Admin_login WHERE Username='u6487014';

----- View  Admin login -----
-- select * from `Admin_login`;

----------- Insert Book data -----------
INSERT INTO `Book_info`(`BookID`, `Title`, `Author`, `Publisher`, `Type`, `Price`, `Bookimg`) values
(1, 'Technology In Action Introductory', 'Alan Evans,  Kendall Martin, Mary Anne Poatsy', 'Pearson Education (US)', 'Technology', '6,517.78', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/1346/9780134608211.jpg'),
(2, 'Technology-As-A-Service Playbook : How to Grow a Profitable Subscription Business', 'Thomas Lah, J B Wood', 'TSIA', 'Technology', '1,019.07', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/9860/9780986046230.jpg'),
(3, 'How Technology Works : The facts visually explained', 'DK', 'Dorling Kindersley Ltd', 'Technology', '878.37', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/2413/9780241356289.jpg'),
(4, 'Information Technology in a Global Society Solutions Book', 'Stuart Gray', 'Createspace Independent Publishing Platform', 'Technology', '1,132.55', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4825/9781482567762.jpg'),
(5, 'The Future Is Faster Than You Think : How Converging Technologies Are Transforming Business, Industries, and Our Lives', 'Peter H. Diamandis, Steven Kotler', 'SIMON & SCHUSTER', 'Technology', '586.31', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/9821/9781982143213.jpg'),
(6, 'How Philosophy Works : The concepts visually explained', 'DK', 'Dorling Kindersley Ltd', 'Philosophy', '866.41', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/2413/9780241363188.jpg'),
(7, "Read People Like a Book : How to Analyze, Understand, and Predict People's Emotions, Thoughts, Intentions, and Behaviors", 'Patrick King', 'PKCS Media, Inc.', 'Philosophy', '672.13', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/6474/9781647432225.jpg'),
(8, 'The Philosophy Book : Big Ideas Simply Explained', 'Dk', 'Dorling Kindersley Ltd', 'Philosophy', '880.21', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4053/9781405353298.jpg'),
(9, "Seeing What Others Don't : The Remarkable Ways We Gain Insights", 'Gary Klein', 'John Murray Press', 'Philosophy', '365.09', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/8578/9781857886788.jpg'),
(10, 'The World of Philosophy : An Introductory Reader', 'Cahn', 'Oxford University Press, USA', 'Philosophy', '3,619.73', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/1906/9780190691974.jpg'),
(11, "In Defense of Food : An Eater's Manifesto", 'Michael Pollan', 'Penguin Putnam Inc', 'Health', '556.27', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/1431/9780143114963.jpg'),
(12, 'Brain Food : The Surprising Science of Eating for Cognitive Power', 'Lisa Mosconi', 'Random House USA Inc', 'Health', '657.69', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/3995/9780399574009.jpg'),
(13, 'This Is Your Brain on Food : An Indispensable Guide to the Surprising Foods That Fight Depression, Anxiety, Ptsd, Ocd, Adhd, and More', 'Uma Naidoo', 'Little, Brown & Company', 'Health', '1,054.35', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/3165/9780316536820.jpg'),
(14, 'Deep Nutrition : Why Your Genes Need Traditional Food', 'Catherine Shanahan', "St Martin's Press", 'Health', '1,174.75', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/2501/9781250113825.jpg'),
(15, "The Omnivore's Dilemma : Young Readers Edition", 'Michael Pollan', 'Penguin Putnam Inc', 'Health', '460.87', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/1019/9781101993835.jpg'),
(16, 'The Secret History of Food : Strange But True Stories about the Origins of Everything We Eat', 'Matt Siegel', 'Ecco Press', 'Food', '931.36', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/0629/9780062973214.jpg'),
(17, 'Food : The History of Taste', 'Paul Freedman', 'Thames & Hudson Ltd', 'Food', '1,107.01', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/5002/9780500295373.jpg'),
(18, 'The Food Lab : Better Home Cooking Through Science', 'J. Kenji Lopez-Alt', 'WW Norton & Co', 'Food', '1,883.44', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/3930/9780393081084.jpg'),
(19, 'Food Anatomy', 'Julia Rothman, Rachel Wharton', 'Storey Publishing LLC', 'Food', '508.91', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/6121/9781612123394.jpg'),
(20, '100 Million Years of Food : What Our Ancestors Ate and Why it Matters Today', 'Stephen Le', "St Martin's Press", 'Food', '710.32', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/2501/9781250117885.jpg'),
(21, 'I Love You to the Moon And Back', 'Little Tiger Press', 'Little Tiger Press Group', '295.83', 'Kid', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/8486/9781848690691.jpg'),
(22, 'The Big Book of the Blue', 'Yuval Zommer', 'Thames & Hudson Ltd', 'Kid', '674.18', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/5006/9780500651193.jpg'),
(23, "Little Blue Truck's Christmas", 'Alice Schertle', 'HOUGHTON MIFFLIN', 'Kid', '730.24', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/5443/9780544320413.jpg'),
(24, 'Bear Stays Up for Christmas', 'Karma Wilson', 'Simon & Schuster', 'Kid', '380.69', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4424/9781442427907.jpg'),
(25, 'The Christmas Bear', 'Ian Whybrow', 'Pan Macmillan', 'Kid', '362.60', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/5098/9781509806966.jpg'),
(26, 'What Pet Should I Get?', 'Dr. Seuss', 'Random House USA Inc', 'Pet', '638.29', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/5535/9780553524260.jpg'),
(27, 'The Forever Dog : A New Science Blueprint for Raising Healthy and Happy Canine Companions', 'Rodney Habib, Karen Shaw Becker', 'HarperCollins Publishers', 'Pet', '737.66', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/0084/9780008467425.jpg'),
(28, 'My Pet Goldfish', 'Catherine Rayner', 'Walker Books Ltd', 'Pet', '531.28', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4063/9781406385786.jpg'),
(29, 'The Perfect Pet', 'Russell Punter', 'Usborne Publishing Ltd', 'Pet', '290.85', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4095/9781409530633.jpg'),
(30, 'What Is Your Cat Really Thinking?', 'Sophie Johnson, Danny Cameron', 'Octopus Publishing Group', 'Pet', '325.55', 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/8495/9781849539487.jpg');

----- View Book info -----
-- select * from `Book_info`;
select * from admin_info;
delete from admin_info where `AdminID` = 6487069;
drop table Admin_info;
alter table Admin_info add primary key (AdminID);