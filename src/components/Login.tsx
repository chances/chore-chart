import { createAsyncStore, useLocation, useParams } from "@solidjs/router";
import { assert } from "@std/assert";
import { } from "@std/async";
import { createSignal, onMount, Show } from "solid-js";

import Icon from "../components/Icon";

export default function Chore() {
  const { pathname } = useLocation();
  assert(pathname.length >= 0);
  const { returnTo } = useParams<{ returnTo?: string }>();
  const isLogin = pathname.includes("/login");
  const title = isLogin ? "Log In" : "Sign Up";

  function goToReturn() {
    window.location.assign(returnTo ?? "/dashboard/");
  }

  return <>
    <div class="d-flex align-items-center gap-2">
      <div class="col-3">
        <a href="#" class="btn btn-circular btn-dark btn-outline-secondary" title="Go Back" onClick={() => window.history.back()}><Icon icon="chevron-left" /></a>
      </div>
      <h1>{title}</h1>
    </div>
    <Show when={isLogin}><LoginForm goToReturn={goToReturn} /></Show>
    <Show when={!isLogin}><SignUpForm goToReturn={goToReturn} /></Show>
  </>;
}

function LoginForm(props?: { goToReturn?: VoidFunction }) {
  const [userId, setUserId] = createSignal(null as (string | null));
  onMount(() => {});

  return <form onSubmit={(ev) => {
    ev.preventDefault();
    props?.goToReturn ?? (() => {});
  }}>
    <p class="form-text">Don't have an account? <a href="/signup">Sign Up</a></p>
  </form>;
}

function SignUpForm(props?: { goToReturn?: VoidFunction }) {
  const [userId, setUserId] = createSignal(null as (string | null));
  const getUser = createAsyncStore(async () => {});
  onMount(() => {});

  return <form onSubmit={(ev) => {
    ev.preventDefault();
    props?.goToReturn ?? (() => {});
  }}></form>;
}
