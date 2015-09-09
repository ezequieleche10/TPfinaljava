package modelos;

import java.sql.Date;

public class Auto {
	
	private int cod_auto;

	public int getCod_auto() {
		return cod_auto;
	}

	public void setCod_auto(int cod_auto) {
		this.cod_auto = cod_auto;
	}
	
	private String descripcionAuto;
	
	public String getDescripcionAuto() {
		return descripcionAuto;
	}

	public void setDescripcionAuto(String descripcionAuto) {
		this.descripcionAuto = descripcionAuto;
	}
	
	private float precio;
	
	public float getPrecio() {
		return precio;
	}
	
	
	public void setPrecio(float precio) {
		this.precio = precio;
	}

	private int valoracion;
	
	public int getValoracion() {
		return valoracion;
	}

	public void setValoracion(int valoracion) {
		this.valoracion = valoracion;
	}

	private int anoFabricacion;

	public int getAnoFabricacion() {
		return anoFabricacion;
	}

	public void setAnoFabricacion(int anoFabricacion) {
		this.anoFabricacion = anoFabricacion;
	}
		
	private String nombre_auto;

	public String getNombre_auto() {
		return nombre_auto;
	}

	public void setNombre_auto(String nombre_auto) {
		this.nombre_auto = nombre_auto;
	}

	private int cod_marca;

	

	public int getCod_marca() {
		return cod_marca;
	}

	public void setCod_marca(int cod_marca) {
		this.cod_marca = cod_marca;
	}

	private String imagen;

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
}
