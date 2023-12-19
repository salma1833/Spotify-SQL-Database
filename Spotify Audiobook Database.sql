CREATE DATABASE g42_project_spotify;

USE g42_project_spotify;

CREATE TABLE book (
	BookID					VARCHAR(4)		NOT NULL,
    BookISBN				CHAR(13)		NOT NULL,
    BookTitle				VARCHAR(45)		NOT NULL,
    BookGenre				VARCHAR(25)		NOT NULL,
    BookReadingLevel		VARCHAR(5)		NOT NULL,
    BookNoOfPages			INT				NOT NULL,
    BookPrice				INT,
    PRIMARY KEY (BookID) );
    
CREATE TABLE booklang (
	BookLanguage			VARCHAR(25)		NOT NULL,
    BookID					VARCHAR(4)		NOT NULL,
    PRIMARY KEY (BookLanguage, BookID),
    FOREIGN KEY (BookID) REFERENCES book(BookID) );

CREATE TABLE narrator (
	NarratorID				VARCHAR(4)		NOT NULL,
    NarratorFName			VARCHAR(25)		NOT NULL,
    NarratorLName			VARCHAR(25)		NOT NULL,
    NarratorBirthDate		DATE			NOT NULL,
    NarratorPhoneNumber		VARCHAR(10)		NOT NULL,
    NarratorEmail			VARCHAR(45)		NOT NULL,
    PRIMARY KEY (NarratorID) );
    
CREATE TABLE audiobook (
	ABID					VARCHAR(4)		NOT NULL,
    ABDuration				TIME			NOT NULL,
    BookID					VARCHAR(4)		NOT NULL,
    NarratorID				VARCHAR(4)		NOT NULL,
    PRIMARY KEY (ABID),
    FOREIGN KEY	(BookID) REFERENCES book(BookID),
    FOREIGN KEY (NarratorID) REFERENCES narrator(NarratorID) );
    
    
CREATE TABLE publisher ( 
	PublisherID				VARCHAR(4)		NOT NULL,
    PublisherEmail			VARCHAR(45)		NOT NULL,
    PublisherPhoneNumber	VARCHAR(10)		NOT NULL,
    PublisherName			VARCHAR(45)		NOT NULL,
    PRIMARY KEY (PublisherID) );
    
CREATE TABLE author (
	AuthorID				VARCHAR(4)		NOT NULL,
    AuthorFName				VARCHAR(25)		NOT NULL,
    AuthorLName				VARCHAR(25)		NOT NULL,
    AuthorEmail				VARCHAR(45)		NOT NULL,
    AuthorPhoneNumber		VARCHAR(10)		NOT NULL,
    PRIMARY KEY (AuthorID) );

CREATE TABLE tier (
	TierID					VARCHAR(4)		NOT NULL,
    TierLevel				INT				NOT NULL,
    TierPrice				INT				NOT NULL,
    PRIMARY KEY (TierID) );

CREATE TABLE account (
	AccountID				VARCHAR(4)		NOT NULL,
    AccountPassword			VARCHAR(45)		NOT NULL,
    AccountCity				VARCHAR(45)		NOT NULL,
    AccountState			CHAR(2)			NOT NULL,
    AccountZipCode			CHAR(5)			NOT NULL,
    AccountCountry			VARCHAR(25)		NOT NULL,
    TierID					VARCHAR(4)		NOT NULL,
    PRIMARY KEY (AccountID),
    FOREIGN KEY (TierID) REFERENCES tier(TierID) );
    
CREATE TABLE accphone (
	AccountPhoneNumber		VARCHAR(10)		NOT NULL,
    AccountID				VARCHAR(4)		NOT NULL,
    PRIMARY KEY (AccountPhoneNumber, AccountID),
    FOREIGN KEY (AccountID) REFERENCES account(AccountID) );
    
CREATE TABLE accmail (
	AccountEmail 			VARCHAR(45)		NOT NULL,
    AccountID				VARCHAR(4)		NOT NULL,
    PRIMARY KEY (AccountEmail),
    FOREIGN KEY (AccountID) REFERENCES account(AccountID) );

CREATE TABLE user (
	UserID					VARCHAR(4)		NOT NULL,
    Username				VARCHAR(25)		NOT NULL,
    UserFName				VARCHAR(25)		NOT NULL,
    UserLName				VARCHAR(25)		NOT NULL,
    UserBirthDate			DATE			NOT NULL,
    UserPassword			VARCHAR(45)		NOT NULL,
    UserEmail				VARCHAR(45)		NOT NULL,
    UserPhoneNumber			VARCHAR(10)		NOT NULL,
    UserAccountOwner		BOOLEAN			NOT NULL,
    AccountID				VARCHAR(4)		NOT NULL,
    PRIMARY KEY (UserID),
    FOREIGN KEY (AccountID) REFERENCES account(AccountID) );

CREATE TABLE publishedby (
	BookID					VARCHAR(4)		NOT NULL,
    PublisherID				VARCHAR(4)		NOT NULL,
    PRIMARY KEY (BookID, PublisherID),
    FOREIGN KEY (BookID) REFERENCES book(BookID),
    FOREIGN KEY (PublisherID) REFERENCES publisher(PublisherID) );
    
CREATE TABLE writtenby (
	BookID					VARCHAR(4)		NOT NULL,
    AuthorID				VARCHAR(4)		NOT NULL,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES book(BookID),
    FOREIGN KEY (AuthorID) REFERENCES author(AuthorID) );
    
CREATE TABLE ispurchasedby (
	ABID					VARCHAR(4)		NOT NULL,
    UserID					VARCHAR(4)		NOT NULL,
    PRIMARY KEY (ABID, UserID),
    FOREIGN KEY (ABID) REFERENCES audiobook(ABID),
    FOREIGN KEY (UserID) REFERENCES user(UserID) );
    
