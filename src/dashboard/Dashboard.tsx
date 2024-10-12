import { createSignal } from "solid-js";

import NoChores from "../components/NoChores";

// TODO: https://supabase.com/docs/reference/javascript/initializing

export default function Dashboard() {
  const [count, setCount] = createSignal(0);

  return (
    <>
      <NoChores />
      <h1 class="fs-2">Overview</h1>
      <div class="card">
        <button class="btn" onClick={() => setCount((count) => count + 1)}>
          Count is: {count()}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR.
        </p>
      </div>
    </>
  )
}
