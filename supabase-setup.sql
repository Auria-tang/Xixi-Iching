-- ============================================
-- Supabase Setup for Melody Metaphysics
-- Run this in: Supabase Dashboard > SQL Editor
-- ============================================

-- 1. Create the readings table
CREATE TABLE readings (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  birthday DATE NOT NULL,
  birth_time TEXT,
  email TEXT NOT NULL,
  country TEXT NOT NULL,
  payment_status TEXT DEFAULT 'pending',
  stripe_session_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Enable Row Level Security
ALTER TABLE readings ENABLE ROW LEVEL SECURITY;

-- 3. Allow anonymous inserts (for the frontend form)
CREATE POLICY "Allow anonymous insert" ON readings
  FOR INSERT
  WITH CHECK (true);

-- 4. Block anonymous reads (only you can see data via Supabase dashboard)
CREATE POLICY "Block anonymous select" ON readings
  FOR SELECT
  USING (false);
