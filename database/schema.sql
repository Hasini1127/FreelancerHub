CREATE DATABASE IF NOT EXISTS freelancehub;
USE freelancehub;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('client', 'freelancer') NOT NULL,
    profile_image VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE freelancer_profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    professional_title VARCHAR(255) DEFAULT NULL,
    bio TEXT DEFAULT NULL,
    hourly_rate DECIMAL(10,2) DEFAULT NULL,
    experience VARCHAR(100) DEFAULT NULL,
    availability VARCHAR(100) DEFAULT NULL,
    location VARCHAR(255) DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE freelancer_skills (
    freelancer_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (freelancer_id, skill_id),
    FOREIGN KEY (freelancer_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    budget DECIMAL(10,2) NOT NULL,
    deadline DATE NOT NULL,
    experience_level VARCHAR(50) NOT NULL,
    status ENUM('Open', 'Under Review', 'Assigned', 'In Progress', 'Submitted', 'Completed', 'Cancelled') DEFAULT 'Open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE project_skills (
    project_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (project_id, skill_id),
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);

CREATE TABLE proposals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    cover_letter TEXT NOT NULL,
    bid_amount DECIMAL(10,2) NOT NULL,
    delivery_days INT NOT NULL,
    status ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (freelancer_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_proposal (project_id, freelancer_id)
);

CREATE TABLE contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    client_id INT NOT NULL,
    freelancer_id INT NOT NULL,
    agreed_amount DECIMAL(10,2) NOT NULL,
    start_date DATE NOT NULL,
    deadline DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Active',
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (freelancer_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE portfolio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    freelancer_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    technologies VARCHAR(255),
    project_url VARCHAR(255),
    image_url VARCHAR(255),
    FOREIGN KEY (freelancer_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    reviewed_user_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    project_id INT DEFAULT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    read_status BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE SET NULL
);

CREATE TABLE notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    type VARCHAR(50) NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
