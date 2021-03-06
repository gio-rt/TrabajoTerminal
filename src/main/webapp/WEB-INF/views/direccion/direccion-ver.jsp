<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="contexto"/>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

<title>Trabajor terminal | archivo base</title>
<meta content="" name="description" />
<meta content="" name="author" />

<jsp:include page="../recursos/estilos.jsp"></jsp:include>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->

<body class="page-header-fixed page-sidebar-closed-hide-logo">
	<!-- BEGIN HEADER -->
	<jsp:include page="../recursos/header.jsp"></jsp:include>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<jsp:include page="../recursos/side-bar.jsp"></jsp:include>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">

				<!-- BEGIN PAGE HEADER-->
				<jsp:include page="../recursos/breadcrumbs.jsp"></jsp:include>
				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<c:if test="${actualizado}">
						<h1 class="text-success"><strong>Datos actualizados</strong></h1>
					</c:if>
					<c:if test="${creado}">
                        <h1 class="text-success"><strong>Se ha creado una nueva direccion</strong></h1>
					</c:if>
					<div class="col-md-8 col-md-offset-2">
						<div class="portlet blue-hoki box">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-cogs"></i>Información de la direccion
								</div>
								<div class="actions">
									<a href="${contexto}direccion/${direccion.idDireccion}/editar" class="btn btn-default btn-sm">
										<i class="fa fa-pencil"></i> Editar </a>
									<a href="${contexto}direccion/eliminar/${direccion.idDireccion}/" class="btn btn-default btn-sm">
										<i class="fa fa-pencil"></i> Eliminar </a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="row static-info">
									<div class="col-md-5 name">
										Calle:
									</div>
									<div class="col-md-7 value">
										${direccion.calle}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Numero:
									</div>
									<div class="col-md-7 value">
										${direccion.numero}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Colonia:
									</div>
									<div class="col-md-7 value">
										${direccion.colonia}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Estado:
									</div>
									<div class="col-md-7 value">
										${direccion.estado}
									</div>
								</div>
								<div class="row static-info">
									<div class="col-md-5 name">
										Usuario:
									</div>
									<div class="col-md-7 value">
										${direccion.usuario.nombreUsuario}
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->
	<jsp:include page="../recursos/footer.jsp"></jsp:include>
	<!-- END FOOTER -->

	<!-- BEGIN JS -->
	<jsp:include page="../recursos/recursos-js.jsp"></jsp:include>
	<!-- END JS -->
	<script>
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			Demo.init(); // init demo features
		});
	</script>

	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>