type t = {
  createdAt: Js.Date.t,
  value: string,
  coachName: string,
  coachAvatarUrl: option(string),
  coachTitle: string,
};
let value = t => t.value;
let coachName = t => t.coachName;
let coachAvatarUrl = t => t.coachAvatarUrl;
let coachTitle = t => t.coachTitle;
let createdAtPretty = t => t.createdAt->DateFns.format("MMMM d, yyyy");

let make = (~coachName, ~coachAvatarUrl, ~coachTitle, ~createdAt, ~value) => {
  coachName,
  coachAvatarUrl,
  coachTitle,
  createdAt,
  value,
};
