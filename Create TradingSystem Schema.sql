CREATE SCHEMA trandingsystem
go


CREATE TABLE trader (
	id 		int,
	name 	varchar(50)
);
CREATE UNIQUE index idx_trader on trader(id); 

ALTER TABLE trader
ADD CONSTRAINT PK_trader PRIMARY KEY (id);


CREATE TABLE book (
	id 			int,
	name 		varchar(50),
	trader 		int,
	currency 	char(3)
);
CREATE UNIQUE index idx_book on book(id); 

ALTER TABLE book
ADD CONSTRAINT PK_Book PRIMARY KEY (id);

ALTER TABLE book
ADD CONSTRAINT FK_traderbook
FOREIGN KEY (trader) REFERENCES trader(id);

ALTER TABLE book
ADD CONSTRAINT FK_currencybook
FOREIGN KEY (currency) REFERENCES currency(code);


CREATE TABLE currency (
	code char(3),
	name varchar(50)
);

CREATE UNIQUE index idx_currency on currency(code); 

ALTER TABLE currency
ADD CONSTRAINT PK_currency PRIMARY KEY (code);



CREATE TABLE asset (
	id 		int,
	name 	varchar(50),
	type 	varchar(10),
	currency char(3)
);

CREATE UNIQUE index idx_asset on asset(id); 

ALTER TABLE asset
ADD CONSTRAINT PK_asset PRIMARY KEY (id);

ALTER TABLE asset
ADD CONSTRAINT FK_currencyasset
FOREIGN KEY (currency) REFERENCES currency(code);



CREATE TABLE price (
	asset_id 	int,
	date 		date,
	price  		numeric(20,10)
 );
 
ALTER TABLE price
ADD CONSTRAINT FK_asset_price
FOREIGN KEY (asset_id) REFERENCES asset(id);

CREATE UNIQUE index idx_price on price(asset_id, date); 

 
CREATE TABLE exchange_rate (
	ccy_from 	char(3),
	ccy_to 		char(3),
	date 		date,
	rate 		numeric(20,10)
 );
 
CREATE UNIQUE index idx_exchange_rate on exchange_rate(ccy_from, ccy_to, date); 
 
ALTER TABLE exchange_rate
ADD CONSTRAINT FK_exchange_rate_ccy_from
FOREIGN KEY (ccy_from) REFERENCES currency(code);

ALTER TABLE exchange_rate
ADD CONSTRAINT FK_exchange_rate_ccy_to
FOREIGN KEY (ccy_to) REFERENCES currency(code);

 
CREATE TABLE trade_status (
	code 	char(1),
	name 	varchar(50)
);
 
CREATE UNIQUE index idx_trade_status on trade_status(code); 
 
ALTER TABLE trade_status
ADD CONSTRAINT PK_trade_status PRIMARY KEY (code);
 
CREATE TABLE trade (
    book_id 	int,
    asset_id 	int,
    trade_date 	date,
    amount 		numeric(20,10),
    units 		numeric(20,10),
    status 		char(1)
);

ALTER TABLE trade
ADD CONSTRAINT FK_status_trade
FOREIGN KEY (status) REFERENCES trade_status(code);
 
ALTER TABLE trade
ADD CONSTRAINT FK_book_trade
FOREIGN KEY (book_id) REFERENCES book(id);

ALTER TABLE trade
ADD CONSTRAINT FK_asset_trade
FOREIGN KEY (asset_id) REFERENCES asset(id);

go




