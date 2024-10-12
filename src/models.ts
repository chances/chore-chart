/** @enum */
export const Frequency = {
  never: 0,
  /** Every day. */
  daily: 1,
  /** Twice a week. */
  biWeekly: 2,
  /** Every week. */
  weekly: 3,
  /** Twice a month. */
  biMonthly: 4,
  /** Every month. */
  monthly: 5,
  /** Four times a year. */
  quarterly: 6,
  /** Once every spring. */
  spring: 7,
  /** Once every summer. */
  summer: 8,
  /** Once every winter. */
  winter: 9,
  /** Once every fall. */
  fall: 10,
  /** Once a year. */
  yearly: 11,
  /** @returns Name of the given `frequency`. */
  nameOf(frequency: number) {
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
  },
  /** @returns An accessible label for the given `frequency`. */
  labelOf(frequency: number) {
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
  },
  /** Convert the given `frequency` to its equivalent measure in days. */
  inDays(frequency: number) {
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

export const unnamedChore = "Unnamed Chore";

export interface Chore {
  id: string | null;
  createdBy: string;
  created: Date;
  updated: Date;
  name?: string;
  frequency: number,
  completed: boolean;
  completedBy?: string;
  assignee?: string;
  notes: string;
}

export function newChore(creator: string): Chore {
  return {
    id: null,
    frequency: Frequency.never,
    createdBy: creator,
    created: new Date(),
    updated: new Date(),
    completed: false,
    notes: ""
  };
};
