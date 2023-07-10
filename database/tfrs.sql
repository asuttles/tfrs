CREATE TABLE IF NOT EXISTS supply (
       supply_id INTEGER PRIMARY KEY NOT NULL,
       branch TEXT NOT NULL,
       fy INTEGER NOT NULL CHECK (fy>23),
       category TEXT NOT NULL,
       available INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS activity (
       activity_id INTEGER PRIMARY KEY NOT NULL,
       facility TEXT UNIQUE,
       activity_type TEXT,
       description BLOB,
       date_start REAL,
       date_end REAL
);

CREATE TABLE IF NOT EXISTS assignment (
       assignment_id INTEGER PRIMARY KEY NOT NULL,
       activity_id INTEGER NOT NULL,
       supply_id INTEGER NOT NULL,
       assigned INTEGER
);

CREATE TABLE IF NOT EXISTS request (
       request_id INTEGER PRIMARY KEY NOT NULL,
       activity_id INTEGER NOT NULL,
       request_date REAL,
       requester_first_name TEXT,
       requester_last_name TEXT,
       requester_email TEXT UNIQUE,
       status TEXT
);
