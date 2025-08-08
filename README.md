# JAG Air Management — Mobile Web MVP

Free, testable **mobile web** (PWA) using Next.js + Supabase.

## Setup
1) Create a Supabase project.
2) In the SQL editor, run `db/schema.sql`, then `db/seed.sql`.
3) Copy `.env.local.example` -> `.env.local` and set your Supabase URL and anon key.
4) `npm install` and `npm run dev`

## Routes
- `/auth` login with magic link
- `/aircraft` list
- `/flights/new` create request (whole or seat-share on N208CR/N727EX)

## Notes
- Requests inside 24h are allowed but should be manager-approved.
- RLS and notifications should be added before external launch.
