import { createSignal } from "solid-js";
import Icon from "../components/Icon";

export default function Dashboard() {
  const [count, setCount] = createSignal(0)

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

export function NoChores() {
  return <div class="empty text-center">
    <Icon icon="broom" />
    <h2>No Chores</h2>
    <p>Cleanup your act and schedule a chore.</p>
    <button class="btn btn-secondary" type="button">Plan a Chore</button>
  </div>
}
