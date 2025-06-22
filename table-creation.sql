CREATE DATABASE project_2;

USE project_2;

                                             -- TABLE CREATION --
                                             
-- 1.create Genres table

CREATE TABLE genres(
genre_id INT,
genre_name VARCHAR(50) NOT NULL,
description TEXT,
CONSTRAINT pk_genre_id PRIMARY KEY(genre_id),
CONSTRAINT uk_genre_name UNIQUE KEY(genre_name)
); 
DESC genres;

-- insert values into genres table
INSERT INTO genres (genre_id, genre_name, description) VALUES
(101, 'Action', 'Fast-paced with stunts, fights, and physical activity.'),
(102, 'Adventure', 'Exploration-based stories, often with quests.'),
(103, 'Animation', 'Visually animated content using CGI or drawings.'),
(104, 'Biography', 'Based on true stories of famous individuals.'),
(105, 'Comedy', 'Lighthearted plots meant to make audiences laugh.'),
(106, 'Crime', 'Centered on criminal activities or investigations.'),
(107, 'Documentary', 'Non-fictional movies for educational purposes.'),
(108, 'Drama', 'Emotionally driven with serious narrative tones.'),
(109, 'Family', 'Suitable content for viewers of all ages.'),
(110, 'Fantasy', 'Features magical or supernatural elements.'),
(111, 'History', 'Depictions of real historical events.'),
(112, 'Horror', 'Designed to frighten and unsettle viewers.'),
(113, 'Music', 'Revolves around music, musicians, or performances.'),
(114, 'Mystery', 'Involves solving puzzles or investigating events.'),
(115, 'Romance', 'Focused on love and emotional relationships.'),
(116, 'Sci-Fi', 'Deals with futuristic or science-based scenarios.'),
(117, 'Sports', 'Based on competitive athletic activities.'),
(118, 'Thriller', 'Intense, suspenseful, and plot-driven stories.'),
(119, 'War', 'Depicts military conflict and battlefield stories.'),
(120, 'Western', 'Set in the American Old West, featuring cowboys.');

SELECT * FROM genres;


-- 2. CREATE languages table

CREATE TABLE languages (
    language_id INT,
    language_name VARCHAR(50) NOT NULL,
    description TEXT,
    CONSTRAINT pk_language_id PRIMARY KEY(language_id)
);

DESC languages;

-- insert values into languages table

INSERT INTO languages (language_id, language_name, description) VALUES
(201, 'English', 'Primarily spoken in the United States, UK, and globally.'),
(202, 'Hindi', 'Major language spoken in India.'),
(203, 'Tamil', 'Regional language spoken in South India.'),
(204, 'Telugu', 'Widely spoken in Andhra Pradesh and Telangana.'),
(205, 'Malayalam', 'Spoken in the state of Kerala.'),
(206, 'Kannada', 'Predominantly used in Karnataka.'),
(207, 'Marathi', 'Spoken widely in Maharashtra.'),
(208, 'Gujarati', 'Native language of Gujarat.'),
(209, 'Punjabi', 'Spoken in Punjab and by Sikh communities.'),
(210, 'Bengali', 'Major language in West Bengal and Bangladesh.'),
(211, 'Urdu', 'Common in parts of India and Pakistan.'),
(212, 'Spanish', 'Popular language in Spain and Latin America.'),
(213, 'French', 'Spoken in France and parts of Africa and Canada.'),
(214, 'German', 'Language used in Germany and Austria.'),
(215, 'Japanese', 'Primary language in Japan.'),
(216, 'Korean', 'Spoken in South Korea and North Korea.'),
(217, 'Mandarin', 'Most spoken language globally, used in China.'),
(218, 'Russian', 'Widely spoken in Russia and Eastern Europe.'),
(219, 'Arabic', 'Common in Middle East and North Africa.'),
(220, 'Portuguese', 'Used in Portugal and Brazil.');

SELECT * FROM languages;

-- 3. CREATE countries table

CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(100) NOT NULL,
    iso_code VARCHAR(5),
    CONSTRAINT pk_country_id PRIMARY KEY(country_id),
    CONSTRAINT uk_country_name UNIQUE KEY(country_name),
    CONSTRAINT uk_iso_code UNIQUE KEY(iso_code)
);

DESC countries;

-- insert values into countries table

INSERT INTO countries (country_id, country_name, iso_code) VALUES
(301, 'India', 'IN'),
(302, 'United States', 'US'),
(303, 'United Kingdom', 'UK'),
(304, 'Canada', 'CA'),
(305, 'Australia', 'AU'),
(306, 'Germany', 'DE'),
(307, 'France', 'FR'),
(308, 'Italy', 'IT'),
(309, 'Spain', 'ES'),
(310, 'Brazil', 'BR'),
(311, 'Mexico', 'MX'),
(312, 'China', 'CN'),
(313, 'Japan', 'JP'),
(314, 'South Korea', 'KR'),
(315, 'Russia', 'RU'),
(316, 'South Africa', 'ZA'),
(317, 'UAE', 'AE'),
(318, 'Singapore', 'SG'),
(319, 'Malaysia', 'MY'),
(320, 'New Zealand', 'NZ');

