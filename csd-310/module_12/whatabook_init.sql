"""
    Title: db_init.sql
    Author: Siryon George
    Date: August 4, 2023
    Description: whatabook database initialization script.
    Reference: Krasso, P. (2020, July 27). buwebdev/csd-310.
"""


---- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

---- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

---- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

---- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

---- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;


---- Create table(s)

CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);


---- insert store record 

INSERT INTO store(locale)
    VALUES('1739 River Rd, Columbus, OH 43212');


---- insert book records 

INSERT INTO book(book_name, author, details)
    VALUES('The Mountain In The Sea', 'Ray Nayler', 'The first part of The River');

INSERT INTO book(book_name, author, details)
    VALUES('Big Swiss', 'Jen Beagin', 'The second part of Day Light');

INSERT INTO book(book_name, author, details)
    VALUES('Fellowship Point', 'Alice Dark', 'Walking together in the Light');

INSERT INTO book(book_name, author)
    VALUES('Signal Fires', 'Dani Shapiro');

INSERT INTO book(book_name, author)
    VALUES('The Guest', 'Emma Cline');

INSERT INTO book(book_name, author)
    VALUES('Romantic Comedy', 'Curtis Sittenfeld');

INSERT INTO book(book_name, author)
    VALUES('My Last Innocent Year', 'Daisy Florin');

INSERT INTO book(book_name, author)
    VALUES('The Eyes & The Impossible', 'Dave Eggers');

INSERT INTO book(book_name, author)
    VALUES('Atomic Habits', 'James Clear');


---- insert user
 
INSERT INTO user(first_name, last_name) 
    VALUES('James', 'Brown');

INSERT INTO user(first_name, last_name)
    VALUES('Grace', 'David');

INSERT INTO user(first_name, last_name)
    VALUES('Mary', 'Freeman');

---- insert wishlist records 

INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'James'), 
        (SELECT book_id FROM book WHERE book_name = 'Signal Fires')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Grace'),
        (SELECT book_id FROM book WHERE book_name = 'Big Swiss')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Mary'),
        (SELECT book_id FROM book WHERE book_name = 'The Mountain In The Sea')
    );