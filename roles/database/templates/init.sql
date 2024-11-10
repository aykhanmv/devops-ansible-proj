-- Create the User table
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    is_superuser BOOLEAN NOT NULL,
    created_at VARCHAR(16) DEFAULT NULL
);

-- Create the Profile table
CREATE TABLE IF NOT EXISTS profile (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cover_path VARCHAR(255),
    location VARCHAR(255),
    description TEXT,
    seats INT,
    opening_hours VARCHAR(255),
    closing_hours VARCHAR(255),
    menu_json TEXT,
    is_live BOOLEAN NOT NULL DEFAULT FALSE,
    restaurant_id INT UNIQUE,
    created_at VARCHAR(16) DEFAULT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES user(id) ON DELETE CASCADE
);

-- Create the Reservations table
CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seat INT NOT NULL,
    day VARCHAR(255) NOT NULL,
    hour VARCHAR(255) NOT NULL,
    user_id INT,
    restaurant_id INT,
    created_at VARCHAR(16) DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES user(id) ON DELETE CASCADE
);