SELECT * FROM countries;

-- 4. create cities table
CREATE TABLE cities (
    city_id INT,
    city_name VARCHAR(100) NOT NULL,
    state_or_region VARCHAR(100),
    country_id INT,
    CONSTRAINT pk_city_id PRIMARY KEY(city_id),
    CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

DESC cities;

-- insert values into  cities

INSERT INTO cities (city_id, city_name, state_or_region, country_id) VALUES
(401, 'Mumbai', 'Maharashtra', 301),
(402, 'Delhi', 'Delhi NCR', 301),
(403, 'Bangalore', 'Karnataka', 301),
(404, 'Chennai', 'Tamil Nadu', 301),
(405, 'Hyderabad', 'Telangana', 301),
(406, 'New York', 'New York', 302),
(407, 'Los Angeles', 'California', 302),
(408, 'Chicago', 'Illinois', 302),
(409, 'Toronto', 'Ontario', 304),
(410, 'Vancouver', 'British Columbia', 304),
(411, 'London', 'England', 303),
(412, 'Manchester', 'England', 303),
(413, 'Sydney', 'New South Wales', 305),
(414, 'Melbourne', 'Victoria', 305),
(415, 'Berlin', 'Berlin', 306),
(416, 'Paris', 'Île-de-France', 307),
(417, 'Rome', 'Lazio', 308),
(418, 'Madrid', 'Community of Madrid', 309),
(419, 'Sao Paulo', 'Sao Paulo', 310),
(420, 'Tokyo', 'Kanto', 313);

SELECT * FROM cities;

-- 5.create theaters table

CREATE TABLE theaters (
    theater_id INT,
    theater_name VARCHAR(100) NOT NULL,
    address TEXT,
    city_id INT NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100),
    CONSTRAINT pk_theater_id PRIMARY KEY(theater_id),
    CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

DESC theaters;

-- insert values into  theaters

INSERT INTO theaters (theater_id, theater_name, address, city_id, contact_number, email) VALUES
(501, 'PVR Cinemas', 'Phoenix Mall, Lower Parel', 401, '9123456780', 'pvr.mumbai@example.com'),
(502, 'INOX Movies', 'Infinity Mall, Andheri', 401, '9123456781', 'inox.andheri@example.com'),
(503, 'Carnival Cinemas', 'DLF Avenue, Saket', 402, '9123456782', 'carnival.delhi@example.com'),
(504, 'Sathyam Cinemas', 'Royapettah High Road', 404, '9123456783', 'sathyam.chennai@example.com'),
(505, 'Gopalan Cinemas', 'Old Madras Road', 403, '9123456784', 'gopalan.bangalore@example.com'),
(506, 'Asian Cinemas', 'Ameerpet', 405, '9123456785', 'asian.hyderabad@example.com'),
(507, 'AMC Empire 25', '234 W 42nd St, NY', 406, '9123456786', 'amc.ny@example.com'),
(508, 'Regal Cinemas LA', '1000 Vin Scully Ave, LA', 407, '9123456787', 'regal.la@example.com'),
(509, 'Cineplex Toronto', 'Yonge St, Toronto', 409, '9123456788', 'cineplex.toronto@example.com'),
(510, 'SilverCity Vancouver', 'Granville St', 410, '9123456789', 'silver.vancouver@example.com'),
(511, 'Odeon Leicester', 'West End, London', 411, '9123456790', 'odeon.london@example.com'),
(512, 'Vue Manchester', 'Printworks, Manchester', 412, '9123456791', 'vue.manchester@example.com'),
(513, 'Event Cinemas', 'George St, Sydney', 413, '9123456792', 'event.sydney@example.com'),
(514, 'Hoyts Melbourne', 'Chadstone Shopping Centre', 414, '9123456793', 'hoyts.melbourne@example.com'),
(515, 'CineStar Berlin', 'Potsdamer Straße', 415, '9123456794', 'cinestar.berlin@example.com'),
(516, 'UGC Cine Cite', 'Les Halles, Paris', 416, '9123456795', 'ugc.paris@example.com'),
(517, 'The Space Cinema', 'Via del Corso, Rome', 417, '9123456796', 'space.rome@example.com'),
(518, 'Cinesa Proyecciones', 'Calle de Fuencarral, Madrid', 418, '9123456797', 'cinesa.madrid@example.com'),
(519, 'Cinemark SP', 'Av. Paulista, Sao Paulo', 419, '9123456798', 'cinemark.sp@example.com'),
(520, 'Toho Cinemas', 'Shinjuku, Tokyo', 420, '9123456799', 'toho.tokyo@example.com');

SELECT * FROM theaters;

-- 6.create screens table 

CREATE TABLE screens (
    screen_id INT,
    screen_name VARCHAR(50) NOT NULL,
    theater_id INT NOT NULL,
    total_seats INT NOT NULL,
    screen_type VARCHAR(50),
    CONSTRAINT pk_screen_id PRIMARY KEY(screen_id),
    CONSTRAINT fk_theater_id FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);
ALTER TABLE screens
ADD COLUMN base_fare DECIMAL(8,2) NOT NULL DEFAULT 200.00;
DESC screens;

-- insert values into screens table

INSERT INTO screens (screen_id, screen_name, theater_id, total_seats, screen_type) VALUES
(601, 'Screen 1', 501, 200, 'IMAX'),
(602, 'Screen 2', 501, 180, 'Standard'),
(603, 'Screen 1', 502, 150, 'Standard'),
(604, 'Screen 1', 503, 160, '3D'),
(605, 'Screen 2', 503, 170, 'Standard'),
(606, 'Screen 1', 504, 210, 'IMAX'),
(607, 'Screen 2', 504, 190, 'Standard'),
(608, 'Screen 1', 505, 200, 'Standard'),
(609, 'Screen 1', 506, 220, '4DX'),
(610, 'Screen 2', 506, 180, 'Standard'),
(611, 'Screen 1', 507, 250, 'IMAX'),
(612, 'Screen 2', 507, 230, 'Standard'),
(613, 'Screen 1', 508, 200, '3D'),
(614, 'Screen 1', 509, 190, 'Standard'),
(615, 'Screen 1', 510, 180, 'Standard'),
(616, 'Screen 1', 511, 175, 'Standard'),
(617, 'Screen 1', 512, 160, 'Standard'),
(618, 'Screen 1', 513, 220, 'IMAX'),
(619, 'Screen 1', 514, 210, '3D'),
(620, 'Screen 1', 515, 200, 'Standard');

SELECT * FROM screens;

-- 7.create seat_types table

CREATE TABLE seat_types (
    seat_type_id INT,
    seat_type_name VARCHAR(50) NOT NULL,
    description TEXT,
    price_multiplier DECIMAL(4,2) NOT NULL,
	CONSTRAINT pk_seat_type_id PRIMARY KEY(seat_type_id),
    CONSTRAINT uk_seat_type_name UNIQUE KEY(seat_type_name)
);

DESC seat_types;

-- insert values into  seat_types table

INSERT INTO seat_types (seat_type_id, seat_type_name, description, price_multiplier) VALUES
(701, 'Regular', 'Standard seating with basic comfort', 1.00),
(702, 'Premium', 'Slightly more spacious with better view', 1.20),
(703, 'VIP', 'Front-row recliner seats with legroom', 1.50),
(704, 'Recliner', 'Fully reclining leather seats', 1.80),
(705, 'Gold', 'Luxury seats with personalized service', 2.00),
(706, 'Silver', 'Economical but decent view', 0.90),
(707, 'Executive', 'Mid-level seats with armrests', 1.30),
(708, 'Couple Seat', 'Double seater for couples', 2.20),
(709, 'Balcony', 'Upper-level with good audio experience', 1.10),
(710, 'Box', 'Private box seating for 4 people', 2.50),
(711, 'Sofa Seat', '2-seater comfortable sofa seat', 2.00),
(712, 'Front Row', 'Closer to the screen with low demand', 0.80),
(713, 'Middle Row', 'Balanced view and acoustics', 1.10),
(714, 'Back Row', 'Higher view position', 1.15),
(715, 'Child Seat', 'Special seats for children', 0.70),
(716, 'Wheelchair Accessible', 'Accessible and wider space', 1.00),
(717, 'Lazy Boy', 'Highly luxurious motorized recliners', 2.80),
(718, 'Elite', 'Top-tier exclusive seats', 3.00),
(719, 'Student Special', 'Discounted seats for students', 0.75),
(720, 'Family Bench', 'Shared bench seat for 3-4 people', 1.50);

SELECT * FROM seat_types;

-- 8.create seats table

CREATE TABLE seats (
    seat_id INT,
    screen_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    seat_row VARCHAR(5),
    seat_column INT,
    seat_type_id INT NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    CONSTRAINT pk_seat_id PRIMARY KEY(seat_id),
    CONSTRAINT fk_screen_id FOREIGN KEY (screen_id) REFERENCES screens(screen_id),
    CONSTRAINT fk_seat_type_id FOREIGN KEY (seat_type_id) REFERENCES seat_types(seat_type_id)
);

DESC seats;

-- insert values into seats table
 INSERT INTO seats (seat_id, screen_id, seat_number, seat_row, seat_column, seat_type_id, is_available) VALUES
(801, 601, 'A1', 'A', 1, 701, TRUE),
(802, 601, 'A2', 'A', 2, 701, TRUE),
(803, 601, 'B1', 'B', 1, 702, TRUE),
(804, 601, 'B2', 'B', 2, 702, FALSE),
(805, 601, 'C1', 'C', 1, 703, TRUE),
(806, 601, 'C2', 'C', 2, 703, TRUE),
(807, 602, 'A1', 'A', 1, 701, TRUE),
(808, 602, 'A2', 'A', 2, 701, TRUE),
(809, 602, 'B1', 'B', 1, 702, TRUE),
(810, 602, 'B2', 'B', 2, 702, FALSE),
(811, 602, 'C1', 'C', 1, 703, TRUE),
(812, 602, 'C2', 'C', 2, 703, TRUE),
(813, 603, 'A1', 'A', 1, 701, TRUE),
(814, 603, 'A2', 'A', 2, 701, TRUE),
(815, 603, 'B1', 'B', 1, 702, TRUE),
(816, 603, 'B2', 'B', 2, 702, TRUE),
(817, 603, 'C1', 'C', 1, 703, TRUE),
(818, 603, 'C2', 'C', 2, 703, TRUE),
(819, 604, 'A1', 'A', 1, 701, TRUE),
(820, 604, 'A2', 'A', 2, 701, TRUE);

SELECT * from seats;

-- 9.create movies table

CREATE TABLE movies (
    movie_id INT,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50),
    language VARCHAR(50),
    duration_minutes INT,
    certification VARCHAR(10),
    release_date DATE,
    director VARCHAR(100),
    description TEXT,
    CONSTRAINT pk_movie_id PRIMARY KEY(movie_id)
);

