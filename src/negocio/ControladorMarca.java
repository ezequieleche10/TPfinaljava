package negocio;

import java.util.ArrayList;

import modelos.Marca;
import datos.CatalogoAuto;
import datos.CatalogoMarca;

public class ControladorMarca {

	public static int AddMarca (Marca nuevaMarca)
	{
		//Validaciones de Negocio
		
		int idMarcaNueva = CatalogoMarca.AddMarca(nuevaMarca);
		
		return idMarcaNueva;
	}

	public static void DeleteMarca(int pIdMarca)
	{
		
		CatalogoMarca.DeleteMarca(pIdMarca);
		
	}

	public static Marca getOne(String pNomMarca)
	{
		Marca MarcaDev = new Marca();/*Crea la estructura de la marca a devolver*/
		MarcaDev = CatalogoMarca.GetOne(pNomMarca);/*Obtiene la marca a devolver por Id*/
		
		return MarcaDev;
	}
	
	public static int UpdateMarca(int pCod_Marca, String pDescripcion)
	{
		int rowAffect;
		Marca modifMarca = new Marca();
		modifMarca.setCod_marca(pCod_Marca);
		modifMarca.setDescrip_marca(pDescripcion);
		rowAffect = CatalogoMarca.UpdateMarca(modifMarca);
		return rowAffect;/*Devuelve la cantidad de filas afectadas por el update*/
		
	}
	
	public static ArrayList<Marca> getAll()
	{
		ArrayList<Marca> MarcasAll = new ArrayList<Marca>();
		MarcasAll = CatalogoMarca.GetAll();
		
		return MarcasAll;
		
	}
	
}
