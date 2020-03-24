use bookstore;

select nombre, usuario
from empleado
inner join usuario on empleado.idempleado = usuario.idempleado;

select email as correo
from usuario
inner join empleado on empleado.idempleado = usuario.idempleado where activo ='1';

select count(idpublicacion)
from publicacion where publicacion.autor = 'Eric G. Coronel Castillo';

select sum(precio)
from venta
inner join empleado where venta.idempleado =empleado.idempleado and empleado.nombre = 'EMILIO';

