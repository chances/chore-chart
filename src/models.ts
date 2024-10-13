import { createClient } from "@supabase/supabase-js";
import { Maybe } from "monet";

import { Database, PublicSchema, Tables } from "./db";

declare global {
  const env: {
    SUPABASE_URL: string
    SUPABASE_ANON_KEY: string
  };
}

const supabase = createClient<Database>(env.SUPABASE_URL, env.SUPABASE_ANON_KEY, {
  auth: {
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: true,
    storageKey: "dbSession"
  }
});

export interface Model {
  tableName: string;
  toJson(): any;
}

export class User implements Model {
  id: string;
  guest: boolean;
  created: Date;

  readonly tableName = "users";

  constructor (user: Tables<"users">) {
    this.id = user.id;
    this.guest = user.guest;
    this.created = new Date(user.created_at);
  }

  toJson() {
    return toJson<"users">(this);
  }
}

export class Chore implements Model {
  static unnamed = "Unnamed Chore";

  id: Maybe<number | string>;
  createdBy: string;
  created: Date;
  updated: Date;
  name: Maybe<string> = Maybe.none();
  frequency: number;
  completed: boolean;
  completedBy: Maybe<string> = Maybe.none();
  assignee: Maybe<string> = Maybe.none();
  notes: string;

  readonly tableName = "chores";

  constructor (creator: string) {
    this.id = Maybe.none();
    this.frequency = Frequency.never;
    this.createdBy = creator;
    this.created = new Date();
    this.updated = new Date();
    this.completed = false;
    this.notes = "";
  }

  toJson() {
    return toJson<"chores">(this);
  }
}

export class Frequency implements Model {
  static never = 0;
  /** Every day. */
  static daily = 1;
  /** Twice a week. */
  static biWeekly = 2;
  /** Every week. */
  static weekly = 3;
  /** Twice a month. */
  static biMonthly = 4;
  /** Every month. */
  static monthly = 5;
  /** Four times a year. */
  static quarterly = 6;
  /** Once every spring. */
  static spring = 7;
  /** Once every summer. */
  static summer = 8;
  /** Once every winter. */
  static winter = 9;
  /** Once every fall. */
  static fall = 10;
  /** Once a year. */
  static yearly = 11;

  id: number;
  frequency: Maybe<number>;
  created: Date;
  title: string;
  description: Maybe<string>;

  readonly tableName = "frequencies";

  constructor (frequency: Tables<"frequencies">) {
    this.id = frequency.id;
    this.frequency = Maybe.fromNull(frequency.frequency);
    this.created = new Date(frequency.created_at);
    this.title = frequency.title;
    this.description = Maybe.fromNull(frequency.description);
  }

  toJson() {
    return toJson<"frequencies">(this);
  }

  /** @returns Name of the given `frequency`. */
  static nameOf(frequency: number) {
    switch (frequency) {
      case Frequency.daily:  return "Daily";
      case Frequency.biWeekly:  return "Twice Weekly";
      case Frequency.weekly:  return "Weekly";
      case Frequency.biMonthly:  return "Twice Monthly";
      case Frequency.monthly: return "Monthly";
      case Frequency.quarterly: return "Quarterly";
      case Frequency.spring: return "Spring";
      case Frequency.summer: return "Summer";
      case Frequency.winter: return "Winter";
      case Frequency.fall: return "Fall";
      case Frequency.yearly: return "Yearly";
      default: throw new Error(`Unknown frequency \`${this}\``);
    }
  };

  /** @returns An accessible label for the given `frequency`. */
  static labelOf(frequency: number) {
    switch (frequency) {
      case Frequency.daily:  return "Once a day";
      case Frequency.biWeekly:  return "Twice a week";
      case Frequency.weekly:  return "Once a week";
      case Frequency.biMonthly:  return "Twice a month";
      case Frequency.monthly: return "Once a month";
      case Frequency.quarterly: return "Once every season";
      case Frequency.spring: return "Once in the Spring";
      case Frequency.summer: return "Once in the Summer";
      case Frequency.winter: return "Once in the Winter";
      case Frequency.fall: return "Once in the Fall";
      case Frequency.yearly: return "Once a year";
      default: throw new Error(`Unknown frequency \`${this}\``);
    }
  }

  /** Convert the given `frequency` to its equivalent measure in days. */
  static inDays(frequency: number) {
    switch (frequency) {
      case Frequency.daily: return 1;
      case Frequency.biWeekly: return 3.5;
      case Frequency.weekly: return 7;
      case Frequency.biMonthly: return 14;
      case Frequency.monthly:
      case Frequency.quarterly:
      case Frequency.spring:
      case Frequency.summer:
      case Frequency.winter:
      case Frequency.fall:
      case Frequency.yearly:
        console.error("Frequency is not convertable to days!");
        return null;
      default: throw new Error(`Unknown frequency \`${this}\``);
    }
  }
}

export const frequencies = [
  Frequency.daily,
  Frequency.biWeekly,
  Frequency.weekly,
  Frequency.biMonthly,
  Frequency.monthly,
  Frequency.quarterly,
  Frequency.spring,
  Frequency.summer,
  Frequency.winter,
  Frequency.fall,
  Frequency.yearly,
];

type TableNames = keyof (PublicSchema["Tables"] & PublicSchema["Views"]);

function toJson<T extends TableNames>(model: Chore | User | Frequency): Tables<T> {
  const record = model as unknown as Record<string, any>;
  return Object.keys(model)
    .filter(key => typeof record[key] !== "function")
    .reduce((result, key) => {
      const value = record[key] instanceof Date ? record[key].toISOString() : record[key];
      const isTimestamp = key === "created" || key === "updated";

      key = isTimestamp ? `${key}_at` : key ;
      return ({
        ...result,
        [key]: value,
      });
    }, {} as unknown as Tables<T>);
}
