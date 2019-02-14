-- Delete the tables if they exist.
-- Disable foreign key checks, so the tables can
-- be dropped in arbitrary order.
PRAGMA foreign_keys=OFF;


-- create the tables.
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username    TEXT NOT NULL,
    u_name      TEXT NOT NULL,
    password    TEXT NOT NULL, -- some check to ensure it's hashed?
    PRIMARY KEY (username)
    );

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
    title           TEXT NOT NULL,
    prod_year       INTEGER NOT NULL,
    imdb_id         TEXT NOT NULL,
    running_time    INTEGER NOT NULL,
    PRIMARY KEY (title)
    );

DROP TABLE IF EXISTS theaters;
CREATE TABLE theaters (
    t_name      TEXT NOT NULL,
    capacity    INTEGER NOT NULL CHECK (capacity > 0),
    PRIMARY KEY (t_name)
    );

DROP TABLE IF EXISTS performances;
CREATE TABLE performances (
    title           TEXT NOT NULL,
    t_name          TEXT NOT NULL,
    date            DATE NOT NULL,
    time            TIME NOT NULL,
    seats_available INTEGER NOT NULL CHECK (seats_available >= 0),
    PRIMARY KEY (title, date, time, t_name), --perhaps we do not need all.
    FOREIGN KEY (title) REFERENCES movies(title),
    FOREIGN KEY (t_name) REFERENCES theaters(t_name)
    );

DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets (
    id          TEXT DEFAULT (lower(hex(randomblob(16)))),
    username    TEXT NOT NULL,
    title       TEXT NOT NULL,
    t_name      TEXT NOT NULL,
    date        DATE NOT NULL,
    time        TIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (username) REFERENCES users(username),
    FOREIGN KEY (t_name,title, date, time) REFERENCES performances(t_name, title, date, time)
    );

-- Insert data into the tables
INSERT
INTO users(username, u_name, password) 
VALUES  ('kallecool', 'Karl Lagerfeld','hej123'),
        ('snyggErik','Erik Segerstedt','1234'),
        ('jsson','Albin Johansson','password'),
        ('heaton','Emil Christensen','password'),
        ('snurresprett','Lille Skutt','password');


INSERT 
INTO movies(title, prod_year,imdb_id,running_time)
VALUES  ('Interstellar',2014,'tt0816692',189),
        ('The Shawnshank Redemption',1994, 'tt0111161', 144),
        ('Pulp Fiction', 1994, 'tt0110912', 154),
        ('The Room', 2003, 'tt0368226',99),
        ('The Disaster Artist', 2017, 'tt3521126' , 104),
        ('The Prestige', 2006, 'tt0482571', 130),
        ('Justin Bieber: Never Say Never',2011, 'tt1702443',105);

INSERT 
INTO theaters(t_name, capacity)
VALUES  ('SF LUND', 250),
        ('SF MALMÖ', 350),
        ('Eksjö biograf', 75);

INSERT 
INTO performances(title, t_name, date, time, seats_available)
VALUES  ('Interstellar','SF LUND','2019-02-15','20:00',250),
        ('The Room','SF LUND','2019-02-15','15:00',250),
        ('Justin Bieber: Never Say Never','SF LUND','2019-02-16','19:30',250),
        ('Interstellar','SF MALMÖ','2019-02-15','20:00',350),
        ('The Shawnshank Redemption','SF MALMÖ','2019-02-16','09:30',350),
        ('The Room','SF MALMÖ','2019-02-16','19:15',350),
        ('The Prestige','SF MALMÖ','2019-02-17','20:00',350),
        ('Interstellar','Eksjö biograf','2019-02-15','15:30',75),
        ('Justin Bieber: Never Say Never','Eksjö biograf','2019-02-16','12:00',75);



