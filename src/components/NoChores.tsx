import Icon from "./Icon";

export default function NoChores() {
  return <div class="empty text-center">
    <Icon icon="broom" />
    <h2>No Chores</h2>
    <p>Cleanup your space and schedule a chore.</p>
    <a href="/chore/new" class="btn btn-secondary" type="button">Plan a Chore</a>
  </div>
}
