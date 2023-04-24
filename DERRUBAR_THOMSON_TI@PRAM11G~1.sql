select LOGON_TIME, 
       OSUSER,
       MACHINE,
       USERNAME,
       PROGRAM,
       'ALTER SYSTEM KILL SESSION ' || '''' || SID || ',' || SERIAL# || ''''|| '  IMMEDIATE;' kill
  from v$session
 where MACHINE not in ( 'NS251','NS250','ns24')
   -- and USERNAME like 'SFW%'
   -- and PROGRAM = 'JDBC Thin Client'
   -- and LOGON_TIME <= sysdate - 1
 order by LOGON_TIME