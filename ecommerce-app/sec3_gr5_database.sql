-- Database Create
DROP DATABASE IF EXISTS SEC03GR05WEBPROGRAMMING;
CREATE DATABASE IF NOT EXISTS `SEC03GR05WEBPROGRAMMING`;
USE `SEC03GR05WEBPROGRAMMING`;

-- Table Admin_Account
-- DROP TABLE IF EXISTS `Admin_Account`
CREATE TABLE `Admin_Account` (
    `admin_username` VARCHAR(20) NOT NULL,
    `admin_phone_number` VARCHAR(13) NOT NULL,
    `admin_image` VARCHAR(500) NOT NULL,
    `admin_fname` VARCHAR(20) NOT NULL,
    `admin_lname` VARCHAR(20) NOT NULL,
    `admin_position` VARCHAR(20) NOT NULL
);

-- Set Admin_Account PK
ALTER TABLE `Admin_Account`
  ADD PRIMARY KEY (`admin_username`);

  
-- Show table of Admin_Account
SHOW TABLES;
SELECT `admin_username`, `admin_phone_number`, `admin_image`, `admin_fname`, `admin_lname`, `admin_position` FROM `Admin_Account`;

-- Table Login
-- DROP TABLE IF EXISTS `Login`
CREATE TABLE `Login` (
    `login_email` VARCHAR(40) NOT NULL,
    `login_password` VARCHAR(20) NOT NULL
);

-- Set Login PK
ALTER TABLE `Login`
  ADD PRIMARY KEY (`login_email`);


-- Show table of Login
SHOW TABLES;
SELECT  `login_email`, `login_password` FROM `Login`;

-- Table Product
-- DROP TABLE IF EXISTS `Product`
CREATE TABLE `Product` (
    `prod_SKU` VARCHAR(20) NOT NULL,
    `status` VARCHAR(10) ,
    `prod_image1` VARCHAR(200) NOT NULL,
    `prod_image2` VARCHAR(200) ,
    `prod_image3` VARCHAR(200) ,
    `prod_image4` VARCHAR(200) ,
    `prod_name` VARCHAR(100) NOT NULL,
    `prod_brand` VARCHAR(20) NOT NULL,
    `prod_category` VARCHAR(20) NOT NULL,
    `prod_additional_info` VARCHAR(500),
    `prod_description` VARCHAR(500) NOT NULL,
    `prod_price` FLOAT NOT NULL,
    `prod_quantity` INT NOT NULL
);
-- Set Product PK
ALTER TABLE `Product`
  ADD PRIMARY KEY (`prod_SKU`);
  
-- Show table of Product
SHOW TABLES;
SELECT  `prod_SKU`, `prod_image1`, `prod_image2`, `prod_image3`,`prod_image4`,`prod_name`,`prod_brand`,`prod_category`, `prod_additional_info`, `prod_description`, `prod_price`, `prod_quantity` FROM `Product`;

INSERT INTO `Admin_Account` (`admin_username`, `admin_phone_number`, `admin_image`, `admin_fname`, `admin_lname`, `admin_position`) VALUES
	('dobby','098-325-6751','https://politics.princeton.edu/sites/default/files/styles/square/public/images/p-5.jpeg?h=87dbaab7&itok=ub6jAL5Q','dobbie', 'doha', 'Admin executive'),
	('amy_024','096-715-7685','https://global.upenn.edu/sites/default/files/styles/500x375_person_featured_picture_crop/public/2018-04/Warith.jpg?h=01701346&itok=gHSAdsT9','amy', 'amsterdam', 'Admin'),
	('sarah','062-877-7438','https://images.unsplash.com/photo-1612000529646-f424a2aa1bff?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','sarah', 'sydney', 'Admin'),
	('emily','097-868-7637','https://images.unsplash.com/photo-1676385901184-b1884f3f2979?w=420&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8cTA0Q3hwcUo0SlF8fGVufDB8fHx8fA%3D%3D','emily', 'estonia', 'Admin'),
	('david','086-482-1563','https://img.freepik.com/free-photo/lifestyle-beauty-fashion-people-emotions-concept-young-asian-female-office-manager-ceo-with-pleased-expression-standing-white-background-smiling-with-arms-crossed-chest_1258-59329.jpg','david', 'denmark', 'Admin'),
	('robby_7788','094-234-2645','https://image.shutterstock.com/image-photo/portrait-young-smiling-woman-looking-260nw-1865153395.jpg','robby', 'rome', 'Admin'),
	('modhaha','083-471-3652','https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?cs=srgb&dl=pexels-stefan-stefancik-91227.jpg&fm=jpg','modhaha', 'moscow', 'Admin'),
	('chris','099-936-1372','https://sesameworkshop.org/wp-content/uploads/2023/09/SW23_CHRIS_KNOWINGS_041.png','chris', 'canberra', 'Admin'),
	('bobbybuby','085-235-6673','https://static.toiimg.com/thumb/msid-86553943,width-1280,height-720,resizemode-4/86553943.jpg','bobbybuby', 'berlin', 'Admin'),
	('fishy','082-134-2374','https://ogletree.com/app/uploads/people/paul-clair-2023-04.jpg','fishy', 'freetown', 'Admin');
   