DESC movies;

-- insert values into movies table

INSERT INTO movies (movie_id, title, genre, language, duration_minutes, certification, release_date, director, description) VALUES
(901, 'Inception', 'Sci-Fi', 'English', 148, 'PG-13', '2010-07-16', 'Christopher Nolan', 'A thief who steals corporate secrets through dream-sharing technology.'),
(902, 'Baahubali', 'Action', 'Telugu', 159, 'U/A', '2015-07-10', 'S. S. Rajamouli', 'A legendary warrior rises to reclaim his kingdom.'),
(903, 'Dangal', 'Drama', 'Hindi', 161, 'U', '2016-12-23', 'Nitesh Tiwari', 'A father trains his daughters to become wrestling champions.'),
(904, 'Avatar: The Way of Water', 'Fantasy', 'English', 192, 'PG-13', '2022-12-16', 'James Cameron', 'The Sully family faces threats on Pandora.'),
(905, 'The Batman', 'Action', 'English', 176, 'PG-13', '2022-03-04', 'Matt Reeves', 'Batman uncovers corruption and confronts the Riddler.'),
(906, 'Vikram', 'Action', 'Tamil', 175, 'A', '2022-06-03', 'Lokesh Kanagaraj', 'A special agent is back to bust a drug cartel.'),
(907, 'RRR', 'Historical', 'Telugu', 187, 'U/A', '2022-03-25', 'S. S. Rajamouli', 'Two revolutionaries fight against British rule.'),
(908, 'Pushpa', 'Action', 'Telugu', 179, 'A', '2021-12-17', 'Sukumar', 'A laborer rises in the red sandalwood smuggling world.'),
(909, 'Jawan', 'Thriller', 'Hindi', 169, 'U/A', '2023-09-07', 'Atlee', 'A man sets out to correct societal wrongs.'),
(910, 'Top Gun: Maverick', 'Action', 'English', 131, 'PG-13', '2022-05-27', 'Joseph Kosinski', 'Maverick trains a new batch of Top Gun pilots.'),
(911, 'Interstellar', 'Sci-Fi', 'English', 169, 'PG-13', '2014-11-07', 'Christopher Nolan', 'A team travels through a wormhole in space.'),
(912, 'Master', 'Action', 'Tamil', 179, 'U/A', '2021-01-13', 'Lokesh Kanagaraj', 'A professor battles a gangster in a juvenile center.'),
(913, 'Drishyam 2', 'Thriller', 'Hindi', 140, 'U/A', '2022-11-18', 'Abhishek Pathak', 'A man’s past resurfaces as the police reinvestigate.'),
(914, 'KGF: Chapter 2', 'Action', 'Kannada', 168, 'U/A', '2022-04-14', 'Prashanth Neel', 'Rocky becomes a feared gangster.'),
(915, 'Pathaan', 'Spy', 'Hindi', 146, 'U/A', '2023-01-25', 'Siddharth Anand', 'An Indian spy returns to save his country.'),
(916, 'Thunivu', 'Heist', 'Tamil', 146, 'U/A', '2023-01-11', 'H. Vinoth', 'A mysterious man takes over a bank.'),
(917, 'The Kashmir Files', 'Drama', 'Hindi', 170, 'A', '2022-03-11', 'Vivek Agnihotri', 'Based on the exodus of Kashmiri Hindus.'),
(918, 'Guardians of the Galaxy Vol. 3', 'Action', 'English', 150, 'PG-13', '2023-05-05', 'James Gunn', 'The Guardians embark on a dangerous mission.'),
(919, 'Spirited Away', 'Fantasy', 'Japanese', 125, 'PG', '2001-07-20', 'Hayao Miyazaki', 'A girl enters a magical world of spirits.'),
(920, 'Leo', 'Action', 'Tamil', 164, 'U/A', '2023-10-19', 'Lokesh Kanagaraj', 'A man tries to hide his dark past while protecting his family.');
 
