-- Table: Logs
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- id is the primary key for this table.
-- id is an autoincrement column.
--  
-- 
-- Write an SQL query to find all numbers that appear at least three times consecutively.
-- 
-- Return the result table in any order.
-- 
-- The query result format is in the following example.
-- 
--  
-- 
-- Example 1:
-- 
-- Input: 
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least three times.

select
  distinct num as ConsecutiveNums
from
  (
    select id, num, id - cast(row_number() over (order by num, id) as signed) as rk 
    from logs 
  ) t
group by
  num, rk
having
  count(*) >= 3;
