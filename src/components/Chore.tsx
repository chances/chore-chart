import { createAsyncStore, useLocation, useParams } from "@solidjs/router";
import { assert } from "@std/assert";
import { } from "@std/async";
import { Accessor, createSignal, onMount, Show } from "solid-js";

import * as models from "../models";
import { Frequency, frequencies, newChore, unnamedChore } from "../models";
import Icon from "../components/Icon";
import Input from "../components/Input";

// TODO: https://supabase.com/docs/reference/javascript/initializing

export default function Chore() {
  const { search } = useLocation();
  assert(search.length >= 0);
  const { id } = useParams<{ id: string }>();
  const isNew = id === "new";
  const title = id === "list" ? "Chores" : null;
  const [chore] = loadChore(isNew ? null : id);

  return <>
    <div class="d-flex align-items-center gap-2">
      <div class="col-3">
        <a href="#" class="btn btn-circular btn-dark btn-outline-secondary" title="Go Back" onClick={() => window.history.back()}><Icon icon="chevron-left" /></a>
      </div>
      <h1>{isNew ? "Plan a Chore" : (title ?? chore()?.name ?? unnamedChore)}</h1>
    </div>
    <Show when={isNew}><CreateChoreForm chore={chore} /></Show>
  </>;
}

function loadChore(id: string | null): [Accessor<models.Chore | null>, Accessor<boolean>] {
  assert(id ?? id === null);
  const [isLoaded, setIsLoaded] = createSignal(false);

  return [createAsyncStore(() => Promise.resolve(newChore("me")).then((chore) => {
      setIsLoaded(true);
      return chore;
    }), {
      name: id ?? "New Chore",
      initialValue: id === null ? newChore("me") : null,
      reconcile: { key: "id", merge: false }
    }), isLoaded];
}

export function CreateChoreForm(props: { chore: Accessor<models.Chore | null> }) {
  const chore = props.chore();
  const [users] = createSignal([] as { id: string, name: string }[]);
  const [name, setName] = createSignal(chore?.name ?? "");
  const [notes, setNotes] = createSignal(chore?.notes ?? "");

  let form: HTMLFormElement | undefined;
  let actions: HTMLElement | undefined;
  let submit: HTMLButtonElement | undefined;
  // Autofocus first form input
  onMount(() => (form?.querySelector("[autofocus]") as HTMLElement | null)?.focus());

  return <form ref={el => form = el} onSubmit={(ev) => {
      const isFormInvalid = !form?.checkValidity();

      ev.preventDefault();
      form?.classList.add("was-validated");
      Array.from(actions?.querySelectorAll(".invalid-feedback") ?? []).forEach(el => el.classList.remove("d-inline"));
      if (isFormInvalid) {
        // TODO: Re-enable submit button when form is `:valid`
        submit?.setAttribute("disabled", "");
        Array.from(form?.elements ?? [])
        Array.from(actions?.querySelectorAll(".invalid-feedback") ?? []).forEach(el => el.classList.add("d-inline"));
        (form?.querySelector("input:invalid, select:invalid, textarea:invalid") as HTMLElement | null)?.focus();
        return;
      }

      const payload = JSON.parse(JSON.stringify(chore!));
      payload.updated = new Date();
      console.log(payload);
    }}>
    <Input name="Name" required value={name} onChange={setName} autofocus placeholder="Sweep the kitchen" />
    <div class="mb-3 row">
      <label for="frequency" class="col-sm-3 col-form-label">Frequency</label>
      <div class="input col-sm-9">
        <select id="frequency" class="form-select" aria-describedby="frequencyDesc">
          {frequencies.map(freq => {
            return <option value={freq}>{`${Frequency.nameOf(freq)} – ${Frequency.labelOf(freq)}`}
            </option>;
          })}
        </select>
        <p id="frequencyDesc" class="form-text text-muted" aria-label="">How often will you finish this chore?</p>
      </div>
    </div>
    <div class="mb-3 row">
      <label for="asignee" class="col-sm-3 col-form-label">Asignee</label>
      <div class="input col-sm-9">
        <select id="asignee" class="form-select" aria-describedby="asigneeDesc">
          <option value={"nobody"}>Nobody</option>
          {users().map(user => <option value={user.id}>{user.name}</option>)}
        </select>
        <p id="asigneeDesc" class="form-text text-muted" aria-label="">Who will finish this chore?</p>
      </div>
    </div>
    <Input name="Notes" value={notes} onChange={setNotes} />
    <div class="d-inline-flex float-end align-items-center gap-2" ref={el => actions = el}>
      <p class="invalid-feedback m-0">Uh-oh, there's a problem!</p>
      <button type="reset" class="btn btn-secondary" onClick={() => {
        submit?.removeAttribute("disabled");
        Array.from(actions?.querySelectorAll(".invalid-feedback") ?? []).forEach(el => el.classList.remove("d-inline"));
      }}>Reset</button>
      <button type="submit" class="btn btn-success col-auto" ref={submit}>Save</button>
    </div>
  </form>;
}
