select OSUSER, MACHINE, USERNAME, PROGRAM, STATUS,
       'ALTER SYSTEM KILL SESSION ' || '''' || SID || ',' || SERIAL# || ''''|| '  IMMEDIATE; --- Usuário:'||osuser kill
  from v$session
 where lower(PROGRAM) = 'sapiens.exe'
 and lower(machine) not like '%ns37%'
 and status<>'KILLED'
order by 1 ;

