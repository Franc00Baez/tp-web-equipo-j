using program;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class ImgNegocio
    {
        public List<Imagen> listar()
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDB datos = new AccesoDB();

            try
            {
                datos.setearQuery("select Id, IdArticulo, ImagenUrl FROM IMAGENES");
                datos.ejectuarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    aux.ID = datos.Lector.GetInt32(0);
                    aux.IDArticulo = datos.Lector.GetInt32(1);
                    aux.URL = datos.Lector.GetString(2);

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw new Exception("hay un error en la BD" + ex.Message);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public List<Imagen> listarPorArticulo(int idArticulo)
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDB datos = new AccesoDB();

            try
            {
                datos.setearQuery("SELECT I.* FROM IMAGENES I WHERE I.IdArticulo = @IdArticulo");
                datos.setearParametro("@IdArticulo", idArticulo);
                datos.ejectuarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    aux.ID = datos.Lector.GetInt32(0);
                    aux.IDArticulo = datos.Lector.GetInt32(1);
                    aux.URL = datos.Lector.GetString(2);
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar imágenes por artículo: " + ex.Message);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        /* public void agregar(Categoria cat)
         {
             AccesoDB datos = new AccesoDB();
             try
             {
                 datos.setearQuery("insert into CATEGORIAS(Descripcion) values(@Descripcion)");
                 datos.setearParametro("@Descripcion", cat.Descripcion);
                 datos.ejecutarAccion();
             }
             catch (Exception ex)
             {

                 throw ex;
             }
             finally
             {
                 datos.cerrarConexion();
             }
         }

         public void editar(Categoria editado)
         {
             AccesoDB datos = new AccesoDB();
             try
             {
                 datos.setearQuery("UPDATE CATEGORIAS SET Descripcion = @Descripcion WHERE Id = @IdCategoria;");
                 datos.setearParametro("@Descripcion", editado.Descripcion);
                 datos.setearParametro("@IdCategoria", editado.ID);

                 datos.ejecutarAccion();

             }
             catch (Exception ex)
             {

                 throw ex;
             }
             finally
             {
                 datos.cerrarConexion();
             }
         }*/
    }
}
