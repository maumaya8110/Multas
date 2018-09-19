ALTER PROCEDURE [dbo].[ReporteValorInventario]
AS	
	
	SELECT		row_number() over(order by producto) id,
				idProducto,
				producto,
				SUM(cantidad) cantidad,
				idUnidad,
				unidad,
				idSucursal,
				sucursal,
				sum(valorVenta) valorInventario,
				'$ ' +  CONVERT(varchar, CAST(sum(valorVenta) AS money), 1) + ' MXN' valorInventarioString,
				idEstatus,
				estatus,
				AVG(precioCompra) precioCompra,
				AVG(precioVenta) precioVenta,
				idalmacenvirtual
	FROM		(
					SELECT		ip.idProducto,
								p.nombre producto,
								ip.cantidad,
								ip.idUnidad,
								u.nombre unidad,
								s.id idSucursal,
								s.nombre sucursal,
								case when ip.idestatus in(2,3,4,5) then 1 else 2 end idEstatus,
								case when ip.idestatus in(2,3,4,5) then 'En bodega' else 'Por llegar' end estatus,
								(ip.cantidad * ip.precioventa) valorVenta,
								ip.precioCompra,
								ip.precioVenta,
								ip.idalmacenvirtual
					FROM		tblInventarioProducto  ip (nolock)
					inner join	tblProducto p (nolock) on ip.idproducto = p.id
					inner join	tblSucursales s (nolock) on ip.idsucursal = s.id
					inner join	(Select id, idTipoCompra, observaciones from tblOrdenesCompra  
								union all
								select id, idtipocompra, '' from tblordenescompraespeciales) toc on ip.idOrdenCompra = toc.id
					left join	tblLlegadasBodega tlb (nolock) on ip.numlote = tlb.numlote and ip.numllegada = tlb.numllegada
					LEFT JOIN	tblUnidades u (nolock) on ip.idUnidad = u.id
					--where idproducto = 13
					WHERE		ip.cantidad > 0
					AND			ip.idtipoordencompra = 1
					) A
	GROUP BY a.producto, a.idproducto, a.idunidad, a.unidad, a.idsucursal, a.sucursal,a.estatus, a.idestatus, a.idalmacenvirtual