SELECT * from movies;



												-- TRANSACTION TABLE --
                                                
-- 1.create showtimes table

CREATE TABLE showtimes (
    showtime_id INT,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    base_price DECIMAL(8,2) NOT NULL,
    language VARCHAR(50),
    format VARCHAR(50),
    CONSTRAINT pk_showtime_id PRIMARY KEY(showtime_id),
    CONSTRAINT fk_screen_id_showtime FOREIGN KEY (screen_id) REFERENCES screens(screen_id),
    CONSTRAINT fk_movie_id_showtime FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
DESC showtimes;

-- insert values into showtime table

INSERT INTO showtimes (showtime_id, screen_id, movie_id, show_date, show_time, base_price, language, format) VALUES
(1001, 601, 901, '2025-06-16', '10:00:00', 200.00, 'English', 'IMAX'),
(1002, 601, 902, '2025-06-16', '13:30:00', 180.00, 'Telugu', '2D'),
(1003, 601, 903, '2025-06-16', '17:00:00', 150.00, 'Hindi', '2D'),
(1004, 602, 904, '2025-06-16', '19:45:00', 220.00, 'English', '3D'),
(1005, 602, 905, '2025-06-16', '22:30:00', 200.00, 'English', '2D'),
(1006, 603, 906, '2025-06-17', '10:00:00', 160.00, 'Tamil', '2D'),
(1007, 603, 907, '2025-06-17', '13:30:00', 190.00, 'Telugu', '2D'),
(1008, 604, 908, '2025-06-17', '17:00:00', 180.00, 'Telugu', '2D'),
(1009, 604, 909, '2025-06-17', '20:30:00', 200.00, 'Hindi', '2D'),
(1010, 605, 910, '2025-06-18', '10:30:00', 210.00, 'English', '2D'),
(1011, 605, 911, '2025-06-18', '14:00:00', 250.00, 'English', '2D'),
(1012, 606, 912, '2025-06-18', '17:30:00', 160.00, 'Tamil', '2D'),
(1013, 606, 913, '2025-06-18', '21:00:00', 180.00, 'Hindi', '2D'),
(1014, 607, 914, '2025-06-19', '10:00:00', 170.00, 'Kannada', '2D'),
(1015, 607, 915, '2025-06-19', '13:00:00', 190.00, 'Hindi', '2D'),
(1016, 608, 916, '2025-06-19', '16:00:00', 175.00, 'Tamil', '2D'),
(1017, 608, 917, '2025-06-19', '19:00:00', 200.00, 'Hindi', '2D'),
(1018, 609, 918, '2025-06-20', '11:00:00', 230.00, 'English', '3D'),
(1019, 609, 919, '2025-06-20', '14:30:00', 150.00, 'Japanese', '2D'),
(1020, 610, 920, '2025-06-20', '18:00:00', 190.00, 'Tamil', '2D');

SELECT * FROM showtimes;

-- 2.create users table

CREATE TABLE users (
    user_id INT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    gender VARCHAR(10),
    date_of_birth DATE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    password VARCHAR(100) NOT NULL,
    CONSTRAINT pk_user_id PRIMARY KEY(user_id)
);

DESC users;

-- insert values into users table

INSERT INTO users (user_id, first_name, last_name, email, phone, gender, date_of_birth, password) VALUES
(1101, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876543210', 'Male', '1992-06-15', 'arjun123'),
(1102, 'Sneha', 'Patel', 'sneha.patel@example.com', '9876543211', 'Female', '1995-08-22', 'sneha456'),
(1103, 'Rahul', 'Kumar', 'rahul.kumar@example.com', '9876543212', 'Male', '1990-12-10', 'rahul789'),
(1104, 'Divya', 'Mehra', 'divya.mehra@example.com', '9876543213', 'Female', '1993-05-19', 'divya321'),
(1105, 'Karan', 'Sharma', 'karan.sharma@example.com', '9876543214', 'Male', '1989-07-11', 'karan654'),
(1106, 'Anjali', 'Verma', 'anjali.verma@example.com', '9876543215', 'Female', '1991-11-23', 'anjali876'),
(1107, 'Vikram', 'Joshi', 'vikram.joshi@example.com', '9876543216', 'Male', '1987-02-01', 'vikram111'),
(1108, 'Neha', 'Singh', 'neha.singh@example.com', '9876543217', 'Female', '1994-03-28', 'neha222'),
(1109, 'Rohan', 'Das', 'rohan.das@example.com', '9876543218', 'Male', '1996-10-17', 'rohan333'),
(1110, 'Priya', 'Agarwal', 'priya.agarwal@example.com', '9876543219', 'Female', '1997-01-05', 'priya444'),
(1111, 'Aditya', 'Mishra', 'aditya.mishra@example.com', '9876543220', 'Male', '1992-04-14', 'aditya555'),
(1112, 'Meera', 'Nair', 'meera.nair@example.com', '9876543221', 'Female', '1993-09-30', 'meera666'),
(1113, 'Siddharth', 'Kapoor', 'siddharth.k@example.com', '9876543222', 'Male', '1990-06-12', 'sid777'),
(1114, 'Aishwarya', 'Menon', 'aishwarya.menon@example.com', '9876543223', 'Female', '1995-12-19', 'aish888'),
(1115, 'Harsh', 'Vora', 'harsh.vora@example.com', '9876543224', 'Male', '1991-08-08', 'harsh999'),
(1116, 'Tanya', 'Reddy', 'tanya.reddy@example.com', '9876543225', 'Female', '1994-07-21', 'tanya000'),
(1117, 'Ravi', 'Shetty', 'ravi.shetty@example.com', '9876543226', 'Male', '1988-05-06', 'ravi101'),
(1118, 'Isha', 'Gupta', 'isha.gupta@example.com', '9876543227', 'Female', '1996-02-27', 'isha202'),
(1119, 'Aman', 'Chopra', 'aman.chopra@example.com', '9876543228', 'Male', '1990-10-13', 'aman303'),
(1120, 'Simran', 'Bajaj', 'simran.bajaj@example.com', '9876543229', 'Female', '1992-03-03', 'simran404');

SELECT * FROM users;

-- 3.create bookings table

CREATE TABLE bookings (
    booking_id INT,
    user_id INT NOT NULL,
    showtime_id INT NOT NULL,
    booking_time DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Confirmed',
    CONSTRAINT pk_booking_id PRIMARY KEY(booking_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_showtime_id FOREIGN KEY (showtime_id) REFERENCES showtimes(showtime_id)
);
 
 DESC bookings;
 
 -- insert values into bookings table
 
 INSERT INTO bookings (booking_id, user_id, showtime_id, booking_time, total_amount, status) VALUES
(2001, 1101, 1001, '2025-06-14 10:15:00', 400.00, 'Confirmed'),
(2002, 1102, 1002, '2025-06-14 11:00:00', 360.00, 'Confirmed'),
(2003, 1103, 1003, '2025-06-14 12:05:00', 300.00, 'Confirmed'),
(2004, 1104, 1004, '2025-06-14 13:45:00', 440.00, 'Confirmed'),
(2005, 1105, 1005, '2025-06-14 14:30:00', 400.00, 'Confirmed'),
(2006, 1106, 1006, '2025-06-14 15:20:00', 320.00, 'Confirmed'),
(2007, 1107, 1007, '2025-06-14 16:10:00', 380.00, 'Cancelled'),
(2008, 1108, 1008, '2025-06-14 17:00:00', 360.00, 'Confirmed'),
(2009, 1109, 1009, '2025-06-14 17:55:00', 400.00, 'Confirmed'),
(2010, 1110, 1010, '2025-06-14 18:50:00', 420.00, 'Confirmed'),
(2011, 1111, 1011, '2025-06-14 19:30:00', 500.00, 'Confirmed'),
(2012, 1112, 1012, '2025-06-14 20:15:00', 320.00, 'Cancelled'),
(2013, 1113, 1013, '2025-06-14 21:05:00', 360.00, 'Confirmed'),
(2014, 1114, 1014, '2025-06-14 21:50:00', 340.00, 'Confirmed'),
(2015, 1115, 1015, '2025-06-14 22:40:00', 380.00, 'Confirmed'),
(2016, 1116, 1016, '2025-06-14 23:30:00', 350.00, 'Confirmed'),
(2017, 1117, 1017, '2025-06-15 09:10:00', 400.00, 'Confirmed'),
(2018, 1118, 1018, '2025-06-15 10:00:00', 460.00, 'Confirmed'),
(2019, 1119, 1019, '2025-06-15 10:45:00', 300.00, 'Confirmed'),
(2020, 1120, 1020, '2025-06-15 11:30:00', 380.00, 'Confirmed');

SELECT * FROM bookings;


-- 4.create booking_details table

CREATE TABLE booking_details (
    booking_detail_id INT,
    booking_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    seat_type_id INT NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    CONSTRAINT pk_booking_detail_id PRIMARY KEY(booking_detail_id),
    CONSTRAINT fk_booking_id FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    CONSTRAINT fk_seat_type_id_bd FOREIGN KEY (seat_type_id) REFERENCES seat_types(seat_type_id)
);

DESC booking_details;

-- insert values into booking_details table

INSERT INTO booking_details (booking_detail_id, booking_id, seat_number, seat_type_id, price) VALUES
(3001, 2001, 'A1', 701, 200.00),
(3002, 2001, 'A2', 701, 200.00),
(3003, 2002, 'B1', 702, 180.00),
(3004, 2002, 'B2', 702, 180.00),
(3005, 2003, 'C1', 703, 150.00),
(3006, 2003, 'C2', 703, 150.00),
(3007, 2004, 'D1', 701, 220.00),
(3008, 2004, 'D2', 701, 220.00),
(3009, 2005, 'E1', 702, 200.00),
(3010, 2005, 'E2', 702, 200.00),
(3011, 2006, 'F1', 703, 160.00),
(3012, 2006, 'F2', 703, 160.00),
(3013, 2007, 'G1', 701, 190.00),
(3014, 2007, 'G2', 701, 190.00),
(3015, 2008, 'H1', 702, 180.00),
(3016, 2008, 'H2', 702, 180.00),
(3017, 2009, 'I1', 702, 200.00),
(3018, 2009, 'I2', 702, 200.00),
(3019, 2010, 'J1', 701, 210.00),
(3020, 2010, 'J2', 701, 210.00);

SELECT * FROM booking_details;



-- 5.create payments table

CREATE TABLE payments (
    payment_id INT,
    booking_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_time TIME NOT NULL,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    amount_paid DECIMAL(10,2),
    CONSTRAINT pk_payment_id PRIMARY KEY (payment_id),
    CONSTRAINT fk_booking_id_pay FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
DESC payments;

-- insert values into payments table

INSERT INTO payments (payment_id, booking_id, payment_date, payment_time, payment_method, payment_status, amount_paid) VALUES
(4001, 2001, '2024-06-01', '10:15:00', 'UPI', 'Success', 400.00),
(4002, 2002, '2024-06-01', '11:20:00', 'Card', 'Success', 360.00),
(4003, 2003, '2024-06-02', '12:05:00', 'Wallet', 'Success', 300.00),
(4004, 2004, '2024-06-02', '14:10:00', 'UPI', 'Success', 440.00),
(4005, 2005, '2024-06-03', '15:30:00', 'Cash', 'Success', 400.00),
(4006, 2006, '2024-06-03', '16:45:00', 'Card', 'Failed', 0.00),
(4007, 2007, '2024-06-04', '09:00:00', 'Wallet', 'Success', 380.00),
(4008, 2008, '2024-06-04', '10:30:00', 'UPI', 'Pending', 0.00),
(4009, 2009, '2024-06-05', '11:50:00', 'Card', 'Success', 400.00),
(4010, 2010, '2024-06-05', '13:10:00', 'Cash', 'Success', 420.00),
(4011, 2011, '2024-06-06', '14:25:00', 'UPI', 'Success', 250.00),
(4012, 2012, '2024-06-06', '15:40:00', 'Wallet', 'Success', 260.00),
(4013, 2013, '2024-06-07', '16:55:00', 'Card', 'Success', 380.00),
(4014, 2014, '2024-06-07', '17:10:00', 'UPI', 'Success', 360.00),
(4015, 2015, '2024-06-08', '18:20:00', 'Cash', 'Success', 390.00),
(4016, 2016, '2024-06-08', '19:35:00', 'Wallet', 'Failed', 0.00),
(4017, 2017, '2024-06-09', '20:45:00', 'UPI', 'Success', 400.00),
(4018, 2018, '2024-06-09', '21:55:00', 'Card', 'Success', 420.00),
(4019, 2019, '2024-06-10', '22:10:00', 'Wallet', 'Pending', 0.00),
(4020, 2020, '2024-06-10', '23:30:00', 'UPI', 'Success', 410.00);

SELECT * FROM payments;

-- 6. create refunds table
CREATE TABLE refunds (
    refund_id INT,
    payment_id INT NOT NULL,
    refund_date DATE NOT NULL,
    refund_amount DECIMAL(10,2) NOT NULL,
    refund_reason VARCHAR(255),
    refund_status VARCHAR(50),
    CONSTRAINT pk_refund_id PRIMARY KEY (refund_id),
    CONSTRAINT fk_payment_id_ref FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);

DESC refunds;

-- insert values into refunds table

INSERT INTO refunds (refund_id, payment_id, refund_date, refund_amount, refund_reason, refund_status) VALUES
(5001, 4006, '2024-06-03', 360.00, 'Payment failed - Card error', 'Processed'),
(5002, 4008, '2024-06-04', 0.00, 'Payment pending - Awaiting user action', 'Pending'),
(5003, 4016, '2024-06-08', 390.00, 'Payment failed - Wallet declined', 'Processed'),
(5004, 4019, '2024-06-10', 0.00, 'Payment pending - Awaiting UPI confirmation', 'Pending'),
(5005, 4002, '2024-06-01', 360.00, 'Duplicate booking refund', 'Processed'),
(5006, 4004, '2024-06-02', 440.00, 'Customer cancellation', 'Processed'),
(5007, 4011, '2024-06-06', 250.00, 'Cancelled before showtime', 'Processed'),
(5008, 4017, '2024-06-09', 400.00, 'Refund due to technical issue', 'Processed'),
(5009, 4003, '2024-06-02', 300.00, 'Refund - seat unavailable', 'Processed'),
(5010, 4009, '2024-06-05', 400.00, 'Refund - incorrect booking', 'Processed'),
(5011, 4012, '2024-06-06', 260.00, 'Refund - payment reversal', 'Processed'),
(5012, 4018, '2024-06-09', 420.00, 'Duplicate booking refund', 'Processed'),
(5013, 4001, '2024-06-01', 400.00, 'Refund due to delay in showtime', 'Processed'),
(5014, 4014, '2024-06-07', 360.00, 'Customer cancellation', 'Processed'),
(5015, 4013, '2024-06-07', 380.00, 'Show cancelled', 'Processed'),
(5016, 4010, '2024-06-05', 420.00, 'Refund - double payment', 'Processed'),
(5017, 4015, '2024-06-08', 390.00, 'Customer request', 'Processed'),
(5018, 4019, '2024-06-10', 0.00, 'UPI still pending', 'Pending'),
(5019, 4006, '2024-06-03', 360.00, 'Reprocessed due to earlier failure', 'Processed'),
(5020, 4008, '2024-06-04', 0.00, 'Payment not confirmed yet', 'Pending');

SELECT * FROM refunds;

-- 7 .create reviews table
CREATE TABLE reviews (
    review_id INT,
    customer_id INT,
    movie_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE NOT NULL,
    CONSTRAINT pk_review_id PRIMARY KEY (review_id),
    CONSTRAINT fk_movie_id_reviews FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

desc reviews;

-- inset values into reviews table

INSERT INTO reviews (review_id, customer_id, movie_id, rating, review_text, review_date) VALUES
(6001, 1001, 901, 5, 'Absolutely loved the movie!', '2024-06-01'),
(6002, 1002, 902, 4, 'Great visuals and storyline.', '2024-06-02'),
(6003, 1003, 903, 3, 'It was okay, not great.', '2024-06-03'),
(6004, 1004, 904, 5, 'Amazing direction and acting.', '2024-06-04'),
(6005, 1005, 905, 2, 'Not up to the mark.', '2024-06-05'),
(6006, 1006, 906, 4, 'Very entertaining!', '2024-06-06'),
(6007, 1007, 907, 1, 'Worst movie of the year.', '2024-06-07'),
(6008, 1008, 908, 5, 'A must-watch for everyone.', '2024-06-08'),
(6009, 1009, 909, 3, 'Decent but forgettable.', '2024-06-09'),
(6010, 1010, 910, 4, 'Well paced and acted.', '2024-06-10'),
(6011, 1011, 911, 5, 'Just brilliant!', '2024-06-11'),
(6012, 1012, 912, 4, 'Really enjoyed this film.', '2024-06-12'),
(6013, 1013, 913, 2, 'Poor storyline.', '2024-06-13'),
(6014, 1014, 914, 3, 'Good in parts.', '2024-06-14'),
(6015, 1015, 915, 5, 'Fantastic movie!', '2024-06-15'),
(6016, 1016, 916, 4, 'Loved the characters.', '2024-06-16'),
(6017, 1017, 917, 1, 'Very disappointing.', '2024-06-17'),
(6018, 1018, 918, 5, 'Highly recommended.', '2024-06-18'),
(6019, 1019, 919, 3, 'Nothing special.', '2024-06-19'),
(6020, 1020, 920, 4, 'Solid film, good ending.', '2024-06-20');

SELECT * FROM reviews;

-- 8.create discount table

CREATE TABLE discounts (
    discount_id INT,
    discount_code VARCHAR(20) UNIQUE,
    description VARCHAR(100),
    discount_percent DECIMAL(5,2) NOT NULL CHECK (discount_percent BETWEEN 0 AND 100),
    max_usage INT NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL,
    CONSTRAINT pk_discount_id PRIMARY KEY (discount_id)
);
drop table discounts;

DESC discounts;

-- insert values into discount table
INSERT INTO discounts (discount_id, discount_code, description, discount_percent, max_usage, valid_from, valid_to) VALUES
(7001, 'DISC10', '10% off on all shows', 10.00, 100, '2024-06-01', '2024-06-30'),
(7002, 'FIRST20', '20% off for first-time users', 20.00, 50, '2024-06-01', '2024-07-15'),
(7003, 'WEEKEND15', '15% off on weekend shows', 15.00, 200, '2024-06-01', '2024-08-31'),
(7004, 'SUMMER25', 'Summer special 25% off', 25.00, 80, '2024-06-15', '2024-07-15'),
(7005, 'MOVIE5', 'Flat 5% discount', 5.00, 500, '2024-06-01', '2024-12-31'),
(7006, 'JUNE50', 'June Special 50% off', 50.00, 30, '2024-06-01', '2024-06-30'),
(7007, 'VIP30', '30% for VIP members', 30.00, 70, '2024-06-01', '2024-12-31'),
(7008, 'MIDYEAR15', 'Mid-year 15% offer', 15.00, 100, '2024-06-15', '2024-07-15'),
(7009, 'STUDENT10', '10% for students', 10.00, 300, '2024-06-01', '2024-09-01'),
(7010, 'NIGHT20', '20% on night shows', 20.00, 90, '2024-06-10', '2024-07-31'),
(7011, 'FESTIVE25', 'Festival Offer 25%', 25.00, 120, '2024-07-01', '2024-08-01'),
(7012, 'LOYAL40', 'Loyalty program discount', 40.00, 50, '2024-06-01', '2024-10-31'),
(7013, 'CASHBACK15', '15% cashback', 15.00, 150, '2024-06-15', '2024-09-30'),
(7014, 'WELCOME30', 'Welcome offer for new users', 30.00, 60, '2024-06-01', '2024-07-31'),
(7015, 'BULK20', 'Bulk booking 20% off', 20.00, 40, '2024-06-01', '2024-08-15'),
(7016, 'COUPON10', 'Flat 10% off with code', 10.00, 250, '2024-06-01', '2024-08-30'),
(7017, 'SAVE35', 'Save 35% this month', 35.00, 25, '2024-06-01', '2024-06-30'),
(7018, 'SUPERDEAL', 'Super Deal 45% off', 45.00, 20, '2024-06-10', '2024-07-10'),
(7019, 'KIDSFREE', 'Kids seat 100% off', 100.00, 15, '2024-06-01', '2024-06-30'),
(7020, 'FAMILYFUN', 'Family booking 18% off', 18.00, 80, '2024-06-15', '2024-08-15');

SELECT * FROM discounts;

show tables;












 
 

 






 

 





