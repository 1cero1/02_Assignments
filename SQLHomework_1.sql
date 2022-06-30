CREATE DATABASE Manufacturer;

USE Manufacturer;

--CREATE product table

CREATE TABLE[Product](
    [prod_id][int] PRIMARY KEY,
    [prod_name][varchar](50),
    [quantity][int]
);

--CREATE component table

CREATE TABLE [Component](
    [comp_id][int] PRIMARY KEY,
    [comp_name][varchar](50),
    [description][varchar](50),
    [quantity_comp][int]
);

--CREATE supplier table

CREATE TABLE [Supplier](
    [supp_id][int] PRIMARY KEY,
    [supp_name][varchar](50),
    [supp__location][varchar](50),
    [supp__country][varchar](50),
    [is_active][bit]
);

--CREATE prod_comp table

CREATE TABLE Prod_Comp(
    [prod_id][int],
    [comp_id][int],
    [quantity-comp][int],
    PRIMARY KEY ([prod_id],[comp_id])
);


--CREATE comp-supp

CREATE TABLE Comp_Supp(
    [supp_id][int],
    [comp_id][int],
    [order_date][date],
    [quantity][int],
    PRIMARY KEY ([supp_id],[comp_id])
);



ALTER TABLE prod_comp 
ADD CONSTRAINT FK_product 
FOREIGN KEY (prod_id) 
REFERENCES Product (prod_id)

ALTER TABLE prod_comp
ADD CONSTRAINT FK_component
FOREIGN KEY (comp_id)
REFERENCES Component (comp_id)


ALTER TABLE Comp_Supp 
ADD CONSTRAINT FK_product2 
FOREIGN KEY (supp_id) 
REFERENCES Supplier (supp_id)

ALTER TABLE Comp_Supp
ADD CONSTRAINT FK_component2
FOREIGN KEY (comp_id)
REFERENCES Component (comp_id)

