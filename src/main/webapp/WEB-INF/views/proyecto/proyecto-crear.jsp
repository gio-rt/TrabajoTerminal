<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <title>Trabajor terminal | archivo base</title>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <jsp:include page="../recursos/estilos.jsp"></jsp:include>

</head>


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
                <div class="col-md-8 col-md-offset-2">
                    <!-- BEGIN VALIDATION STATES-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-gift"></i>Registrar nuevo proyecto
                            </div>
                        </div>
                        <div class="portlet-body form">
                            <!-- BEGIN FORM-->
                            <c:url value="/proyecto/crear" var="urlproyectoGuardar"/>

                            <form:form action="${urlproyectoGuardar}" method="post" commandName="proyecto"
                                       cssClass="form-horizontal">
                                <div class="form-body">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Nombre
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:input path="nombre" cssClass="form-control"/>
                                                <form:errors path="nombre" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Descripci�n
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:textarea  path="descripcion" cssClass="form-control"/>
                                                <form:errors path="descripcion" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Fecha de Inicio
                                            <span class="required"> * </span>
                                        </label>
                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:input path="fechaInicio" cssClass="form-control" type="date"/>
                                                <form:errors path="fechaInicio" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Fecha de Fin
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:input path="fechaFin" cssClass="form-control" type="date"/>
                                                <form:errors path="fechaFin" element="span"
                                                             cssClass="help-block text-danger"/>
                                                <div style="color:#C00;">${mensajeFechas}</div>           
                                            </div>
                                        </div>
                                    </div>
<!--                                     <div class="form-group"> -->
<!--                                         <label class="control-label col-md-3">Avance -->
<!--                                             <span class="required"> * </span> -->
<!--                                         </label> -->
<!--                                         <div class="col-md-7"> -->
<!--                                             <div class="input-icon right"> -->
                                                <form:hidden path="avance" cssClass="form-control" value = "0"/>
                                                <form:errors path="avance" element="span" cssClass="help-block text-danger"/>

<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Tipo de proyecto
                                            <span class="required"> * </span>
                                        </label>

                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:select path="tipoProyecto.idTipoProyecto" cssClass="form-control">
                                                    <form:option value="" label="Selecciona una opci�n"/>
                                                    <form:options items="${tipoProyectoList}" itemValue="idTipoProyecto"
                                                                  itemLabel="nombre"/>
                                                </form:select>
                                                <form:errors path="tipoProyecto" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Estado de proyecto
                                            <span class="required"> * </span>
                                        </label>
                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:select path="estado.idEstado" cssClass="form-control">
                                                    <form:option value="" label="Selecciona una opci�n"/>
                                                    <form:options items="${estadoList}" itemValue="idEstado"
                                                                  itemLabel="nombre"/>
                                                </form:select>
                                                <form:errors path="estado" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>
<!--                                     <div class="form-group"> -->
<!--                                         <label class="control-label col-md-3">Coordinador -->
<!--                                             <span class="required"> * </span> -->
<!--                                         </label> -->
<!--                                         <div class="col-md-7"> -->
<!--                                             <div class="input-icon right"> -->
<%--                                                 <form:select path="coordinador.idUsuarios" cssClass="form-control"> --%>
<%--                                                     <form:option value="" label="Selecciona una opci�n"/> --%>
<%--                                                     <form:options items="${cordinadorList}" itemValue="idUsuarios" --%>
<%--                                                                itemLabel="nombreUsuario"/> --%>
<%--                                               </form:select> --%>
<%--                                                 <form:errors path="coordinador" element="span"  --%>
<%--                                                              cssClass="help-block text-danger"/>  --%>
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    <div class="form-group" >
<!--                                         <label class="control-label col-md-3">Coordinador -->
<!--                                             <span class="required"> * </span> -->
<!--                                         </label> -->
                                        <div class="col-md-7">
                                            <div class="input-icon right">
                                                <form:input path="coordinador.idUsuarios"  value="${coordinadorX}" type="hidden"/>
                                                <form:errors path="coordinador" element="span"
                                                             cssClass="help-block text-danger"/>
                                            </div>
                                        </div>
                                    </div>	
									
                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button type="submit" class="btn green">Crear</button>
                                            <button type="button" class="btn default">Cancelar</button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                    <!-- END VALIDATION STATES-->
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
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Demo.init(); // init demo features
    });
</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>