INSERT INTO book VALUES ('B1',9781619630345,'Throne Of Glass','Fantasy',12,432,7);
INSERT INTO book VALUES ('B2',9780439023481,'The Hunger Games','Dystopia',10,374,0);
INSERT INTO book VALUES ('B3',9780316015844,'Twilight','Romance',12,498,8);
INSERT INTO book VALUES ('B4',9781619636040,'To Kill a Mockingbird','Historical Fiction',12,336,6);
INSERT INTO book VALUES ('B5',9781408872895,'Pride and Prejudice','Romance',16,279,8);
INSERT INTO book VALUES ('B6',9781681195773,'The Book Thief','Historical Fiction',12,552,6);
INSERT INTO book VALUES ('B7',9781619636101,'The Hobbit','Fantasy',12,366,7);
INSERT INTO book VALUES ('B8',9780394800165,'Green Eggs And Ham','Children',5,64,3);
INSERT INTO book VALUES ('B9',9781635575583,'It Ends With Us','Romance',15,283,6);
INSERT INTO book VALUES ('B10',9781681196282,'A Court of Silver Flames','Fantasy',18,757,8);
INSERT INTO book VALUES ('B11',9780747532699,'Harry Potter and the Philosopher’s Stone','Fantasy',10,223,6);
INSERT INTO book VALUES ('B12',9780439064873,'Harry Potter and the Chamber of Secrets','Fantasy',10,341,2);
INSERT INTO book VALUES ('B13',9780439655484,'1984','Dystopia',11,298,2);
INSERT INTO book VALUES ('B14',9780142437209,'Jane Eyre','Romance',13,532,2);
INSERT INTO book VALUES ('B15',9780439139595,'The Da Vinci Code','Mystery',16,489,3);
INSERT INTO book VALUES ('B16',9780439358064,'The Kite Runner','Historical Fiction',13,371,4);
INSERT INTO book VALUES ('B17',9780439784542,'The Great Gatsby','Fiction',11,180,2);
INSERT INTO book VALUES ('B18',9780385732550,'The Giver','Dystopia',10,208,3);
INSERT INTO book VALUES ('B19',9780786838653,'The Lightning Thief','Mythology',9,377,5);
INSERT INTO book VALUES ('B20',9781423103349,'The Sea of Monsters','Mythology',9,279,5);
INSERT INTO book VALUES ('B21',9781423101482,'The Titan’s Curse','Mythology',9,207,8);
INSERT INTO book VALUES ('B22',9781423101499,'The Battle of the Labyrinth','Mythology',9,361,5);
INSERT INTO book VALUES ('B23',9780141036137,'Animal Farm','Historical Nonfiction',9,112,4);
INSERT INTO book VALUES ('B24',9781478923732,'The Cruel Prince','Fantasy',14,370,8);
INSERT INTO book VALUES ('B25',9780399155345,'The Help','Historical Fiction',13,464,5);
INSERT INTO book VALUES ('B26',9780553418354,'Gone Girl','Thriller',18,415,9);
INSERT INTO book VALUES ('B27',9780142437261,'The Scarlet Letter','Historical Fiction',14,279,3);
INSERT INTO book VALUES ('B28',9781416989417,'Hush, Hush','Romance',17,391,10);
INSERT INTO book VALUES ('B29',9780060256654,'The Giving Tree','Children',5,64,3);
INSERT INTO book VALUES ('B30',9780064410939,'Charlottes Webb','Children',7,184,3);

INSERT INTO booklang VALUES ('English','B1');
INSERT INTO booklang VALUES ('Spanish','B1');
INSERT INTO booklang VALUES ('English','B2');
INSERT INTO booklang VALUES ('French','B2');
INSERT INTO booklang VALUES ('Spanish','B3');
INSERT INTO booklang VALUES ('English','B3');
INSERT INTO booklang VALUES ('English','B4');
INSERT INTO booklang VALUES ('Spanish','B4');
INSERT INTO booklang VALUES ('English','B5');
INSERT INTO booklang VALUES ('French','B5');
INSERT INTO booklang VALUES ('German','B6');
INSERT INTO booklang VALUES ('English','B6');
INSERT INTO booklang VALUES ('English','B7');
INSERT INTO booklang VALUES ('Danish','B7');
INSERT INTO booklang VALUES ('English','B8');
INSERT INTO booklang VALUES ('Dutch','B8');
INSERT INTO booklang VALUES ('English','B9');
INSERT INTO booklang VALUES ('French','B9');
INSERT INTO booklang VALUES ('Spanish','B10');
INSERT INTO booklang VALUES ('English','B10');
INSERT INTO booklang VALUES ('English','B11');
INSERT INTO booklang VALUES ('Spanish','B11');
INSERT INTO booklang VALUES ('Chinese','B12');
INSERT INTO booklang VALUES ('English','B12');
INSERT INTO booklang VALUES ('English','B13');
INSERT INTO booklang VALUES ('German','B13');
INSERT INTO booklang VALUES ('English','B14');
INSERT INTO booklang VALUES ('Spansih','B14');
INSERT INTO booklang VALUES ('Italian','B15');
INSERT INTO booklang VALUES ('English','B15');
INSERT INTO booklang VALUES ('English','B16');
INSERT INTO booklang VALUES ('French','B16');
INSERT INTO booklang VALUES ('German','B17');
INSERT INTO booklang VALUES ('English','B17');
INSERT INTO booklang VALUES ('Spanish','B18');
INSERT INTO booklang VALUES ('English','B18');
INSERT INTO booklang VALUES ('Spanish','B19');
INSERT INTO booklang VALUES ('English','B19');
INSERT INTO booklang VALUES ('English','B20');
INSERT INTO booklang VALUES ('French','B20');
INSERT INTO booklang VALUES ('Spanish','B21');
INSERT INTO booklang VALUES ('English','B21');
INSERT INTO booklang VALUES ('English','B22');
INSERT INTO booklang VALUES ('Danish','B22');
INSERT INTO booklang VALUES ('German','B23');
INSERT INTO booklang VALUES ('English','B23');
INSERT INTO booklang VALUES ('English','B24');
INSERT INTO booklang VALUES ('French','B24');
INSERT INTO booklang VALUES ('English','B25');
INSERT INTO booklang VALUES ('Dutch','B25');
INSERT INTO booklang VALUES ('English','B26');
INSERT INTO booklang VALUES ('Danish','B26');
INSERT INTO booklang VALUES ('Italian','B27');
INSERT INTO booklang VALUES ('English','B27');
INSERT INTO booklang VALUES ('English','B28');
INSERT INTO booklang VALUES ('French','B28');
INSERT INTO booklang VALUES ('Spanish','B29');
INSERT INTO booklang VALUES ('English','B29');
INSERT INTO booklang VALUES ('Chinese','B30');
INSERT INTO booklang VALUES ('English','B30');

