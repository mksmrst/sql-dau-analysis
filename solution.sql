-- PostgreSQL.
with calendar as (
    select
        generate_series('2022-01-01'::date, '2022-01-01'::date + interval '150 days', '1 day') date_from_calendar
), cnt_of_daily as (
    select
        c.date_from_calendar,
        count(distinct u.user_id) daily_active_users_cnt
    from userentry u
    right join calendar c
        on c.date_from_calendar = u.entry_at::date
    group by c.date_from_calendar
)
select
    date_from_calendar,
    daily_active_users_cnt,
    max(daily_active_users_cnt) over(order by date_from_calendar rows between unbounded preceding and current row) max_dau_cnt,
    daily_active_users_cnt - max(daily_active_users_cnt) over(order by date_from_calendar rows between unbounded preceding and current row) diff_dau
from cnt_of_daily
order by date_from_calendar
