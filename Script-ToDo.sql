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

update todos set done = true where id = 'a1ecd497-29dd-488b-ad07-6cfbfbdd83c2';
update todos set task = 'modify the task', done = 'false' where id='a1ecd497-29dd-488b-ad07-6cfbfbdd83c1';



-- JOINS ACTIVITY:

create view v_clients_accounts as select clients.id as id_cliente, clients.first_name as nombre, clients.last_name as apellido, clients.email as email, accounts.account_no as cuenta, accounts.balance as saldo from clients left join accounts on  clients.id = accounts.client_id;
create view v_accounts_types as select accounts.account_no as cuenta, clients.id as id_client, account_types.name as tipo_cuenta from accounts left join clients on clients.id = accounts.client_id left join account_types on accounts.type = account_types.id;
create view v_transactions_detail as select transactions.id as transaccion, transactions.amount as monto, transactions_types."name" from transactions left join transactions_types on transactions.transaction_type = transactions_types.id;
create view v_transations_types_detail as select transactions.id as transaccion, transactions.amount as monto, transactions_types."name" from transactions right join transactions_types on transactions.transaction_type = transactions_types.id;