INSERT INTO narrator VALUES ('N1','John','Smith','1995-01-17',5554750258,'johnsmith@gmail.com');
INSERT INTO narrator VALUES ('N2','Alyssa','Noelle','1988-04-17',7492749274,'alyssanoella@yahoo.com');
INSERT INTO narrator VALUES ('N3','Rachel','Dorsett','1980-11-20',2749267492,'racheldorsett@me.com');
INSERT INTO narrator VALUES ('N4','Brok','Hamilton','1977-12-30',8777888787,'brokham@gmail.com');
INSERT INTO narrator VALUES ('N5','Zack','Tate','1999-03-13',1937397286,'zacktate@outlook.com');
INSERT INTO narrator VALUES ('N6','Lauren','Bing','2002-01-28',2864788723,'laurenbing@gmail.com');
INSERT INTO narrator VALUES ('N7','Zoe','Gellar','1975-11-19',0980980988,'zoegellar@yahoo.com');
INSERT INTO narrator VALUES ('N8','Jessica','Sabrino','1973-08-18',7787782647,'jessicasabrino@me.com');
INSERT INTO narrator VALUES ('N9','Sydney','Saviano','2004-06-03',5174927493,'sydneysaviano@outlook');
INSERT INTO narrator VALUES ('N10','Ally','Forster','2002-04-19',8273646792,'aforster@gmail.com');
INSERT INTO narrator VALUES ('N11','Izzy','Avila','2001-12-20',8264829164,'izzyavila@yahoo.com');
INSERT INTO narrator VALUES ('N12','Aidan','Ethers','1989-06-07',8766788788,'aidanethers@me.com');
INSERT INTO narrator VALUES ('N13','Maddie','Green','1988-07-06',8262728920,'maddiegreen@outlook.com');
INSERT INTO narrator VALUES ('N14','Gabrielle','Cope','2000-04-17',1739277393,'gabicope@gmail.com');
INSERT INTO narrator VALUES ('N15','Nate','Archibald','1978-03-18',3734738273,'natearchibald@yahoo.com');
INSERT INTO narrator VALUES ('N16','Chuck','Bass','1971-04-15',3728917483,'chuckbass@me.com');
INSERT INTO narrator VALUES ('N17','Dan','Humphrey','2000-09-18',1739236484,'danhump@outlook.com');
INSERT INTO narrator VALUES ('N18','Serena','Vanderwoodsen','1970-09-19',1638462638,'serenavdw@gmail.com');
INSERT INTO narrator VALUES ('N19','Blair','Waldorf','1989-11-10',1345708761,'blairwaldorf@yahoo.com');
INSERT INTO narrator VALUES ('N20','Michael','Jordan','2002-09-18',4764678929,'michaelj@me.com');
INSERT INTO narrator VALUES ('N21','Ben','Murray','2001-07-07',1947297463,'benmurray@outlook.com');
INSERT INTO narrator VALUES ('N22','David','Dockett','2000-06-04',1657492746,'daviddockett@gmail.com');
INSERT INTO narrator VALUES ('N23','Donna','Warran','1999-09-09',1047297482,'donnawarran@yahoo.com');
INSERT INTO narrator VALUES ('N24','Steve','Sanders','1987-01-01',2830164910,'stevesanders@me.com');
INSERT INTO narrator VALUES ('N25','Dylan','McKay','1988-12-20',6748923847,'dylanmckay@outlook.com');
INSERT INTO narrator VALUES ('N26','Kelly','Taylor','1987-03-04',3748920983,'kellytaylor@gmail.com');
INSERT INTO narrator VALUES ('N27','Brandon','Carson','1999-04-04',2789377328,'bcarson@yahoo.com');
INSERT INTO narrator VALUES ('N28','Brenda','Walsh','1986-06-05',5674839576,'brendaw@me.com');
INSERT INTO narrator VALUES ('N29','Blake','Johnson','1986-04-19',4567344356,'bjohnson@outlook.com');
INSERT INTO narrator VALUES ('N30','Sally','Carmichael','2001-10-23',7834355783,'sallycarmichael@gmail.com');

INSERT INTO audiobook VALUES ('AB1',600,'B1','N1');
INSERT INTO audiobook VALUES ('AB2',720,'B2','N2');
INSERT INTO audiobook VALUES ('AB3',850,'B3','N3');
INSERT INTO audiobook VALUES ('AB4',750,'B4','N4');
INSERT INTO audiobook VALUES ('AB5',950,'B5','N5');
INSERT INTO audiobook VALUES ('AB6',925,'B6','N1');
INSERT INTO audiobook VALUES ('AB7',1005,'B7','N1');
INSERT INTO audiobook VALUES ('AB8',1005,'B8','N1');
INSERT INTO audiobook VALUES ('AB9',935,'B9','N4');
INSERT INTO audiobook VALUES ('AB10',1100,'B10','N2');
INSERT INTO audiobook VALUES ('AB11',1010,'B11','N3');
INSERT INTO audiobook VALUES ('AB12',825,'B12','N2');
INSERT INTO audiobook VALUES ('AB13',925,'B13','N5');
INSERT INTO audiobook VALUES ('AB14',1235,'B14','N6');
INSERT INTO audiobook VALUES ('AB15',725,'B15','N7');
INSERT INTO audiobook VALUES ('AB16',955,'B16','N8');
INSERT INTO audiobook VALUES ('AB17',1050,'B17','N9');
INSERT INTO audiobook VALUES ('AB18',1155,'B18','N10');
INSERT INTO audiobook VALUES ('AB19',735,'B19','N10');
INSERT INTO audiobook VALUES ('AB20',845,'B20','N11');
INSERT INTO audiobook VALUES ('AB21',945,'B21','N12');
INSERT INTO audiobook VALUES ('AB22',1245,'B22','N13');
INSERT INTO audiobook VALUES ('AB23',845,'B23','N14');
INSERT INTO audiobook VALUES ('AB24',1045,'B24','N15');
INSERT INTO audiobook VALUES ('AB25',1000,'B25','N9');
INSERT INTO audiobook VALUES ('AB26',945,'B26','N6');
INSERT INTO audiobook VALUES ('AB27',845,'B27','N8');
INSERT INTO audiobook VALUES ('AB28',750,'B28','N10');
INSERT INTO audiobook VALUES ('AB29',1005,'B29','N12');
INSERT INTO audiobook VALUES ('AB30',750,'B30','N11');

