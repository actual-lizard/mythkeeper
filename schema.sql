DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS creature;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS task;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS user_item;

CREATE TABLE user (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	username TEXT UNIQUE NOT NULL,
	password TEXT NOT NULL,
	gold INTEGER NOT NULL
);

CREATE TABLE creature (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL, 
	health INTEGER NOT NULL,
	max_health INTEGER NOT NULL,
	alive INTEGER NOT NULL,
	owner_id INTEGER,
	species_id INTEGER,
	FOREIGN KEY (owner_id) REFERENCES user(id),
	FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE item (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	price INTEGER NOT NULL,
	health_value INTEGER
);

CREATE TABLE task (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	difficulty INTEGER NOT NULL,
	description TEXT NOT NULL,
	owner_id INTEGER NOT NULL, 
	FOREIGN KEY (owner_id) REFERENCES user(id)
);

CREATE TABLE species (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	starting_health INTEGER NOT NULL
);

CREATE TABLE user_item (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	item_count INTEGER NOT NULL,
	user_id INTEGER,
	item_id INTEGER,
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (item_id) REFERENCES item(id)
);
