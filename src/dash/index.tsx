/* @refresh reload */
import { delay } from "@std/async/delay";
import { render } from "solid-js/web";
import { Router } from "@solidjs/router";

import Dashboard from './Dashboard'

const root = document.body;
root.querySelectorAll(".spinner-border").forEach(el => el.classList.add("fade"));

await delay(250).then(bootstrap);

function bootstrap() {
  removeChildren(root);
  render(() => <>
    <Header />
    <main class="container">
      <Router root={Dashboard} />
    </main>
  </>, root);
}

function removeChildren(node: Node) {
  while(node.firstChild) node.removeChild(node.lastChild!);
}

export function Header() {
  return <header>
    <nav class="navbar navbar-expand pe-2">
      <a href="/" class="navbar-brand">
        <img src="calendar-48.png" alt="" />
        <span class="label">Chore Chart</span>
      </a>
      <ul class="navbar-nav collapse navbar-collapse">
        <li class="nav-item">
          <a href="#features" class="nav-link">Dashboard</a>
        </li>
        <li class="nav-item">
          <a href="#pricing" class="nav-link">Chores</a>
        </li>
        <li class="nav-item">
          <a href="/help" class="nav-link" target="_blank">Help</a>
        </li>
      </ul>
      <ul class="actions navbar-nav">
        <li class="nav-item">
          <a href="/login" class="nav-link">Log In</a>
        </li>
        <li class="nav-item ps-2">
          <Upgrade />
        </li>
      </ul>
    </nav>
  </header>;
}

export function Upgrade() {
  return <a href="/#pricing" class="btn btn-primary" title="Upgrade to enjoy enhanced features">Upgrade</a>;
}