INSERT INTO publisher VALUES ('P1','bloomsburypub@gmail.com',8883308477,'Bloomsbury Publishing');
INSERT INTO publisher VALUES ('P2','scholasticpub@yahoo.com',8007246527,'Scholastic');
INSERT INTO publisher VALUES ('P3','littlebrownco@gmail.com',2123641100,'Little, Brown and Company');
INSERT INTO publisher VALUES ('P4','lippincottpub@outlook.com',8006383030,'J. B. Lippincott & Co.');
INSERT INTO publisher VALUES ('P5','ewhitehallpub@me.com',4135699480,'T. Egerton, Whitehall');
INSERT INTO publisher VALUES ('P6','knopfyr@gmail.com',4856729898,'Knopf Books for Young Readers');
INSERT INTO publisher VALUES ('P7','georgeaupub@yahoo.com',6789998212,'George Allen & Unwin');
INSERT INTO publisher VALUES ('P8','randomhousepub@yahoo.com',4856273344,'Random House');
INSERT INTO publisher VALUES ('P9','simonschpub@gmail.com',9376264891,'Simon & Schuster');
INSERT INTO publisher VALUES ('P10','seckerwarbug@outlook.com',8042122087,'Secker & Warburg');
INSERT INTO publisher VALUES ('P11','smithelderpub@gmail.com',9057865346,'Smith, Elder & Co.');
INSERT INTO publisher VALUES ('P12','doubledaypub@me.com',7576287901,'Doubleday');
INSERT INTO publisher VALUES ('P13','riverheadpub@gmail.com',9034567312,'Riverhead Books');
INSERT INTO publisher VALUES ('P14','charlessspub@me.com',6047835902,'Charles Scribners Sons');
INSERT INTO publisher VALUES ('P15','hmifflinpub@gmail.com',4047895632,'Houghton Mifflin');
INSERT INTO publisher VALUES ('P16','miramaxbooks@gmail.com',7098213485,'Miramax Books');
INSERT INTO publisher VALUES ('P17','lbbforyouth@outlook.com',8069372261,'Little Brown Books for Young Readers');
INSERT INTO publisher VALUES ('P18','penguinpub@yahoo.com',1015678932,'Penguin Books');
INSERT INTO publisher VALUES ('P19','crownpublishing@gmail.com',9063475689,'Crown Publishing Group');
INSERT INTO publisher VALUES ('P20','ticknorrfpub@yahoo.com',8885673421,'Ticknor, Reed & Fields');
INSERT INTO publisher VALUES ('P21','harpercollinspub@gmail.com',8674529012,'HarperCollins');
INSERT INTO publisher VALUES ('P22','harperbrotherspub@me.com',5689046732,'Harper & Brothers');

INSERT INTO author VALUES ('A1','Sarah','Maas','sarahmaas@gmail.com',5557778757);
INSERT INTO author VALUES ('A2','Suzanne','Collins','suzcollins@yahoo.com',4738877890);
INSERT INTO author VALUES ('A3','Stephanie','Meyer','stephmeyer@outlook.com',1112223333);
INSERT INTO author VALUES ('A4','Harper','Lee','harperlee@me.com',1223343434);
INSERT INTO author VALUES ('A5','Jane','Austen','janeausten@gmail.com',5554443434);
INSERT INTO author VALUES ('A6','Markus','Zusak','markuszusak@yahoo.com',9999090909);
INSERT INTO author VALUES ('A7','JRR','Tolkien','jrrtolk@me.com',1112221111);
INSERT INTO author VALUES ('A8','Theodore','Seuss','drseuss@gmail.com',8988988989);
INSERT INTO author VALUES ('A9','Colleen','Hoover','choover@outlook.com',5656565656);
INSERT INTO author VALUES ('A10','JK','Rowling','jkrow@yahoo.com',7778889999);
INSERT INTO author VALUES ('A11','George','Orwell','gorwell@yahoo.com',7364453147);
INSERT INTO author VALUES ('A12','Charlotte','Bronte','charlotteb@gmail.com',8974337843);
INSERT INTO author VALUES ('A13','Dan','Brown','danbrown@outlook.com',7775569211);
INSERT INTO author VALUES ('A14','Khaled','Hosseini','khoss@me.com',3334443434);
INSERT INTO author VALUES ('A15','F Scott','Fitzgerald','ffitz@gmail.com',1234567890);
INSERT INTO author VALUES ('A16','Lois','Lowry','llowry@me.com',1231231234);
INSERT INTO author VALUES ('A17','Rick','Riordan','rickyr@yahoo.com',0987654321);
INSERT INTO author VALUES ('A18','Holly','Black','hollyblack@me.com',9595959955);
INSERT INTO author VALUES ('A19','Kathryn','Stockett','kstock@me.com',1111111111);
INSERT INTO author VALUES ('A20','Gillian','Flynn','gillianflynn@gmail.com',3333333333);
INSERT INTO author VALUES ('A21','Nathaniel','Hawthorne','natehawthorne@me.com',5555555555);
INSERT INTO author VALUES ('A22','Becca','Fitzpatrick','beccafitz@gmail.com',4250009211);
INSERT INTO author VALUES ('A23','Shel','Silverstein','shelsilv@outlook.com',7784678901);
INSERT INTO author VALUES ('A24','EB','White','ebwhite@yahoo.com',2196567217);

INSERT INTO tier VALUES ('T1','1',0);
INSERT INTO tier VALUES ('T2','2',5);
INSERT INTO tier VALUES ('T3','3',10);
INSERT INTO tier VALUES ('T4','4',13);
INSERT INTO tier VALUES ('T5','5',16);