INSERT INTO `Login` (`login_email`, `login_password`) VALUES 
        ('dadadadi@gmail.com', 'dada77y8'),
        ('merody@gmail.com', 'merodysong'),
        ('fallin@gmail.com', 'sarah5555'),
 	    ('Y.ibs@gmail.com', 'emilyintheparis'),
        ('rose.p@gmail.com', 'davidlove54'),
        ('robby_susu@gmail.com','robbywitheng'),
        ('noddara@gmail.com','mod88h'),
        ('chris.zz@gmail.com', 'easybaby'),
 	    ('bobby.127@gmail.com', 'babubara'),
        ('fisher.king@gmail.com', 'fisher1king');

INSERT INTO `Product` (`prod_SKU`, `status`,`prod_image1`, `prod_image2`, `prod_image3`, `prod_image4` ,`prod_name` , `prod_brand`, `prod_category`, `prod_additional_info`, `prod_description`, `prod_price`, `prod_quantity`) VALUES
		('4948872415927',NULL,'https://media-cdn.bnn.in.th/374382/Sony-PlayStation-5-Slim-Disc-Edition-2-square_medium.jpg','https://media-cdn.bnn.in.th/374383/Sony-PlayStation-5-Slim-Disc-Edition-3-square_medium.jpg','https://dl.lnwfile.com/_/dl/_raw/cv/2s/o8.jpg',NULL,'Sony PlayStation 5 Slim Disc Edition','SONY','Gaming Gear','Compact size and reduced weight, 1TB SSD capacity Supports Ultra HD Blu-ray disc playback
																																	  Realistic shadow generation with the simulation of each ray of light Warranty: 1 year','The PS5 Slim Design game console is a newly designed Disc Edition that offers greater flexibility and usability. It has been designed to be smaller in size and lighter in weight while maintaining the same high quality. Powered by a dedicated CPU, GPU, and SSD, it ensures optimal performance.', 48900.00, 25),
		('1942533877945',NULL,'https://media-cdn.bnn.in.th/348496/dell-desktop-aio-inspiron-5420-id5420tp1j1001ogth-black-1-square_medium.jpg','https://media-cdn.bnn.in.th/348500/dell-desktop-aio-inspiron-5420-id5420tp1j1001ogth-black-5-square_medium.jpg','https://media-cdn.bnn.in.th/348497/dell-desktop-aio-inspiron-5420-id5420tp1j1001ogth-black-2-square_medium.jpg',NULL,'DELL DESKTOP AIO INSPIRON 5420-ID5420TP1J1001OGTH BLACK','DELL','Desktop',NULL,'The Dell Inspiron comes equipped with a 13th generation Intel Core i3 processor and 16GB of DDR4 RAM, ensuring smooth and fast performance for various tasks.',19990.00,50),
        ('4948872615938',NULL,'https://media-cdn.bnn.in.th/360987/PlayStation-PS5-G-Rise-of-the-Ronin-1-square_medium.jpg','https://media-cdn.bnn.in.th/360988/PlayStation-PS5-G-Rise-of-the-Ronin-2-square_medium.jpg','https://media-cdn.bnn.in.th/360989/PlayStation-PS5-G-Rise-of-the-Ronin-3-square_medium.jpg',NULL,'PS5 : Rise of the Ronin','PLAYSTATION','Gaming Gear',NULL,'Rise of the Ronin is an open-world action-adventure game that takes you on an immersive journey into 19th-century Japan, a period known for conflict and transformation.',2290.00,15),
		('1942533744043',NULL,'https://media-cdn.bnn.in.th/234727/iPhone_14_Plus_Blue_PDP_Image_Position-1A_Blue_1-square_medium.jpg','https://media-cdn.bnn.in.th/234728/iPhone_14_Plus_Blue_PDP_Image_Position-1A_Blue_2-square_medium.jpg','https://media-cdn.bnn.in.th/234729/iPhone_14_Plus_Blue_PDP_Image_Position-1A_Blue_3-square_medium.jpg',NULL,'Apple iPhone 14 Plus 128GB Blue','APPLE','SmartPhone','Super Retina XDR display measuring 6.7 inches
							 An advanced camera system for improved photography in all lighting conditions
							 Movie mode now available in Dolby Vision 4K at up to 30 fps
							 Ultra-fast 5G cellular system','The iPhone 14 Plus boasts a larger 6.7-inch display for a more immersive experience, along with an all-day battery life. Additionally, it captures stunning photos even in low-light and high-light conditions with its new dual-camera system. ',28900.00,44),
		('4711081915379',NULL,'https://media-cdn.bnn.in.th/306118/ASUS-DESKTOP-TW-ROG-STRIX-G10DK-R5600X171W-GRAY-(A)-1-square_medium.jpg','https://media-cdn.bnn.in.th/367885/asus-desktop-tw-rog-g22ch-1370kf128w-dark-gray-2-square_medium.jpg','https://media-cdn.bnn.in.th/367886/asus-desktop-tw-rog-g22ch-1370kf128w-dark-gray-3-square_medium.jpg',NULL,'ASUS DESKTOP TW ROG STRIX GRAY','ASUS','Gaming Desktop','AMD Ryzen 5 5600X
							 RAM 16GB DDR4 
							 NVIDIA GeForce RTX 2060S ','The ROG Strix G10DK is a top-tier desktop that comes with the latest Windows 11 Home operating system, delivering an exhilarating gaming experience.',24990.00,32),
		('4948872415958',NULL,'https://media-cdn.bnn.in.th/316736/Sony-PlayStation-5-Access-Controller-1-square_medium.jpg','https://media-cdn.bnn.in.th/316737/Sony-PlayStation-5-Access-Controller-2-square_medium.jpg','https://media-cdn.bnn.in.th/316738/Sony-PlayStation-5-Access-Controller-3-square_medium.jpg',NULL,'Sony PlayStation 5 Access Controller','SONY','Gaming Gear','Adaptable joystick and customizable button heads
							 Adjustable stick length for flexibility
							 Flexible, meeting structural needs
							 Game joystick for users with disabilities','Designed to enhance accessibility, it allows gamers with disabilities to play comfortably and for extended periods.',3090.00,10),
		('4711387186442',NULL,'https://media-cdn.bnn.in.th/315631/Asus-ROG-Ally-7-square_medium.jpg','https://th.store.asus.com/media/catalog/product/r/c/rc71l-nh001w_2_.jpg?width=439&height=439&store=rog_th_TH&image-type=image','https://th.store.asus.com/media/catalog/product/r/c/rc71l-nh001w_4_.jpg?width=439&height=439&store=rog_th_TH&image-type=image',NULL,'Asus ROG Ally','ASUS','Gaming Gear',NULL,'The Asus ROG Ally brings a transformative gaming experience on-the-go with a 7-inch Full HD display and Windows 11 operating system.',2890.00,7),
		('6941565971371','HOT','https://media-cdn.bnn.in.th/371419/DJI-MIC-2-Wireless-1TX-1RX-1-square_medium.jpg','https://www.abshop.in.th/wp-content/uploads/2024/02/Mic-2-1-TX-1-RX-CE-04.jpg','https://www.abshop.in.th/wp-content/uploads/2024/02/Mic-2-1-TX-1-RX-CE-05.jpg',NULL,'DJI MIC 2 Wireless (1TX+1RX)','DJI','Gaming Gear',NULL,'Portable microphone with charging, lightweight, supports both Mono and Stereo sound recording, and provides extended usage for up to 6 hours.',7500.00,21),
		('1942533241572','HOT','https://media-cdn.bnn.in.th/236114/Apple-Acc-AirPods-(3rd%C2%A0generation)-with-Lightning-Charging-Case-1-square_medium.jpg','https://media-cdn.bnn.in.th/240098/AirPods-(3rd-generation)-with-Lightning-Charging-square_medium.jpg','https://media-cdn.bnn.in.th/236118/Apple-Acc-AirPods-(3rd%C2%A0generation)-with-Lightning-Charging-Case-5-square_medium.jpg',NULL,'Apple AirPods (3rd gen) with Lightning Charging Case','APPLE','Accessories','Can withstand sweat and water
							 Up to 30 hours of total listening time
							 Lightning connection port','True Wireless headphones that provide a cinema-like sound experience with positional audio, making you feel like you are in a theater. They feature the ability to control call reception or hang-up, and quick access to Siri by simply saying "Hey Siri".',6790.00,38),
		('4711387452271','NEW','https://media-cdn.bnn.in.th/373451/asus-tuf-gaming-rtx4080-super-16g-vga-1-square_medium.jpg','https://media-cdn.bnn.in.th/341381/asus-tuf-gaming-radeon-rx7700xt-oc-edition-12gb-gddr6-8-square_medium.jpg','https://media-cdn.bnn.in.th/341377/asus-tuf-gaming-radeon-rx7700xt-oc-edition-12gb-gddr6-4-square_medium.jpg',NULL,'ASUS TUF Gaming GeForce RTX 4080 SUPER 16GB GDDR6X 256-bit','ASUS','Computer Hardware','GPU: GeForce RTX 4080 SUPER , Boost Clock: 2550 MHz (OC mode : 2580 MHz), Video Memory: 16GB GDDR6X 256-bit','The ASUS TUF Gaming GeForce RTX 4080 SUPER with 16GB GDDR6X delivers high-performance graphics capabilities thanks to the NVIDIA Ada Lovelace architecture.',43300.00, 26),
	    ('8739236379103','NEW','https://media-cdn.bnn.in.th/305381/MacBook_Air_15_in_M2_Midnight_1-square_medium.jpg','https://media-cdn.bnn.in.th/305380/MacBook_Air_15_in_M2_Midnight_2-square_medium.jpg','https://media-cdn.bnn.in.th/305378/MacBook_Air_15_in_M2_Midnight_4-square_medium.jpg','https://media-cdn.bnn.in.th/305376/MacBook_Air_15_in_M2_Midnight_6-square_medium.jpg','Apple MacBook Air 15 : M2 chip', 'APPLE','Desktop',NULL,'The 15-inch MacBook Air is perfect for multitasking and seamlessly viewing your ideas on the stunning Liquid Retina display that comes with the device. Additionally, it is powered by the impressive M2 chip and boasts a battery life of up to 18 hours.',47900.00, 20),
		('100059438194','NEW' ,'https://media-cdn.bnn.in.th/374292/jonsbo-tk-2-20-black-case-9-square_medium.jpg', 'https://media-cdn.bnn.in.th/374293/jonsbo-tk-2-20-black-content-1.jpg','https://media-cdn.bnn.in.th/374285/jonsbo-tk-2-20-black-case-2-square_medium.jpg',NULL,'Jonsbo TK-2 2.0 Black', 'JONSBO', 'Gaming Gear', 'Supports CPU cooler height of 165mm, GPU length of 405mm, PSU length of 220m', 'The Jonsbo TK-2 case is an evolution of the TK-1, maintaining its unique identity with curved glass panels on all three sides. This design allows for clear visibility of the internal hardware. It supports ATX motherboards and graphics cards up to 40.5cm in length.', 5290.00, 10),
		
		('4711387437834',NULL,'https://media-cdn.bnn.in.th/373349/asus-tuf-gaming-rtx4070ti-super-16g-oc-edition-vga-7-square_medium.jpg','https://media-cdn.bnn.in.th/373353/asus-tuf-gaming-rtx4070ti-super-16g-oc-content-1.jpg','https://media-cdn.bnn.in.th/373347/asus-tuf-gaming-rtx4070ti-super-16g-oc-edition-vga-5-square_medium.jpg','https://media-cdn.bnn.in.th/373345/asus-tuf-gaming-rtx4070ti-super-16g-oc-edition-vga-3-square_medium.jpg','ASUS TUF Gaming GeForce RTX 4070','ASUS','Computer Hardware',NULL,'The GeForce RTX 4070 Ti SUPER graphics card delivers exceptional performance with the NVIDIA Ada Lovelace architecture. It elevates performance with advanced cooling and power delivery solutions, supported by robust reinforcement across all six sides for durability.', 37100.00,25),
		('4548736132610',NULL,'https://media-cdn.bnn.in.th/203763/Sony-WH-1000XM5-Sliver-2-square_medium.jpg','https://media-cdn.bnn.in.th/203766/Sony-WH-1000XM5-Sliver-5-square_medium.jpg','https://media-cdn.bnn.in.th/203762/Sony-WH-1000XM5-Sliver-1-square_medium.jpg',NULL,'Sony WH-1000XM5 Silver','Sony','Accessories',NULL,'The Sony WH-1000XM5 wireless headphones are designed to eliminate background noise, ensuring comfortable wear with a head-hugging design. They are foldable and easy to carry, allowing for on-the-go use anytime, anywhere.',12490.00, 17),
        ('8858847091147','HOT','https://media-cdn.bnn.in.th/360876/BlueBox-PowerBank-TypeC-5200mAh-BB-PB5C-black-001-square_medium.jpg','https://media-cdn.bnn.in.th/360878/BlueBox-PowerBank-TypeC-5200mAh-BB-PB5C-black-2-square_medium.jpg','https://media-cdn.bnn.in.th/360881/BlueBox-PowerBank-TypeC-5200mAh-BB-PB5C-black-8-square_medium.jpg','https://media-cdn.bnn.in.th/360882/BlueBox-PowerBank-TypeC-5200mAh-BB-PB5C-black-9-square_medium.jpg','Power bank Blue Box 5,000mAh Type-C BB-PB5C Black','BLUE BOX','Accessories',NULL,'The Blue Box power bank is compact and lightweight, making it convenient for easy portability, even on long journeys. You will not have to worry about running out of energy, as its 5,000 mAh capacity ensures sufficient power throughout the day.',590.00,12),
        ('6942103113680','HOT','https://media-cdn.bnn.in.th/369299/Huawei-MatePad-Pro-Wi-Fi-green-1-square_medium.jpg','https://media-cdn.bnn.in.th/369303/Huawei-MatePad-Pro-Wi-Fi-green-5-square_medium.jpg','https://media-cdn.bnn.in.th/369300/Huawei-MatePad-Pro-Wi-Fi-green-2-square_medium.jpg',NULL,'Huawei MatePad Pro 13.2 Wi-Fi (12+512) Green','HUAWEI','Accessories','- ROM: 512 GB / RAM: 12 GB','The Huawei MatePad Pro 13.2 is the latest premium tablet from Huawei, featuring a 13.2-inch Flexible OLED display. It boasts fast and powerful processing capabilities, enabling seamless performance for all tasks, whether it is content consumption or productivity.',39990.00, 7),
        ('195949048623','HOT','https://media-cdn.bnn.in.th/332489/iPhone_15_Pro_Max_Natural_Titanium_2-square_medium.jpg','https://media-cdn.bnn.in.th/332486/iPhone_15_Pro_Max_Natural_Titanium_3-square_medium.jpg','https://media-cdn.bnn.in.th/332490/iPhone_15_Pro_Max_Natural_Titanium_4-square_medium.jpg','https://media-cdn.bnn.in.th/332491/iPhone_15_Pro_Max_Natural_Titanium_5-square_medium.jpg','Apple iPhone 15 Pro Max 256GB Natural Titanium','APPLE','Smartphone',NULL,'The iPhone 15 Pro Max features a robust and lightweight aluminum body, utilizing the same grade material found in the aerospace industry. Its upgraded Pro-level camera system allows for even more desired photography.', 46500.00,27),
        ('197529907092','HOT','https://media-cdn.bnn.in.th/318200/lenovo-desktop-aio-3-24iap7-fogh00x7ta-1-square_medium.jpg','https://media-cdn.bnn.in.th/318201/lenovo-desktop-aio-3-24iap7-fogh00x7ta-2-square_medium.jpg','https://media-cdn.bnn.in.th/318202/lenovo-desktop-aio-3-24iap7-fogh00x7ta-3-square_medium.jpg','https://media-cdn.bnn.in.th/318204/lenovo-desktop-aio-3-24iap7-fogh00x7ta-4-square_medium.jpg','Lenovo Ideacentre AIO','LENOVO','Desktop','CPU: Intel Core i5-13420H (2.1GHz up to 4.6GHz, 8C(4P+4E)/12T, 12MB Intel Smart Cache)','The LENOVO DESKTOP IdeaCentre AIO 3 is designed to capture attention with its modern and sleek stand, along with its slim-edge display that is both visually striking and touch-responsive. Its performance is impressive, delivering smooth and fast operations.', 26490.00 ,3),
        ('190198893369','HOT','https://media-cdn.bnn.in.th/7149/Apple-Acc-Apple-Pencil2-02-square_medium.jpg','https://media-cdn.bnn.in.th/7150/Apple-Acc-Apple-Pencil2-03-square_medium.jpg',NULL,NULL,'Apple Pencil (2nd gen)','APPLE','Accessories','Compatible with: iPad Pro 12.9-inch. iPad Pro 11-inch, iPad Air ,iPad mini','The Apple Pencil (2nd generation) offers precise pixel-level accuracy and low latency, making it ideal for drawing, sketching, coloring, note-taking, annotating PDFs, and much more. Its natural and intuitive usage, resembling a real pencil, allows you to switch tools seamlessly without having to press any buttons on the screen.', 3590.00,19),
        ('195949030840','HOT','https://media-cdn.bnn.in.th/336081/Apple_Watch_Series_9_GPS_45mm_Starlight_Aluminum_Starlight_Sport_Band_1-square_medium.jpg','https://media-cdn.bnn.in.th/336088/Apple_Watch_Series_9_GPS_45mm_Starlight_Aluminum_Starlight_Sport_Band_3-square_medium.jpg','https://media-cdn.bnn.in.th/336086/Apple_Watch_Series_9_GPS_45mm_Starlight_Aluminum_Starlight_Sport_Band_6-square_medium.jpg','https://media-cdn.bnn.in.th/336082/Apple_Watch_Series_9_GPS_45mm_Starlight_Aluminum_Starlight_Sport_Band_10-square_medium.jpg','Apple Watch Series 9 GPS 45mm Starlight Aluminium Case with Starlight Sport Band - S/M','APPLE','Accessories',NULL,'The Apple Watch Series 9 helps you stay connected, active, healthy, and safe at all times. It comes with the magical "double-tap" finger command, offering a wonderful way to interact with your Apple Watch. The brighter display enhances visibility, and it also features real-time location tracking for your iPhone.',14500.00 ,11),
        ('6934177715440','HOT','https://media-cdn.bnn.in.th/99816/Xiaomi-Wireless-Mouse-Silent-Edition-Mi-Dual-Mode-White-1-square_medium.jpg','https://media-cdn.bnn.in.th/99818/Xiaomi-Wireless-Mouse-Silent-Edition-Mi-Dual-Mode-White-3-square_medium.jpg','https://media-cdn.bnn.in.th/99819/Xiaomi-Wireless-Mouse-Silent-Edition-Mi-Dual-Mode-White-4-square_medium.jpg',NULL,'Xiaomi Wireless Mouse Silent Edition Mi Dual Mode White','XIAOMI','Accessories',NULL,'The Xiaomi Mi Dual Mode Silent Edition White mouse is a wireless mouse with an ergonomic design, suitable for all genders and ages. It connects via Bluetooth or a USB 2.4GHz receiver, allowing you to switch between two devices seamlessly.',399.00 ,7),
        ('045496883409','HOT','https://media-cdn.bnn.in.th/327183/Nintendo-Switch-H-Oled-Console-Neon-Red-Blue-1-square_medium.jpg','https://media-cdn.bnn.in.th/327184/Nintendo-Switch-H-Oled-Console-Neon-Red-Blue-2-square_medium.jpg','https://media-cdn.bnn.in.th/327185/Nintendo-Switch-H-Oled-Console-Neon-Red-Blue-3-square_medium.jpg','https://media-cdn.bnn.in.th/327186/Nintendo-Switch-H-Oled-Console-Neon-Red-Blue-4-square_medium.jpg','Nintendo Switch-H Oled Console Neon Red/Blue','NINTENDO','Gaming Gear',NULL,'The Nintendo Switch OLED Console Neon Red/Blue is a portable gaming device that offers compact fun without the need for a TV. The latest addition to the Nintendo Switch family, the OLED model features a 7.0-inch touch OLED display for an enhanced gaming experience.',12490.00 ,2),
        ('6936520837816','NEW','https://media-cdn.bnn.in.th/371918/Honor-Magic-V2-Purple-1-square_medium.jpg','https://media-cdn.bnn.in.th/371920/Honor-Magic-V2-Purple-3-square_medium.jpg','https://media-cdn.bnn.in.th/371922/Honor-Magic-V2-Purple-5-square_medium.jpg','https://media-cdn.bnn.in.th/371924/Honor-Magic-V2-Purple-7-square_medium.jpg','Honor Magic V2 (16+512GB) Purple (5G)','HONOR','Smartphone',NULL,'The Honor Magic V2 5G is the lightest and thinnest foldable smartphone, featuring a high-capacity 5,000mAh battery that provides long-lasting and efficient usage', 59990.00, 13),
        ('4711387495513','NEW','https://media-cdn.bnn.in.th/373623/asus-notebook-rog-zephyrus-g16-gu605mv-qr198ws-eclipse-gray-1-square_medium.jpg','https://media-cdn.bnn.in.th/373624/asus-notebook-rog-zephyrus-g16-gu605mv-qr198ws-eclipse-gray-2-square_medium.jpg','https://media-cdn.bnn.in.th/373625/asus-notebook-rog-zephyrus-g16-gu605mv-qr198ws-eclipse-gray-3-square_medium.jpg','https://media-cdn.bnn.in.th/373626/asus-notebook-rog-zephyrus-g16-gu605mv-qr198ws-eclipse-gray-4-square_medium.jpg','Asus ROG Zephyrus G16 GU605MV-QR198WS Eclipse Gray','ASUS','Desktop',NULL,'The Asus ROG Zephyrus G16 GU605 now boasts a larger 16-inch display, maintaining its unique style and identity while becoming even slimmer and more streamlined than before. It is powered by the Intel Core Ultra processor, which fully supports AI workloads with maximum efficiency', 74990.00, 8),                                                                                                                                                                                                                                                                                                                                               
		('8806095118277','NEW','https://media-cdn.bnn.in.th/316855/Samsung-Smartphone-Galaxy-Z-Flip5-Mint-(5G)---1-square_medium.jpg','https://media-cdn.bnn.in.th/316860/Samsung-Smartphone-Galaxy-Z-Flip5-Mint-(5G)---6-square_medium.jpg','https://media-cdn.bnn.in.th/316861/Samsung-Smartphone-Galaxy-Z-Flip5-Mint-(5G)---8-square_medium.jpg',NULL,'Samsung Galaxy Z Flip5','SAMSUNG','Smartphone',NULL,'Order the compact and sleek Galaxy Z Flip5. It is easy to carry and has a new external screen design that meets all your needs. The large external screen allows for versatile usage, whether it is responding to chats, scrolling through feeds, or using various apps, it is easier than ever before. (Highlighted apps include Line, Netflix, YouTube, Google Maps, Spotify, etc.) It is easy to take pictures - just unfold and snap, whether it is a selfie or group photo, itis perfect.',43900, 12);
-- DROP TABLE `Product`;