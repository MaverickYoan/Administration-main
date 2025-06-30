-- Base de données (si vous en créez une nouvelle, par exemple pour MySQL)
-- CREATE DATABASE IF NOT EXISTS portail_admin_fr CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- USE portail_admin_fr;

-- 1. Table Categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    icon_emoji VARCHAR(10),
    data_category_slug VARCHAR(100) UNIQUE COMMENT 'Correspond à data-category dans le HTML'
);

-- 2. Table Sites
CREATE TABLE Sites (
    site_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(512) NOT NULL UNIQUE,
    category_id INT,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 3. Table Keywords
CREATE TABLE Keywords (
    keyword_id INT AUTO_INCREMENT PRIMARY KEY,
    keyword_text VARCHAR(100) NOT NULL UNIQUE
);

-- 4. Table de liaison SiteKeywords
CREATE TABLE SiteKeywords (
    site_id INT,
    keyword_id INT,
    PRIMARY KEY (site_id, keyword_id),
    FOREIGN KEY (site_id) REFERENCES Sites(site_id) ON DELETE CASCADE,
    FOREIGN KEY (keyword_id) REFERENCES Keywords(keyword_id) ON DELETE CASCADE
);

-- 5. Table QuickLinks
CREATE TABLE QuickLinks (
    quicklink_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    url VARCHAR(512) NOT NULL UNIQUE
);

-- Ajout d'index pour améliorer les performances de recherche
CREATE INDEX idx_sites_name ON Sites(name);
CREATE INDEX idx_keywords_text ON Keywords(keyword_text);