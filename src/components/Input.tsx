import { Accessor, Setter } from "solid-js";

interface InputOptions {
  type?: string;
  small?: boolean;
  required?: boolean;
  autofocus?: boolean;
  placeholder?: string;
  onChange?: Setter<string>;
}

const defaultAccessor = (() => "") as Accessor<string>;

export default function Input({name, value, ...options}: {name: string, value?: Accessor<string | null>, onChange?: Setter<string>} & InputOptions) {
  return makeInput(
    name,
    value ? () => (value() ?? "") : defaultAccessor,
    options,
  );
}

function makeInput(name: string, value: Accessor<string | null>, options?: InputOptions) {
  const isRequired = options?.required ?? false;

  return <div class="mb-3 row">
    <label for={name.toLowerCase()} class="col-sm-3 col-form-label">{name}{isRequired ? "*" : null}</label>
    <div class="input col-sm-9">
      <input classList={({ "form-control": true, "form-control-sm": options?.small ?? false })}
        id={name.toLowerCase()}
        type={options?.type ?? "text"}
        minLength={3}
        autofocus={options?.autofocus ?? false}
        required={isRequired}
        placeholder={options?.placeholder ?? ""}
        value={value() ?? ""}
        onChange={(e) => {
          if (options?.onChange) options?.onChange(e.target.value);
        }}
      />
    </div>
  </div>;
}
