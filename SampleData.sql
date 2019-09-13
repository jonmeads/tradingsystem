use tradingsystem
go

insert into trader values (1, "Bob");
insert into trader values (2, "Fred");
insert into trader values (3, "Jack");


insert into book values (1, "Bob Tech book", 1, "USD");
insert into book values (2, "Bob global portfolio", 1, "USD");
insert into book values (3, "Freds portfolio", 2, "EUR");
insert into book values (4, "Jacks", 3, "GBP");



insert into currency values ("USD", "US Dollars");
insert into currency values ("GBP", "Pound");
insert into currency values ("EUR", "EURO");
insert into currency values ("CAD", "CAD Dollars");


insert into asset values (1, "Google", "Equity", "USD");
insert into asset values (2, "Apple", "Equity", "USD");
insert into asset values (3, "Facebook", "Equity", "USD");
insert into asset values (4, "Shell", "Equity", "EUR");
insert into asset values (5, "BP", "Equity", "EUR");
insert into asset values (6, "Tesco", "Equity", "GBP");
insert into asset values (7, "John Lewis", "Equity", "GBP");
insert into asset values (8, "HSBC", "Equity", "GBP");
insert into asset values (9, "Royal Bank of Canada", "Equity", "CAD");


 
insert into price values (1, "20190101", 100.0);
insert into price values (1, "20190102", 101.0);
insert into price values (1, "20190103", 101.0);
insert into price values (2, "20190101", 150.0);
insert into price values (2, "20190102", 151.0);
insert into price values (2, "20190103", 145.0);
insert into price values (3, "20190101", 80.0);
insert into price values (3, "20190102", 81.0);
insert into price values (3, "20190103", 85.0);
insert into price values (4, "20190101", 45.0);
insert into price values (4, "20190102", 47.0);
insert into price values (4, "20190103", 44.0);
insert into price values (5, "20190101", 35.0);
insert into price values (5, "20190102", 37.0);
insert into price values (5, "20190103", 37.0);
insert into price values (6, "20190101", 15.0);
insert into price values (6, "20190102", 17.0);
insert into price values (6, "20190103", 17.0);
insert into price values (7, "20190101", 15.0);
insert into price values (7, "20190102", 17.0);
insert into price values (7, "20190103", 17.0);
insert into price values (8, "20190101", 25.0);
insert into price values (8, "20190102", 27.0);
insert into price values (8, "20190103", 26.0);
insert into price values (9,  "20190101", 33.0);
insert into price values (9, "20190102", 33.0);
insert into price values (9, "20190103", 33.0);


 
insert into exchange_rate values ("USD", "USD", "20190101", 1.0);
insert into exchange_rate values ("GBP", "USD", "20190101", 1.2);
insert into exchange_rate values ("EUR", "USD", "20190101", 1.1);
insert into exchange_rate values ("CAD", "USD", "20190101",  1.3);
insert into exchange_rate values ("USD", "USD", "20190102", 1.0);
insert into exchange_rate values ("GBP", "USD", "20190102", 1.2);
insert into exchange_rate values ("EUR", "USD", "20190102", 1.1);
insert into exchange_rate values ("CAD", "USD", "20190102",  1.3);
insert into exchange_rate values ("USD", "USD", "20190103", 1.0);
insert into exchange_rate values ("GBP", "USD", "20190103", 1.2);
insert into exchange_rate values ("EUR", "USD", "20190103", 1.1);
insert into exchange_rate values ("CAD", "USD", "20190103",  1.3);
 
insert into trade_status values ("O", "OPEN");
insert into trade_status values ("C", "Cancelled");
insert into trade_status values ("F", "Filled");
 

insert into trade values (1,1,"20190101",12000,120,"F");
insert into trade values (1,2,"20190101",12000,80,"F");
insert into trade values (1,3,"20190101",14000,175,"F");
insert into trade values (2,5,"20190101",4000,114.285714285714,"F");
insert into trade values (2,6,"20190101",5000,333.333333333333,"F");
insert into trade values (2,7,"20190101",3600,240,"F");
insert into trade values (2,8,"20190101",6000,240,"F");
insert into trade values (3,3,"20190101",-6000,-75,"F");
insert into trade values (3,4,"20190101",6000,133.333333333333,"F");
insert into trade values (3,5,"20190101",6000,171.428571428571,"F");
insert into trade values (3,6,"20190101",-4000,-266.666666666667,"F");
insert into trade values (3,7,"20190101",6000,400,"F");
insert into trade values (3,8,"20190101",-5000,-200,"F");
insert into trade values (3,9,"20190101",-5000,-151.515151515152,"F");
insert into trade values (4,1,"20190101",-3000,-30,"F");
insert into trade values (4,2,"20190101",-7000,-46.6666666666667,"F");
insert into trade values (4,3,"20190101",-6000,-75,"F");
insert into trade values (4,4,"20190101",-3000,-66.6666666666667,"F");
insert into trade values (4,5,"20190101",-4000,-114.285714285714,"F");
insert into trade values (4,6,"20190101",6000,400,"F");
insert into trade values (4,7,"20190101",6000,400,"F");
insert into trade values (4,8,"20190101",4000,160,"F");
insert into trade values (4,9,"20190101",3000,90.9090909090909,"F");

go

 




