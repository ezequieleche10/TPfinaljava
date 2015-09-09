package negocio;

import java.util.ArrayList;

import modelos.*;
import datos.*;

import java.sql.*;
public class ControladorAuto {
	
	//private static CatalogoAuto catAuto = new CatalogoAuto();
	
	public static int AddAuto(Auto nuevoAuto)
	{
		//Validaciones de Negocio
		
		int idArticuloNuevo = CatalogoAuto.AddAuto(nuevoAuto);
		
		return idArticuloNuevo;
	}

	public static void DeleteAuto(int pIdAuto)
	{
		
		CatalogoAuto.DeleteAuto(pIdAuto);
		
	}

	public static Auto getOne(int pIdAuto)
	{
		Auto AutoDev = new Auto();/*Crea la estructura del auto a devolver*/
		AutoDev = CatalogoAuto.GetOne(pIdAuto);/*Obtiene el auto a devolver por Id*/
		
		return AutoDev;
	}
	
	public static int UpdateAuto(int pCod_auto, String pDescripcion, float pPrecio_sug)
	{
		int rowAffect;
		Auto modifAuto = new Auto();
		modifAuto.setDescripcionAuto(pDescripcion);
		modifAuto.setCod_auto(pCod_auto);
		modifAuto.setPrecio(pPrecio_sug);
		rowAffect = CatalogoAuto.UpdateAuto(modifAuto);
		return rowAffect;/*Devuelve la cantidad de filas afectadas por el update*/
		
	}
	
	public static ArrayList<Auto> getAll()
	{
		ArrayList<Auto> AutosAll = new ArrayList<Auto>();
		AutosAll = CatalogoAuto.GetAll();
		
		return AutosAll;
		
	}
 public static void ActualizaValor(int pIdCod_Auto, int pValoracion)
 {
	 CatalogoAuto.ActualizaValoracion(pIdCod_Auto, pValoracion);
	 
 }

public static ArrayList<Auto> getAllxMarca(int pCod_Marca)
{
return CatalogoAuto.GetAllxMarca(pCod_Marca);	
}


public static ArrayList<Auto> getAllxPrecio(float pPrecio_min, float pPrecio_max)
{
return CatalogoAuto.GetAllxPrecios(pPrecio_min, pPrecio_max);	
}
 
}



