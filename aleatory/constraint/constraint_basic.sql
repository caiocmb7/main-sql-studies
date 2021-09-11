DROP DATABASE IF EXISTS ig_clone2;
CREATE DATABASE ig_clone2;
USE ig_clone2; 

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE photos
ADD CONSTRAINT FK_photos_users FOREIGN KEY(user_id) REFERENCES users(id);

DESC photos;

DESC users;

/* PODE USAR ASSIM TAMBEM, SETANDO O FOREIGN KEY NA HORA DA CRIAÇAO DA TABELA

CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

*/

