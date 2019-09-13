
-- Query those tables to find the current position of the firm (how long and short it is on each of the securities it trades)

set @reporting_ccy  = "USD";
set @reporting_date = "20190103";
 
select 
    a.name "asset", 
    r2.ccy_from "currency",  
    round(sum(t.units * p.price * r1.rate / r2.rate),2) "MV"
 from trade t
 join book b
   on b.id = t.book_id
join asset a
  on a.id = t.asset_id
join price p
  on p.asset_id = t.asset_id
 and p.date = @reporting_date
join exchange_rate r1
  on r1.ccy_from = a.currency
join exchange_rate r2
  on r2.ccy_from = @reporting_ccy  
and r2.date = r1.date
where r1.date = @reporting_date
  and t.status = "F" -- filled only
group by a.name, r2.ccy_from;



-- Query those tables to find the ten securities to which the firm has the greatest exposure (either long or short). 

set @reporting_ccy  = "USD";
set @reporting_date = "20190103";

select  
    a.name "asset", 
    r2.ccy_from "currency",  
    round(abs(sum(t.units * p.price * r1.rate / r2.rate)),2) "MV"
 from trade t
 join book b
   on b.id = t.book_id
join asset a
  on a.id = t.asset_id
join price p
  on p.asset_id = t.asset_id
 and p.date = @reporting_date
join exchange_rate r1
  on r1.ccy_from = a.currency
 join exchange_rate r2
   on r2.ccy_from = @reporting_ccy  
  and r2.date = r1.date
where r1.date = @reporting_date
  and t.status = "F" -- filled only
group by a.name, r2.ccy_from
order by abs(sum(t.units * p.price * r1.rate / r2.rate)) desc limit 10; -- top 10 assets



-- Query those tables to find the trader with the highest aggregate exposure among their top five securities.

set @reporting_ccy  = "USD";
set @reporting_date = "20190103";

with trader_values as (
select  
    tr.name "trader", 
    a.name "asset",
    round(abs(sum(t.units * p.price * r1.rate / r2.rate)),2) "MV",
    rank() over ( partition by
                    trader
                 order by
                    round(abs(sum(t.units * p.price * r1.rate / r2.rate)),2) desc
                ) amount_rank
 from trade t
 join book b
   on b.id = t.book_id
join trader tr
  on tr.id = b.trader
join asset a
  on a.id = t.asset_id
join price p
  on p.asset_id = t.asset_id
 and p.date = @reporting_date
join exchange_rate r1
  on r1.ccy_from = a.currency
 join exchange_rate r2
   on r2.ccy_from = @reporting_ccy  
  and r2.date = r1.date
where r1.date = @reporting_date
  and t.status = "F" -- filled only
group by tr.name, a.name
)
select trader, sum(MV) "Total Exposure"
from trader_values
where amount_rank <= 5 -- top 5 stocks
group by trader 
order by sum(MV) desc limit 1; -- top trader
