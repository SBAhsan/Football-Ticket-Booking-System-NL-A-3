-- tables creation
create table users (
    user_id serial primary key,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    role varchar(50) check (role in ('Ticket Manager', 'Football Fan')),
    phone_number varchar(20)
);

create table matches (
    match_id serial primary key,
    fixture varchar(100),
    tournament_category varchar(50),
    base_ticket_price numeric(10, 2) check (base_ticket_price >= 0),
    match_status varchar(30) check (match_status in ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

create table bookings (
    booking_id serial primary key,
    user_id int references users(user_id),
    match_id int references matches(match_id),
    seat_number varchar(20),
    payment_status varchar(30) check (payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost numeric(10, 2) check (total_cost >= 0)
);