INSERT INTO account VALUES ('AC1','zqfri23j240Nt8','Charlottesville','VA',22903,'United Sates','T1');
INSERT INTO account VALUES ('AC2','MickeyMouse!','Ambler','PA',19002,'United States','T2');
INSERT INTO account VALUES ('AC3','IL0ve$p0tify','Mesa','AZ',85212,'United States','T4');
INSERT INTO account VALUES ('AC4','myD0GisCute!','Montgomery','AL',36102,'United States','T3');
INSERT INTO account VALUES ('AC5','hg84bf9Wafh4','Topanga','CA',91364,'United States','T5');
INSERT INTO account VALUES ('AC6','afAef3333f45','Silverthorne','CO',80497,'United States','T3');
INSERT INTO account VALUES ('AC7','YouFeedtHEfiSh?','Tallahassee','FL',32302,'United States','T2');
INSERT INTO account VALUES ('AC8','hf4BF9fff0297b','Gainesville','VA',20155,'United States','T4');
INSERT INTO account VALUES ('AC9','Marie0716?','Rockford','IL',61016,'United States','T2');
INSERT INTO account VALUES ('AC10','J80bf7EbF&hh','Gettysburg','PA',17325,'United States','T5');
INSERT INTO account VALUES ('AC11','$occ3rIsL1f3','Orlando','FL',32801,'United States','T3');
INSERT INTO account VALUES ('AC12','WeL0v3C0MM','Lawrence','KS',66045,'United States','T2');
INSERT INTO account VALUES ('AC13','hf777Beowne832','Apex','NC',27523,'United States','T4');
INSERT INTO account VALUES ('AC14','p4ssw0rd!!','Princetown','NY',10012,'United States','T1');
INSERT INTO account VALUES ('AC15','th1sisM7p4sswr0rd','Clayton','NC',27527,'United States','T3');
INSERT INTO account VALUES ('AC16','pqzsa4frk7892bKMLS','Hoxie','KS',67740,'United States','T5');
INSERT INTO account VALUES ('AC17','MuSiCiSlIfE1!','Manteo','NC',27954,'United States','T2');
INSERT INTO account VALUES ('AC18','$potifyistheBEST!','Centerville','VA',20121,'United States','T1');
INSERT INTO account VALUES ('AC19','MACM1LL3Rrip','Bristow','VA',20136,'United States','T3');
INSERT INTO account VALUES ('AC20','Fr4nkOc3an!','Dothan','AL',36204,'United States','T5');
INSERT INTO account VALUES ('AC21','3lvisIStheK1ng$$','Belvidere','IL',61008,'United States','T2');
INSERT INTO account VALUES ('AC22','Elizabeth1102!!','Sarasota','FL',34230,'United States','T1');
INSERT INTO account VALUES ('AC23','AlexandrA0517??','Chinatown','NY',10013,'United States','T3');
INSERT INTO account VALUES ('AC24','Al3xC00pisG04t!','Tempe','AZ',85218,'United States','T3');
INSERT INTO account VALUES ('AC25','theR1zzl3r08?','Denver','CO',80239,'United States','T4');
INSERT INTO account VALUES ('AC26','Ol1v3rIStheCut3stD0g!','Solvang','CA',93426,'United States','T1');
INSERT INTO account VALUES ('AC27','h7fbeiWHIDBow933hyv','Kent','OH',44242,'United States','T2');
INSERT INTO account VALUES ('AC28','p4ssw0rdsar3c00l!','Charlottesville','VA',22903,'United States','T4');
INSERT INTO account VALUES ('AC29','w4h00w4$','Altoona','PA',16601,'United States','T4');
INSERT INTO account VALUES ('AC30','t4l0rsw!ftisl4me','New York','NY',10001,'United States','T3');

INSERT INTO accphone VALUES (1111111111,'AC1');
INSERT INTO accphone VALUES (2222222222,'AC2');
INSERT INTO accphone VALUES (3333333333,'AC3');
INSERT INTO accphone VALUES (4444444444,'AC4');
INSERT INTO accphone VALUES (5555555555,'AC5');
INSERT INTO accphone VALUES (6666666666,'AC6');
INSERT INTO accphone VALUES (7777777777,'AC7');
INSERT INTO accphone VALUES (8888888888,'AC8');
INSERT INTO accphone VALUES (9999999999,'AC9');
INSERT INTO accphone VALUES (0000000000,'AC10');
INSERT INTO accphone VALUES (1211211212,'AC11');
INSERT INTO accphone VALUES (2122122121,'AC12');
INSERT INTO accphone VALUES (2322322323,'AC13');
INSERT INTO accphone VALUES (3233233232,'AC13');
INSERT INTO accphone VALUES (3433433434,'AC14');
INSERT INTO accphone VALUES (4344344343,'AC15');
INSERT INTO accphone VALUES (4544544545,'AC16');
INSERT INTO accphone VALUES (5455455454,'AC17');
INSERT INTO accphone VALUES (5655655656,'AC18');
INSERT INTO accphone VALUES (6566566565,'AC19');
INSERT INTO accphone VALUES (6766766767,'AC20');
INSERT INTO accphone VALUES (7677677676,'AC21');
INSERT INTO accphone VALUES (7877877878,'AC22');
INSERT INTO accphone VALUES (8788788787,'AC23');
INSERT INTO accphone VALUES (8988988989,'AC24');
INSERT INTO accphone VALUES (9899899898,'AC25');
INSERT INTO accphone VALUES (9099099090,'AC26');
INSERT INTO accphone VALUES (0900900909,'AC27');
INSERT INTO accphone VALUES (1011011010,'AC28');
INSERT INTO accphone VALUES (0100100101,'AC29');
INSERT INTO accphone VALUES (0010010001,'AC30');

INSERT INTO accmail VALUES ('claypool@me.com','AC1');
INSERT INTO accmail VALUES ('kourai@live.com','AC2');
INSERT INTO accmail VALUES ('mlewan@icloud.com','AC3');
INSERT INTO accmail VALUES ('pgolle@optonline.net','AC4');
INSERT INTO accmail VALUES ('benits@optonline.net','AC5');
INSERT INTO accmail VALUES ('delpino@mac.com','AC6');
INSERT INTO accmail VALUES ('chinthaka@aol.com','AC7');
INSERT INTO accmail VALUES ('alastair@me.com','AC8');
INSERT INTO accmail VALUES ('jmmuller@outlook.com','AC9');
INSERT INTO accmail VALUES ('dmath@att.net','AC10');
INSERT INTO accmail VALUES ('forsberg@yahoo.ca','AC11');
INSERT INTO accmail VALUES ('lamprecht@outlook.com','AC12');
INSERT INTO accmail VALUES ('biddiewise@aol.com','AC13');
INSERT INTO accmail VALUES ('georgiewise@aol.com','AC14');
INSERT INTO accmail VALUES ('kurtbitca@protonmail.com','AC15');
INSERT INTO accmail VALUES ('perryopen-minded@mac.com','AC16');
INSERT INTO accmail VALUES ('disgustedtoby@outlook.com','AC17');
INSERT INTO accmail VALUES ('dismayedlex@me.com','AC18');
INSERT INTO accmail VALUES ('selfconsciousalvie@mac.com','AC19');
INSERT INTO accmail VALUES ('tendernessruss@att.net','AC20');
INSERT INTO accmail VALUES ('rebuffaustere@hotmail.com','AC21');
INSERT INTO accmail VALUES ('stripextra-large@aol.com','AC22');
INSERT INTO accmail VALUES ('assumenoxious@msn.com','AC23');
INSERT INTO accmail VALUES ('deriveshallow@me.com','AC24');
INSERT INTO accmail VALUES ('accustomdutiful@comcast.net','AC25');
INSERT INTO accmail VALUES ('stressincompatible@att.net','AC26');
INSERT INTO accmail VALUES ('puckerglittering@sbcglobal.net','AC27');
INSERT INTO accmail VALUES ('bestowklutzy@verizon.net','AC28');
INSERT INTO accmail VALUES ('replacecomplicated@gmail.com','AC29');
INSERT INTO accmail VALUES ('distortmean@mac.com','AC30');

