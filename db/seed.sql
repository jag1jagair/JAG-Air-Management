-- Seed data for JAG Air
-- Owners
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Albuerne', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Elizondo', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Hector Villarreal', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Chui Gracia', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Federico Treviño', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Gustavo Guerra', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Rodolfo Camarillo', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Alejandro Gil', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Pablo Mena', 'jarturoge@jagair.mx', '528117174757.0', true, true);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Rafael Almanza', 'Jaginc@jagair.mx', '528117124599.0', true, true);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Caravan Regio LLC', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Operadora N402FB SA de CV', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Nextant Regio LLC', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('N651CC LLC', NULL, NULL, true, false);
insert into owners (name, email, phone_e164, sms_opt_in, notify_enabled) values ('Gulfstream Regio LLC', NULL, NULL, true, false);

-- Aircraft
insert into aircraft (tail, seats, seat_sharing_enabled, base_airport, owner_pool) values ('N208CR', 9, true, 'MMAN', 'Caravan Regio LLC');
insert into aircraft (tail, seats, seat_sharing_enabled, base_airport, owner_pool) values ('N727EX', 8, true, 'MMAN', 'Caravan Regio LLC');
insert into aircraft (tail, seats, seat_sharing_enabled, base_airport, owner_pool) values ('N402FB', 8, false, 'MMAN', 'Operadora N402FB SA de CV');
insert into aircraft (tail, seats, seat_sharing_enabled, base_airport, owner_pool) values ('N217EC', 8, false, 'MMAN', 'Nextant Regio LLC');
insert into aircraft (tail, seats, seat_sharing_enabled, base_airport, owner_pool) values ('N651CC', 9, false, 'MMAN', 'N651CC LLC');
insert into aircraft (tail, seats, seat_sharing_enabled, base_airport, owner_pool) values ('N132JC', 10, false, 'MMAN', 'Gulfstream Regio LLC');

-- Ownerships

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N402FB' limit 1),
  (select id from owners where name = 'Albuerne' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N402FB' limit 1),
  (select id from owners where name = 'Elizondo' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N402FB' limit 1),
  (select id from owners where name = 'Hector Villarreal' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N402FB' limit 1),
  (select id from owners where name = 'Chui Gracia and Federico Treviño' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N217EC' limit 1),
  (select id from owners where name = 'Gustavo Guerra' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N217EC' limit 1),
  (select id from owners where name = 'Rodolfo Camarillo' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N217EC' limit 1),
  (select id from owners where name = 'Alejandro Gil' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N217EC' limit 1),
  (select id from owners where name = 'Pablo Mena and Rafael Almanza' limit 1),
  25
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N651CC' limit 1),
  (select id from owners where name = 'Pablo Mena' limit 1),
  50
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N651CC' limit 1),
  (select id from owners where name = 'Rafael Almanza' limit 1),
  50
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N132JC' limit 1),
  (select id from owners where name = 'Pablo Mena' limit 1),
  50
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N132JC' limit 1),
  (select id from owners where name = 'Rafael Almanza' limit 1),
  50
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N208CR' limit 1),
  (select id from owners where name = 'Caravan Regio LLC' limit 1),
  100
);

insert into ownerships (aircraft_id, owner_id, percentage)
values (
  (select id from aircraft where tail = 'N727EX' limit 1),
  (select id from owners where name = 'Caravan Regio LLC' limit 1),
  100
);
-- App users (map emails to roles/owners)
-- Manager
insert into app_users (email, role, owner_id)
values ('jag1@jagair.mx', 'Manager', null);

-- Test owner users (mapped to their owner records)
insert into app_users (email, role, owner_id)
values 
('jarturoge@jagair.mx', 'Owner', (select id from owners where name = 'Pablo Mena' limit 1)),
('Jaginc@jagair.mx', 'Owner', (select id from owners where name = 'Rafael Almanza' limit 1));
