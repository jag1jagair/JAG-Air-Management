# JAG Air — Setup Guide (No Coding Needed)

### Part A — Create your free backend
1) Go to https://supabase.com/ and click **Start your project** → create free project.
2) In Supabase, open **SQL Editor**. Copy-paste and run the contents of:
   - `db/schema.sql`
   - `db/seed.sql`
3) Go to **Authentication → Providers** and enable **Email** (Magic Link).

### Part B — Run the app on the web (free)
**Option 1: Vercel (easiest)**
1) Go to https://vercel.com/ → Sign up → **New Project** → **Import** this folder after you upload it to GitHub.
2) When Vercel asks for **Environment Variables**, add:
   - `NEXT_PUBLIC_SUPABASE_URL` = (copy from Supabase → Project Settings → API)
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` = (copy from Supabase → Project Settings → API)
3) Click **Deploy**. In ~1 minute you’ll get a URL like:
   `https://your-project-name.vercel.app`
4) That link is your **mobile web app**. Save to home screen to use like an app.

**Option 2: Run on your computer**
1) Install Node.js from https://nodejs.org/ (LTS).
2) In the project folder, open Terminal and run:
   - `npm install`
   - `npm run dev`
3) Open http://localhost:3000 on your phone (same Wi‑Fi) or computer.

### Part C — Your test users (no password needed)
- **Manager (you):** `jag1@jagair.mx`
- **Owner test (Pablo):** `jarturoge@jagair.mx`
- **Owner test (Rafael):** `Jaginc@jagair.mx`

Login is by **magic link** (email). Click **Login**, enter your email, and open the link you receive.

> If you prefer password login, in Supabase → Auth → Enable "Email + Password", then click **“Invite user”** in **Authentication → Users** and set a temporary password.

### Part D — Add weeks (timeshare)
1) Supabase → **Table Editor** → `owner_weeks`.
2) Click **Insert Row** and fill:
   - `aircraft_id`: use the dropdown (pick the tail)
   - `owner_id`: pick the owner
   - `week_start`, `week_end`: the dates for that owner’s week
   - `recurs`: (optional) `YEARLY`

The system marks requests with **WEEK_OWNER_PRIORITY** if the **week owner** requests the flight **≥72 hours** before departure.

### Part E — Approvals
- Go to `/approvals` (top menu) as the Manager. You’ll see **REQUESTED** flights, plus flags:
  - **Priority:** `WEEK_OWNER_PRIORITY` if the 72‑hour rule applies.
  - **(Inside 24h)** shows if request is inside the minimum notice (requires your approval).

### Part F — Next (optional)
- Add SMS/email notifications later (see `edge/notifications/README.md` placeholder).
- Lock down **RLS** further for production (already limited by role/ownership).

If you get stuck, send me your Vercel URL and Supabase project URL, and I’ll point-click walk you through from there.