INSERT INTO user VALUES ('U1','salmaaljaidi','Salma','Aljaidi','2002-09-19','zqfri23j240Nt8','sa2qt@virginia.edu',5713313749,1,'AC1');
INSERT INTO user VALUES ('U2','mariazafar','Maria','Zafar','2002-06-27','MickeyMouse!','mz6gw@virginia.edu',7036534004,1,'AC2');
INSERT INTO user VALUES ('U3','ashleydurastanti','Ashley','Durastanti','2002-05-02','IL0ve$p0tify','kmm7kd@virginia.edu',5713144844,1,'AC3');
INSERT INTO user VALUES ('U4','shravyashetty','Shravya','Shetty','2002-08-09','myD0GisCute!','sms5hh@virginia.edu',8049372261,1,'AC4');
INSERT INTO user VALUES ('U5','joegoldburg','Joe','Goldburg','2001-06-09','hg84bf9Wafh4','serialkllr@gmail.com',9940841145,1,'AC5');
INSERT INTO user VALUES ('U6','benbarnes','Ben','Barnes','1985-02-12','afAef3333f45','darkling@yahoo.com',7878420083, 1,'AC6');
INSERT INTO user VALUES ('U7','elenagilbert','Elena','Gilbert','1983-12-30','YouFeedtHEfiSh?','annoyingmf@gmail.com',4146482283,1,'AC7');
INSERT INTO user VALUES ('U8','stefansalvatore','Stefan','Salvatore','2000-04-08','hf4BF9fff0297b','handsomeherohair2@icloud.com',3358848829,1,'AC8');
INSERT INTO user VALUES ('U9','tomriddle','Tom','Riddle','1998-09-10','Marie0716?','2hot2bevil@yahoo.com',9949938324,1,'AC9');
INSERT INTO user VALUES ('U10','jonsnow','Jon','Snow','1999-10-10','J80bf7EbF&hh','lordcommander@hotmail.com',4850583384,1,'AC10');
INSERT INTO user VALUES ('U11','anthonybridgerton','Anthony','Bridgerton','1976-11-11','$occ3rIsL1f3','viscountb@yahoo.com',7860848009,1,'AC11');
INSERT INTO user VALUES ('U12','katesharma','Kate','Sharma','2000-09-24','WeL0v3C0MM','indianqueen26@gmail.com',5718834869,1,'AC12');
INSERT INTO user VALUES ('U13','tophbeifong','Toph','Beifong','2004-03-28','hf777Beowne832','blindbandit111@yahoo.com',6700098248,1,'AC13');
INSERT INTO user VALUES ('U14','sansastark','Sansa','Stark','1996-07-18','p4ssw0rd!!','queeninthenorth2@outlook.com',3537728592,1,'AC14');
INSERT INTO user VALUES ('U15','phildunphy','Phil','Dunphy','1996-02-28','th1sisM7p4sswr0rd','philsosphy87@gmail.com',7728758883,1,'AC15');
INSERT INTO user VALUES ('U16','bellaswan','Bella','Swan','1991-09-08','pqzsa4frk7892bKMLS','loca123@gmail.com',7033097934,1,'AC16');
INSERT INTO user VALUES ('U17','katnisseverdeen','Katniss','Everdeen','2002-04-29','MuSiCiSlIfE1!','mockingjayslay@gmail.com',7036232728,1,'AC17');
INSERT INTO user VALUES ('U18','marystuart','Mary','Stuart','2001-08-30','$potifyistheBEST!','scotlandxoxo1524@hotmail.com',4344490939,1,'AC18');
INSERT INTO user VALUES ('U19','christinayang','Cristina','Yang','2000-10-17','MACM1LL3Rrip','cardiokween99@icloud.com',5409872022,1,'AC19');
INSERT INTO user VALUES ('U20','dracomalfoy','Draco','Malfoy','2001-06-04','Fr4nkOc3an!','sexymfytboy@hogwarts.edu',5328828579,1,'AC20');
INSERT INTO user VALUES ('U21','klausmikaelson','Klaus','Mikaelson','1997-01-27','3lvisIStheK1ng$$','rippahhh666@gmail.com',5718760093,1,'AC21');
INSERT INTO user VALUES ('U22','tyrionlannister','Tyrion','Lannister','1997-10-31','Elizabeth1102!!','bestcharacter1@yahoo.com',7039722284,1,'AC22');
INSERT INTO user VALUES ('U23','rhaenyratargaryen','Rhaenyra','Targaryen','2000-01-02','AlexandrA0517??','justifiedwarcrimes@outlook.com',3039822482,1,'AC23');
INSERT INTO user VALUES ('U24','andrewgarfield','Andrew','Garfield','1983-08-12','Al3xC00pisG04t!','h0ttestspiderman@gmail.com',6771347793,1,'AC24');
INSERT INTO user VALUES ('U25','buckybarnes','Bucky','Barnes','1985-12-26','theR1zzl3r08?','w1nters0ldier@yahoo.com',5400078581,1,'AC25');
INSERT INTO user VALUES ('U26','kathrinepierce','Katherine','Pierce','1990-11-19','0l1v3rIStheCut3stD0g!','badbxtch89@yahoo.com',7579861112,1,'AC26');
INSERT INTO user VALUES ('U27','gloriapritchett','Gloria','Pritchett','2001-04-01','h7rhEIUFH93s','trophywife77@outlook.com',5716340997,1,'AC27');
INSERT INTO user VALUES ('U28','kazbrekker','Kaz','Brekker','1999-11-23','p4ssw0rdsar3c00l!','sixofcrows9@gmail.com',8093426651,1,'AC28');
INSERT INTO user VALUES ('U29','cardangreenbriar','Cardan','Greenbriar','2000-02-20','w4h00w4$','railwthetail@yahoo.com',4346660986,1,'AC29');
INSERT INTO user VALUES ('U30','annabethchase','Annabeth','Chase','2004-07-07','t4l0rsw!ftisl4me','wisegirl44@gmail.com',3046248834,1,'AC30');
INSERT INTO user VALUES ('U31','clairedunphy','Claire','Dunphy','1971-09-29','ha!eya1exluke','clairepd@gmail.com',708758983,0,'AC15');
INSERT INTO user VALUES ('U32','edwardcullen','Edward','Cullen','1999-09-01','f0rks!','skinofakller@gmail.com',7033908343,0,'AC16');
INSERT INTO user VALUES ('U33','peetamellark','Peeta','Mellark','2005-09-25','il0veBRead7!','breadb0y@gmail.com',7036032028,0,'AC7');
INSERT INTO user VALUES ('U34','francisvalois','Francis','Valois','2001-04-30','Mary123','dauphin1@hotmail.com',4344990989,0,'AC18');
INSERT INTO user VALUES ('U35','meredithgrey','Meredith','Grey','2002-11-12','derek$hep','chiefofgen@icloud.com',4344990989,0,'AC18');
INSERT INTO user VALUES ('U36','herminonegranger','Hermione','Granger','2001-09-04','Cr00k$ank$','dramione1@hogwarts.edu',2428624185,0,'AC20');
INSERT INTO user VALUES ('U37','carolineforbes','Caroline','Forbes','1997-08-27','K!aro!ine','vampirebarbie@gmail.com',5791160793,0,'AC2');
INSERT INTO user VALUES ('U38','margaerytyrell','Margaery','Tyrell','1992-11-30','H!ghgarden','kweenofwesteros@yahoo.com',7039722184,0,'AC10');
INSERT INTO user VALUES ('U39','daemontargaryen','Daemon','Targaryen','2002-08-02','carAXe$1','keepitinthefamily@outlook.com',3530022498,0,'AC23');
INSERT INTO user VALUES ('U40','selenagomez','Selena','Gomez','1988-03-12','a!exru$$0','teamselenafhailey@gmail.com',6778839953,0,'AC4');
INSERT INTO user VALUES ('U41','zendayacoleman','Zendaya','Coleman','1985-10-28','t0mh0!!and','2emmys@yahoo.com',5400078501,0,'AC25');
INSERT INTO user VALUES ('U42','kaiparker','Kai','Parker','1996-11-18','c0braka!','hotsiphon@yahoo.com',7577861212,0,'AC26');
INSERT INTO user VALUES ('U43','jaypritchett','Jay','Pritchett','2003-08-01','cL0SEts!!!','closets55@outlook.com',5405731234,0,'AC12');
INSERT INTO user VALUES ('U44','blakelively','Blake','Lively','1994-12-23','ryanreynoldsxoxo!','gossipgirl7@gmail.com',8042336601,0,'AC28');
INSERT INTO user VALUES ('U45','taylorswift','Taylor','Swift','1989-02-03','erast0ur2023','midnightrain1989@yahoo.com',4345530113,0,'AC1');

