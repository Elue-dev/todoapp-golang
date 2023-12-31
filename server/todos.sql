CREATE TABLE todos (
    ID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    IsCompleted BOOLEAN DEFAULT false,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE todos
ADD COLUMN userId UUID REFERENCES users(ID);

CREATE TABLE users (
    ID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password TEXT NOT NULL,
    Username VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users
ADD COLUMN avatar TEXT;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";