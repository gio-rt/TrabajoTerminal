package com.escom.tt.controlador;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Invitacion;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
@Controller
public class ProyectoControlador {

    @Autowired
    private ProyectoRepositorio proyectoRepositorio;

    @Autowired
    private TipoProyectoRepositorio tipoProyectoRepositorio;

    @Autowired
    private EstadoRepositorio estadoRepositorio;

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @Autowired
    private InvitacionRepositorio invitacionRepositorio;


    @RequestMapping(value="/proyecto/crear", method = RequestMethod.GET)
    public String crear(Model modelo){

        modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
        modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
        modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
        modelo.addAttribute("proyecto", new Proyecto());
        return "proyecto/proyecto-crear";
    }

    @RequestMapping(value="/proyecto/crear", method = RequestMethod.POST)
    public String crear(@ModelAttribute("proyecto") @Valid Proyecto proyecto, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
            modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
            modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
            ruta = "proyecto/proyecto-crear";
        }else{
            Integer id = proyectoRepositorio.crear(proyecto);
            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto()+ "/?creado=true";
        }
        return ruta;
    }


    @RequestMapping(value="/proyecto/guardarCambios", method = RequestMethod.POST)
    public String actualizar(@ModelAttribute("proyecto") @Valid Proyecto proyecto, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
            modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
            modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
            modelo.addAttribute("proyecto", proyecto);
            ruta = "proyecto/proyecto-editar";
        }else{
            Integer id = proyectoRepositorio.actualizar(proyecto);
            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto() + "/?actualizado=true";
        }
        return ruta;
    }

    @RequestMapping(value="/proyecto/{proyectoId:[0-9]+}/editar", method = RequestMethod.GET)
    public String actualizar(@PathVariable Integer proyectoId,Model modelo) {
        Proyecto proyecto = null;
        String ruta = null;
        proyecto = proyectoRepositorio.buscarPorId(proyectoId);

        if (proyecto != null) {
            modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
            modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
            modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
            modelo.addAttribute("proyecto", proyecto);
            ruta = "proyecto/proyecto-editar";
        }
        else
            ruta = "redirect:/proyecto";

        return ruta;
    }

    @RequestMapping(value="/proyecto/ver/{proyectoId:[0-9]+}")
    public String ver(@PathVariable Integer proyectoId, Model modelo, Boolean actualizado, Boolean creado) {
        String ruta = null;
        Proyecto proyecto= null;

        proyecto = proyectoRepositorio.buscarPorId(proyectoId);
        if (proyecto != null) {
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("actualizado", actualizado);
            modelo.addAttribute("creado", creado);
            ruta = "proyecto/proyecto-ver";
        }else
            ruta = "redirect:/proyecto";

        return ruta;
    }

    @RequestMapping(value="/proyecto/eliminar/{proyectoId:[0-9]+}")
    public String eliminar(@PathVariable Integer proyectoId, Model modelo) {
        Boolean eliminado;
        Proyecto proyecto = null;
        proyecto = proyectoRepositorio.buscarPorId(proyectoId);

        if(proyecto != null){
            proyectoRepositorio.eliminar(proyecto);
            eliminado = true;
        }else{
            eliminado = false;
        }

        return "redirect:/proyecto?eliminado=" + eliminado;
    }

    @RequestMapping(value="/proyecto")
    public String verTodos(Model modelo,Boolean eliminado) {

        List<Proyecto> proyectoList = null;

        proyectoList = proyectoRepositorio.obtenerTodos();

        modelo.addAttribute("proyectosList", proyectoList);
        modelo.addAttribute("eliminado", eliminado);

        return "proyecto/proyecto-todos";
    }

    @RequestMapping(value="/proyecto/test-add-colaborador")
    public String addColaborador(Model modelo,Boolean eliminado) {

        Usuario usuario = usuarioRepositorio.buscarPorId(1);
        Proyecto proyecto = proyectoRepositorio.buscarPorId(1);
        ColaboradorProyecto colaboradorProyecto = new ColaboradorProyecto(proyecto, usuario);
        proyectoRepositorio.addColaborador(colaboradorProyecto);

        return "proyecto/proyecto-todos";
    }

    @RequestMapping(value="/proyecto/invitar", method = RequestMethod.GET)
    public String invitar(Model modelo, Principal principal, Integer error) {
        Usuario usuario = null;
        List<Proyecto> misProyectos = null;
        String mensaje = null;

        usuario = usuarioRepositorio.buscarPorCorreo(principal.getName());
        misProyectos = proyectoRepositorio.buscarPorCoordinador(usuario);

        if (misProyectos != null)
            modelo.addAttribute("misProyectos", misProyectos);
        else
            modelo.addAttribute("mensaje", "No tienes proyectos aun");
        modelo.addAttribute("error", error);
        return "proyecto/proyecto-invitar";
    }

    @RequestMapping(value="/proyecto/crearInvitacion", method = RequestMethod.GET)
    public String crearInvitacion(@RequestParam(required = true) String correoUsuario,
                          @RequestParam(required = true) Integer proyectoId,
                          Model modelo, Principal principal) {

        Proyecto proyecto= null;
        Usuario usuarioAInvitar = null;
        boolean estaColaborador = false;
        Integer error = 4;

        if (correoUsuario == null || proyectoId == null)
            return "redirect:/proyecto/invitar?error=" + error;


        proyecto = proyectoRepositorio.buscarPorId(proyectoId);
        usuarioAInvitar = usuarioRepositorio.buscarPorCorreoORNombreUsuario(correoUsuario);

        // no existe el usuario
        if (usuarioAInvitar == null)
            error = 1;

        // valida que el coordinador sea el mismo de la sesión
        if (proyecto != null
                && usuarioAInvitar != null
                && principal.getName().equals(proyecto.getCoordinador().getEmail()) ) {

            //valida si el usuario ya está como colaborador
            for(Iterator<ColaboradorProyecto> colaborador = proyecto.getColaboradorProyectos().iterator(); colaborador.hasNext(); )
                if(colaborador.next().getUsuario().getIdUsuarios() == usuarioAInvitar.getIdUsuarios()){
                    error = 2;
                    estaColaborador = true;
                }

            ColaboradorProyecto colaboradorProyecto = new ColaboradorProyecto(proyecto, usuarioAInvitar);
            Invitacion invitacion = new Invitacion();
            invitacion.setEstado(1);
            invitacion.setFecha(new Date());
            invitacion.setColaboradorProyecto(colaboradorProyecto);

            if(!estaColaborador)
                proyectoRepositorio.addColaborador(colaboradorProyecto);

            invitacionRepositorio.crear(invitacion);
            error = 3;
        }

        return "redirect:/proyecto/invitar?error=" + error;
    }

}
