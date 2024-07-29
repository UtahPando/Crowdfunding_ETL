DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'contacts') THEN
        DROP TABLE contacts;
    END IF;

	IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'category') THEN
        DROP TABLE category;
    END IF;

	IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subcategory') THEN
        DROP TABLE subcategory;
    END IF;

	IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'campaign') THEN
        DROP TABLE campaign;
    END IF;

END $$;
	
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE category (
    category_id VARCHAR(5) PRIMARY KEY NOT NULL,
    category VARCHAR(50)
);

CREATE TABLE subcategory (
    subcategory_id VARCHAR(8) PRIMARY KEY NOT NULL,
    subcategory VARCHAR(50)
);

CREATE TABLE campaign (
    cf_id INT PRIMARY KEY NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR(100),
    description VARCHAR(255),
    goal FLOAT,
    pledged FLOAT,
    outcome VARCHAR(50),
    backers_count INT,
    country VARCHAR(50),
    currency VARCHAR(10),
    launch_date DATE,
    end_date DATE,
    category_id VARCHAR(5) NOT NULL,
    subcategory_id VARCHAR(8) NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);