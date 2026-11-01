-- Allow "money given between partners" entries (e.g. Babu gave ₹50,000 to Shiva).
-- Run once in Supabase → SQL Editor. Existing data is untouched.
alter table public.entries drop constraint if exists entries_type_check;
alter table public.entries add constraint entries_type_check check (type in ('expense', 'sale', 'transfer'));
alter table public.entries add column if not exists to_person text;