INSERT INTO publishedby VALUES ('B1','P1');
INSERT INTO publishedby VALUES ('B2','P2');
INSERT INTO publishedby VALUES ('B3','P3');
INSERT INTO publishedby VALUES ('B4','P4');
INSERT INTO publishedby VALUES ('B5','P5');
INSERT INTO publishedby VALUES ('B6','P6');
INSERT INTO publishedby VALUES ('B7','P7');
INSERT INTO publishedby VALUES ('B8','P8');
INSERT INTO publishedby VALUES ('B9','P9');
INSERT INTO publishedby VALUES ('B10','P1');
INSERT INTO publishedby VALUES ('B11','P1');
INSERT INTO publishedby VALUES ('B12','P1');
INSERT INTO publishedby VALUES ('B13','P10');
INSERT INTO publishedby VALUES ('B14','P11');
INSERT INTO publishedby VALUES ('B15','P12');
INSERT INTO publishedby VALUES ('B16','P13');
INSERT INTO publishedby VALUES ('B17','P14');
INSERT INTO publishedby VALUES ('B18','P15');
INSERT INTO publishedby VALUES ('B19','P16');
INSERT INTO publishedby VALUES ('B20','P16');
INSERT INTO publishedby VALUES ('B21','P16');
INSERT INTO publishedby VALUES ('B22','P16');
INSERT INTO publishedby VALUES ('B23','P9');
INSERT INTO publishedby VALUES ('B24','P17');
INSERT INTO publishedby VALUES ('B25','P18');
INSERT INTO publishedby VALUES ('B26','P19');
INSERT INTO publishedby VALUES ('B27','P20');
INSERT INTO publishedby VALUES ('B28','P9');
INSERT INTO publishedby VALUES ('B29','P21');
INSERT INTO publishedby VALUES ('B30','P22');

INSERT INTO writtenby VALUES ('B1','A1');
INSERT INTO writtenby VALUES ('B2','A2');
INSERT INTO writtenby VALUES ('B3','A3');
INSERT INTO writtenby VALUES ('B4','A4');
INSERT INTO writtenby VALUES ('B5','A5');
INSERT INTO writtenby VALUES ('B6','A6');
INSERT INTO writtenby VALUES ('B7','A7');
INSERT INTO writtenby VALUES ('B8','A8');
INSERT INTO writtenby VALUES ('B9','A9');
INSERT INTO writtenby VALUES ('B10','A1');
INSERT INTO writtenby VALUES ('B11','A10');
INSERT INTO writtenby VALUES ('B12','A10');
INSERT INTO writtenby VALUES ('B13','A11');
INSERT INTO writtenby VALUES ('B14','A12');
INSERT INTO writtenby VALUES ('B15','A13');
INSERT INTO writtenby VALUES ('B16','A14');
INSERT INTO writtenby VALUES ('B17','A15');
INSERT INTO writtenby VALUES ('B18','A16');
INSERT INTO writtenby VALUES ('B19','A17');
INSERT INTO writtenby VALUES ('B20','A17');
INSERT INTO writtenby VALUES ('B21','A17');
INSERT INTO writtenby VALUES ('B22','A17');
INSERT INTO writtenby VALUES ('B23','A11');
INSERT INTO writtenby VALUES ('B24','A18');
INSERT INTO writtenby VALUES ('B25','A19');
INSERT INTO writtenby VALUES ('B26','A20');
INSERT INTO writtenby VALUES ('B27','A21');
INSERT INTO writtenby VALUES ('B28','A22');
INSERT INTO writtenby VALUES ('B29','A23');
INSERT INTO writtenby VALUES ('B30','A24');

