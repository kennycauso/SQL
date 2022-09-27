CREATE TABLE "users" (
  "id" uuid UNIQUE PRIMARY KEY,
  "id_role" uuid NOT NULL,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" int NOT NULL,
  "age" float NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid UNIQUE PRIMARY KEY,
  "id_category" uuid NOT NULL,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL
);

CREATE TABLE "course_video" (
  "id" uuid UNIQUE PRIMARY KEY,
  "id_course" uuid NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid UNIQUE PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid UNIQUE PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "user_course" (
  "id" uuid UNIQUE PRIMARY KEY,
  "id_user" uuid NOT NULL,
  "id_course" uuid NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("id_role") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "user_course" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "user_course" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");



--ROLES:
insert into roles (id, name) values ('51b847ab-5703-453c-9efe-f26c8ba69b91','Student');
insert into roles (id, name) values ('51b847ab-5703-453c-9efe-f26c8ba69b92','Teacher');
insert into roles (id, name) values ('51b847ab-5703-453c-9efe-f26c8ba69b93','Admin');

--CATEGORIES:
insert into categories (id, name) values ('cbcdb23a-ac2c-4f7f-912b-46d3493680c1','Engineering');
insert into categories (id, name) values ('cbcdb23a-ac2c-4f7f-912b-46d3493680c2','Software');
insert into categories (id, name) values ('cbcdb23a-ac2c-4f7f-912b-46d3493680c3','Health');

--COURSES:
insert into courses (id, id_category, title, description, level, teacher) values ('c278a2c4-4b95-4316-9548-d82fea278881','cbcdb23a-ac2c-4f7f-912b-46d3493680c1', 'Artificial intelligence', 'Methods of quantums', 'Advance', 'Jorge Santibañez');
insert into courses (id, id_category, title, description, level, teacher) values ('c278a2c4-4b95-4316-9548-d82fea278882','cbcdb23a-ac2c-4f7f-912b-46d3493680c2', 'Node js', 'Apis development', 'Intermediate', 'Sara López');
insert into courses (id, id_category, title, description, level, teacher) values ('c278a2c4-4b95-4316-9548-d82fea278883','cbcdb23a-ac2c-4f7f-912b-46d3493680c3', 'Breakfast healthy', 'Types of breads', 'Basic', 'Marilyn Morales');

--COURSE_VIDEO:
insert into course_video (id, id_course, title, url) values ('758169ff-649e-48e4-ad92-89900e50cf31', 'c278a2c4-4b95-4316-9548-d82fea278881', 'Module 1 Robotic', 'https://www.youtube.com/robotic');
insert into course_video (id, id_course, title, url) values ('758169ff-649e-48e4-ad92-89900e50cf32', 'c278a2c4-4b95-4316-9548-d82fea278882', 'Module 2 Express', 'https://www.youtube.com/Express');
insert into course_video (id, id_course, title, url) values ('758169ff-649e-48e4-ad92-89900e50cf33', 'c278a2c4-4b95-4316-9548-d82fea278883', 'Module 3 Types of breakfast', 'https://www.youtube.com/breakfast');

--USERS:
insert into users (id, id_role, name, email, password, age) values ('8b6514d0-f395-4283-b0ea-44bd34e3cc11', '51b847ab-5703-453c-9efe-f26c8ba69b91', 'Pedro', 'pedro@mail.com', 12345, 25);
insert into users (id, id_role, name, email, password, age) values ('8b6514d0-f395-4283-b0ea-44bd34e3cc12', '51b847ab-5703-453c-9efe-f26c8ba69b92', 'Lizeth', 'lizeth@mail.com', 123, 33);
insert into users (id, id_role, name, email, password, age) values ('8b6514d0-f395-4283-b0ea-44bd34e3cc13', '51b847ab-5703-453c-9efe-f26c8ba69b93', 'Andrés', 'andres@mail.com', 12345789, 29);

--USER_COURSE:
insert into user_course (id, id_user, id_course) values ('51a6bc2d-94b4-4b3a-8deb-45bffa4ca111','8b6514d0-f395-4283-b0ea-44bd34e3cc11', 'c278a2c4-4b95-4316-9548-d82fea278881');
insert into user_course (id, id_user, id_course) values ('51a6bc2d-94b4-4b3a-8deb-45bffa4ca112','8b6514d0-f395-4283-b0ea-44bd34e3cc12', 'c278a2c4-4b95-4316-9548-d82fea278882');
insert into user_course (id, id_user, id_course) values ('51a6bc2d-94b4-4b3a-8deb-45bffa4ca113','8b6514d0-f395-4283-b0ea-44bd34e3cc13', 'c278a2c4-4b95-4316-9548-d82fea278883');


-Challenge:
select * from users left join user_course on users.id = user_course.id_user left join courses on courses.id = user_course.id_course left join categories on categories.id = courses.id_category left join course_video on course_video.id_course = courses.id;































