create user dit1
IDENTIFIED BY ditdb20;

drop user dit2;

create user dit2
IDENTIFIED BY ditdb20;

grant connect, resource to dit1;

grant create session to dit2;

grant SELECT on book to dit2;
grant connect, resource to dit2;

REVOKE UPDATE on customer FROM dituser1;








