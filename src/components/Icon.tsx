import { assert } from "@std/assert";
// See https://github.com/gnomical/solid-fontawesome/blob/main/src/FontAwesomeIcon.tsx
import { parse, icon, IconName } from "@fortawesome/fontawesome-svg-core";
import "@fortawesome/fontawesome-free/css/fontawesome.min.css";
import "@fortawesome/fontawesome-free/css/solid.min.css";
import { splitProps, JSX, VoidProps } from "solid-js";

import "./icon.css";

type IconProps = {
  icon: IconName;
} & JSX.HTMLAttributes<HTMLElement>;

export default function Icon(props: VoidProps<IconProps>): JSX.Element {
  const parsedIcon = icon(parse.icon(props.icon));
  const svg = parsedIcon && parsedIcon.abstract[0].children
    ? <svg><path {...parsedIcon.abstract[0].children[0].attributes}></path></svg>
    : null;
  if (svg) assert(svg instanceof Object);

  // See https://stackoverflow.com/a/72126276/1363247
  const [, elementProps] = splitProps(props, ["icon"]);

  return <i class={["icon", "fa-solid", `fa-${props.icon}`].join(" ")} {...elementProps}></i>;
}