INSERT INTO ispurchasedby VALUES ('AB1','U1');
INSERT INTO ispurchasedby VALUES ('AB2','U3');
INSERT INTO ispurchasedby VALUES ('AB2','U4');
INSERT INTO ispurchasedby VALUES ('AB3','U5');
INSERT INTO ispurchasedby VALUES ('AB3','U6');
INSERT INTO ispurchasedby VALUES ('AB4','U7');
INSERT INTO ispurchasedby VALUES ('AB4','U8');
INSERT INTO ispurchasedby VALUES ('AB5','U9');
INSERT INTO ispurchasedby VALUES ('AB5','U10');
INSERT INTO ispurchasedby VALUES ('AB6','U11');
INSERT INTO ispurchasedby VALUES ('AB6','U12');
INSERT INTO ispurchasedby VALUES ('AB7','U13');
INSERT INTO ispurchasedby VALUES ('AB7','U14');
INSERT INTO ispurchasedby VALUES ('AB8','U15');
INSERT INTO ispurchasedby VALUES ('AB8','U16');
INSERT INTO ispurchasedby VALUES ('AB9','U17');
INSERT INTO ispurchasedby VALUES ('AB9','U18');
INSERT INTO ispurchasedby VALUES ('AB10','U19');
INSERT INTO ispurchasedby VALUES ('AB10','U20');
INSERT INTO ispurchasedby VALUES ('AB11','U21');
INSERT INTO ispurchasedby VALUES ('AB11','U22');
INSERT INTO ispurchasedby VALUES ('AB12','U23');
INSERT INTO ispurchasedby VALUES ('AB12','U24');
INSERT INTO ispurchasedby VALUES ('AB13','U25');
INSERT INTO ispurchasedby VALUES ('AB13','U26');
INSERT INTO ispurchasedby VALUES ('AB14','U27');
INSERT INTO ispurchasedby VALUES ('AB14','U28');
INSERT INTO ispurchasedby VALUES ('AB15','U29');
INSERT INTO ispurchasedby VALUES ('AB15','U30');
INSERT INTO ispurchasedby VALUES ('AB16','U31');
INSERT INTO ispurchasedby VALUES ('AB16','U32');
INSERT INTO ispurchasedby VALUES ('AB17','U33');
INSERT INTO ispurchasedby VALUES ('AB17','U34');
INSERT INTO ispurchasedby VALUES ('AB18','U35');
INSERT INTO ispurchasedby VALUES ('AB18','U36');
INSERT INTO ispurchasedby VALUES ('AB19','U37');
INSERT INTO ispurchasedby VALUES ('AB19','U38');
INSERT INTO ispurchasedby VALUES ('AB20','U39');
INSERT INTO ispurchasedby VALUES ('AB20','U40');
INSERT INTO ispurchasedby VALUES ('AB21','U41');
INSERT INTO ispurchasedby VALUES ('AB21','U42');
INSERT INTO ispurchasedby VALUES ('AB22','U43');
INSERT INTO ispurchasedby VALUES ('AB22','U44');
INSERT INTO ispurchasedby VALUES ('AB23','U45');
INSERT INTO ispurchasedby VALUES ('AB23','U1');
INSERT INTO ispurchasedby VALUES ('AB24','U2');
INSERT INTO ispurchasedby VALUES ('AB24','U3');
INSERT INTO ispurchasedby VALUES ('AB25','U4');
INSERT INTO ispurchasedby VALUES ('AB25','U5');
INSERT INTO ispurchasedby VALUES ('AB26','U6');
INSERT INTO ispurchasedby VALUES ('AB26','U7');
INSERT INTO ispurchasedby VALUES ('AB27','U8');
INSERT INTO ispurchasedby VALUES ('AB27','U9');
INSERT INTO ispurchasedby VALUES ('AB28','U10');
INSERT INTO ispurchasedby VALUES ('AB28','U11');
INSERT INTO ispurchasedby VALUES ('AB29','U12');
INSERT INTO ispurchasedby VALUES ('AB29','U13');
INSERT INTO ispurchasedby VALUES ('AB30','U14');
INSERT INTO ispurchasedby VALUES ('AB30','U15');
INSERT INTO ispurchasedby VALUES ('AB1','U16');
INSERT INTO ispurchasedby VALUES ('AB2','U17');
INSERT INTO ispurchasedby VALUES ('AB3','U18');
INSERT INTO ispurchasedby VALUES ('AB4','U19');
INSERT INTO ispurchasedby VALUES ('AB5','U20');
INSERT INTO ispurchasedby VALUES ('AB6','U21');
INSERT INTO ispurchasedby VALUES ('AB7','U22');
INSERT INTO ispurchasedby VALUES ('AB8','U23');
INSERT INTO ispurchasedby VALUES ('AB9','U24');
INSERT INTO ispurchasedby VALUES ('AB10','U25');
INSERT INTO ispurchasedby VALUES ('AB11','U26');
INSERT INTO ispurchasedby VALUES ('AB12','U27');
INSERT INTO ispurchasedby VALUES ('AB13','U28');
INSERT INTO ispurchasedby VALUES ('AB14','U29');
INSERT INTO ispurchasedby VALUES ('AB17','U32');
INSERT INTO ispurchasedby VALUES ('AB18','U33');
INSERT INTO ispurchasedby VALUES ('AB19','U34');
INSERT INTO ispurchasedby VALUES ('AB20','U35');
INSERT INTO ispurchasedby VALUES ('AB21','U36');
INSERT INTO ispurchasedby VALUES ('AB22','U37');
INSERT INTO ispurchasedby VALUES ('AB23','U38');
INSERT INTO ispurchasedby VALUES ('AB24','U39');
INSERT INTO ispurchasedby VALUES ('AB25','U40');
INSERT INTO ispurchasedby VALUES ('AB26','U41');
INSERT INTO ispurchasedby VALUES ('AB27','U42');
INSERT INTO ispurchasedby VALUES ('AB28','U43');
INSERT INTO ispurchasedby VALUES ('AB29','U44');
INSERT INTO ispurchasedby VALUES ('AB30','U45');