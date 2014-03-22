CREATE TABLE USER(
USERNAME VARCHAR(30),
PASSWORD VARCHAR(32) NOT NULL,
DISPLAY_PICTURE VARCHAR(100),
EMAIL VARCHAR(30) NOT NULL,
PRIMARY KEY(USERNAME)
);
        
CREATE TABLE KATEGORI(
NAMA_KATEGORI VARCHAR(20),
PRIMARY KEY(NAMA_KATEGORI)
);

CREATE TABLE TUTORIAL(
ID INT AUTO_INCREMENT,
USER_ID VARCHAR(30) NOT NULL,
TITLE VARCHAR(50) NOT NULL,
CONTENT VARCHAR(500),
TOTAL_LIKE INT,
DATE_POSTED DATETIME NOT NULL,
DIFFICULTY VARCHAR(10),
KATEGORI VARCHAR(20),
PRIMARY KEY(ID),
FOREIGN KEY (USER_ID) 
        REFERENCES USER(USERNAME)
        ON DELETE CASCADE,
FOREIGN KEY (KATEGORI)
        REFERENCES KATEGORI(NAMA_KATEGORI)
        ON DELETE CASCADE
);

CREATE TABLE MESSAGE(
ID INT AUTO_INCREMENT,
SENDER_ID VARCHAR(30) NOT NULL,
RECEIVER_ID VARCHAR(30) NOT NULL,
CONTENT VARCHAR(500) NOT NULL,
DATE_POSTED DATETIME NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY (SENDER_ID) 
        REFERENCES USER(USERNAME)
        ON DELETE CASCADE,
FOREIGN KEY (RECEIVER_ID) 
        REFERENCES USER(USERNAME)
        ON DELETE CASCADE
);
        
CREATE TABLE FOTO_KREASI(
ID INT AUTO_INCREMENT,
TUTORIAL_ID INT NOT NULL,
USER_ID VARCHAR(30) NOT NULL,
DATE_POSTED DATETIME NOT NULL,
URL VARCHAR(100) NOT NULL,
TOTAL_VOTEUP INT,
TOTAL_VOTEDOWN INT,
PRIMARY KEY(ID),
FOREIGN KEY (TUTORIAL_ID) 
        REFERENCES TUTORIAL(ID)
        ON DELETE CASCADE,
FOREIGN KEY (USER_ID) 
        REFERENCES USER(USERNAME)
        ON DELETE CASCADE
);

CREATE TABLE COMMENT(
ID INT AUTO_INCREMENT,
TUTORIAL_ID INT NOT NULL,
USER_ID VARCHAR(30) NOT NULL,
CONTENT VARCHAR(100) NOT NULL,
DATE_POSTED DATETIME NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY (TUTORIAL_ID) 
        REFERENCES TUTORIAL(ID)
        ON DELETE CASCADE,
FOREIGN KEY (USER_ID) 
        REFERENCES USER(USERNAME)
        ON DELETE CASCADE
);

CREATE TABLE LINK(
ID INT AUTO_INCREMENT,
USER_ID VARCHAR(30) NOT NULL,
URL VARCHAR(100) NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY (USER_ID) 
        REFERENCES USER(USERNAME)
        ON DELETE CASCADE
);

CREATE TABLE FAVORITE_TUTORIAL(
USER_ID VARCHAR(30) NOT NULL,
TUTORIAL_ID INT NOT NULL,
PRIMARY KEY(USER_ID, TUTORIAL_ID),
FOREIGN KEY (TUTORIAL_ID) 
        REFERENCES TUTORIAL(ID)
        ON DELETE CASCADE,
FOREIGN KEY (USER_ID) 
        REFERENCES USER(USERNAME)
        ON DELETE CASCADE
);