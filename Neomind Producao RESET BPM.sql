SELECT 'ALTER SYSTEM KILL SESSION ''' || sid || ',' || serial# ||
       ''' IMMEDIATE;',
       osuser,
       machine,
       program,
       status
  FROM v$session
 where username like 'NEOMIND%'
 and program <> 'SQL Developer'