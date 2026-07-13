/*
# Add amount column to payments table

1. Modified Tables
- `payments`: add `amount` column (numeric, nullable) to store the tuition amount paid.
2. Notes
- The column is nullable so existing payment rows remain valid.
- No RLS changes needed — existing policies already cover the table.
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_schema = 'public' AND table_name = 'payments' AND column_name = 'amount'
  ) THEN
    ALTER TABLE payments ADD COLUMN amount numeric DEFAULT 0;
  END IF;
END $$;
