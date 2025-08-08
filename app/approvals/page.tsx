'use client';
import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabaseClient';

type Flight = {
  id: string;
  dep: string;
  arr: string;
  start_time: string;
  end_time: string;
  whole_aircraft: boolean;
  status: string;
  aircraft_id: string;
};

async function listRequested(): Promise<Flight[]> {
  const { data, error } = await supabase
    .from('flights')
    .select('id, dep, arr, start_time, end_time, whole_aircraft, status, aircraft_id, priority_flag, inside_min_notice')
    .eq('status', 'REQUESTED')
    .order('start_time', { ascending: true });
  if (error) throw error;
  return data || [];
}

export default function Approvals() {
  const [flights, setFlights] = useState<Flight[]>([]);
  const [err, setErr] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);

  const refresh = () => {
    setErr(null);
    listRequested().then(setFlights).catch(e => setErr(e.message));
  };

  useEffect(() => { refresh(); }, []);

  const updateStatus = async (id: string, status: 'APPROVED'|'DECLINED') => {
    setBusy(true);
    const { error } = await supabase.from('flights').update({ status }).eq('id', id);
    setBusy(false);
    if (error) setErr(error.message); else refresh();
  };

  return (
    <div>
      <h1>Approvals</h1>
      <p className="small">Manager only. Your DB RLS will enforce permissions.</p>
      {err && <div className="card" style={{borderColor:'red', color:'red'}}>{err}</div>}
      {flights.length === 0 && <div className="card">No pending requests.</div>}
      {flights.map(f => (
        
        <div key={f.id} className="card">
          <div><b>{f.dep}</b> → <b>{f.arr}</b></div>
          <div className="small">{new Date(f.start_time).toLocaleString()} to {new Date(f.end_time).toLocaleString()}</div>
          <div className="small">Priority: {f.priority_flag} {f.inside_min_notice ? '(Inside 24h)' : ''}</div>
          <div className="small">{f.whole_aircraft ? 'Whole aircraft' : 'Seat-sharing'}</div>
          <div style={{display:'flex', gap:8, marginTop:8}}>
            <button disabled={busy} className="btn btn-primary" onClick={() => updateStatus(f.id, 'APPROVED')}>Approve</button>
            <button disabled={busy} className="btn" onClick={() => updateStatus(f.id, 'DECLINED')}>Decline</button>
          </div>
        </div>
      ))}
    </div>
  );
}
