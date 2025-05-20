CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE todo_lists (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE todo_items (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    done BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE users_lists (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE NOT NULL,
    list_id INT REFERENCES todo_lists(id) ON DELETE CASCADE NOT NULL,
    UNIQUE(user_id, list_id)
);

CREATE TABLE lists_items (
    id SERIAL PRIMARY KEY,
    list_id INT REFERENCES todo_lists(id) ON DELETE CASCADE NOT NULL,
    item_id INT REFERENCES todo_items(id) ON DELETE CASCADE NOT NULL,
    UNIQUE(list_id, item_id)
);

-- Індекси
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_lists_user_id ON users_lists(user_id);
CREATE INDEX idx_users_lists_list_id ON users_lists(list_id);
CREATE INDEX idx_lists_items_list_id ON lists_items(list_id);
CREATE INDEX idx_lists_items_item_id ON lists_items(item_id);