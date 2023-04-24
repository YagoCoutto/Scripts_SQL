-- Usuario mais a esquerda é quem está segurando o sistema.
select substr(lpad(' ', abs(loc.block - 1) * 2) || ses.username, 1, 30) username,
       ses.sid,
       ses.serial#,
       pro.spid,
       ses.osuser,
       ses.machine,
       ses.program,
       ses.status,
       ses.module,
       ses.lockwait,
       ses.row_wait_obj#,
       ses.row_wait_file#,
       ses.row_wait_block#,
       ses.row_wait_row#,
       vlo.object_id,
       loc.type,
       vlo.locked_mode,
       obj.object_type || '.' || obj.object_name object_name
  from dba_objects     obj,
       v$locked_object vlo,
       v$process       pro,
       v$session       ses,
       v$lock          loc
where (loc.block <> 0 or loc.request <> 0)
   and ses.sid = loc.sid
   and pro.addr = ses.paddr
   and vlo.session_id(+) = ses.sid
   and obj.object_id(+) = vlo.object_id
order by loc.id1, loc.id2, loc.sid, loc.block desc, loc.request;
