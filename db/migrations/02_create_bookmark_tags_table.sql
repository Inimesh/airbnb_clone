CREATE TABLE bookmark_tags(id SERIAL PRIMARY KEY, bookmark_id INTEGER REFERENCES bookmarks (id), tag_id INTEGER REFERENCES tags (id));

