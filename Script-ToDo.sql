
-- Kenny Causo

CREATE TABLE "todos" (
  "id" uuid PRIMARY KEY,
  "task" varchar NOT NULL,
  "finaldate" date NOT NULL,
  "priority" varchar NOT NULL,
  "done" bool
);

insert into todos (id, task, finalDate, priority, done) values ('a1ecd497-29dd-488b-ad07-6cfbfbdd83c1', 'Organize my desktop', '2022-09-20', 'High', true);
insert into todos (id, task, finalDate, priority, done) values ('a1ecd497-29dd-488b-ad07-6cfbfbdd83c2', 'Send email to my boss', '2022-10-01', 'Med', false);
insert into todos (id, task, finalDate, priority, done) values ('a1ecd497-29dd-488b-ad07-6cfbfbdd83c3', 'Run around the park', '2022-10-05', 'Low', false);

select * from todos;
select * from todos where done = true;