/* @refresh reload */
import { delay } from "@std/async/delay";
import { lazy, JSX } from "solid-js";
import { render } from "solid-js/web";
import { Route, RouteSectionProps, Router } from "@solidjs/router";

const Dashboard = lazy(() => import("./Dashboard"));
const Chore = lazy(() => import("../components/Chore"));

const root = document.body;
root.querySelectorAll(".spinner-border").forEach(el => el.classList.add("fade"));

await delay(250).then(bootstrap);

function Page(props: RouteSectionProps & JSX.HTMLAttributes<HTMLElement>) {
  const { location } = props;

  return <>
    <main class="container">
      {props.children}
    </main>
    <footer>
      <p>{location.pathname}{location.hash}</p>
      <ul>
        {Object.keys(location.query).map(q => <li>{q.toString()}</li>)}
      </ul>
    </footer>
  </>;
}

function bootstrap() {
  removeChildren(root);
  render(() => <>
    <Header />
    <Router root={Page}>
      <Route path="/dashboard/:section?" component={Dashboard} />
      <Route path="/chore/:id" component={Chore} />
      <Route path="/login" component={Dashboard} />
      <Route path="/*" component={function gotoWebsite(props: RouteSectionProps) {
        const { pathname, hash } = props.location;
        window.location.replace(`${pathname}${hash}`);
        return <></>;
      }} />
    </Router>
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
          <a href="/dashboard" class="nav-link">Dashboard</a>
        </li>
        <li class="nav-item">
          <a href="/chore/list" class="nav-link">Chores</a>
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
