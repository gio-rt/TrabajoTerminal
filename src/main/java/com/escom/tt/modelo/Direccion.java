package com.escom.tt.modelo;

import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "DIRECCION")
public class Direccion {


	@Id
	@Column(name= "idDireccion")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idDireccion;
	
	@Column(name="calle")
	@NotNull
	@Size(min = 2, max = 12, message = "la calle debe tener al menos 2 caracteres y máximo 14")
	private String calle;
	
	@Column(name="numero")
	@NotNull
	private Integer numero;
	
	@Column(name = "colonia")
	@NotNull
	@Size(min =2, max = 14, message = "la colonia debe tener al menos 2 caracteres y máximo 14")
	private String colonia;
	
	@Column(name = "estado")
	@NotNull
	@Size(min =2, max = 14, message = "el estado debe tener al menos 2 caracteres y máximo 14")
	private String estado;
	
	@OneToOne
	@NotNull
	@JoinColumn(name="usuario")
	private Usuario usuario;
		
	public Integer getIdDireccion() {
		return idDireccion;
	}

	public void setIdDireccion(Integer idDireccion) {
		this.idDireccion = idDireccion;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getColonia() {
		return colonia;
	}

	public void setColonia(String colonia) {
		this.colonia = colonia;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public String toString() {
		return "Direccion [idDireccion=" + idDireccion + ", calle=" + calle
				+ ", numero=" + numero + ", colonia=" + colonia + ", estado="
				+ estado + ", usuario=" + usuario + "]";
	}
	
	
}
