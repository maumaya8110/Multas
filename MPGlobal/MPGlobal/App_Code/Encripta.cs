using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

 
	public class cEncripta
	{
        public cEncripta() { 
        }

        #region Encriptación

        #region p-encoding
         int bxor = (byte)'P';

        /// <summary>
        /// encripta una cadena de bytes
        /// </summary>
        /// <param name="bytes">entrada</param>
        /// <returns>la entrada encriptada</returns>
        internal  byte[] encriptaPE(byte[] bytes)
        {
            byte[] bytes2 = new byte[bytes.Length];
            for (int nb = 0; nb < bytes.Length; nb++)
            {
                bytes2[nb] = (byte)((int)(bytes[nb]) ^ bxor);
            }

            return bytes2;
        }
        /// <summary>
        /// desencripta una cadena de bits
        /// </summary>
        /// <param name="bytes">entrada</param>
        /// <returns>entrada desencriptada</returns>
        internal  byte[] desencriptaPE(byte[] bytes)
        {
            byte[] bytes2 = new byte[bytes.Length];
            for (int nb = 0; nb < bytes.Length; nb++)
            {
                bytes2[nb] = (byte)((int)(bytes[nb]) ^ bxor);
            }

            return bytes2;
        }
        #endregion


         char[][] arrRemplazos = new char[][] { new char[] { '+', '#' }, new char[] { '/', '_' }, new char[] { '=', '-' } };

        /// <summary>
        /// codifica una cadena 
        /// </summary>
        /// <param name="scad">cadena a encriptar</param>
        /// <returns>la cadena encriptada</returns>
        public  string encripta(string scad)
        {
            return ReemplazaCaracteres(Convert.ToBase64String(encriptaPE(Encoding.Unicode.GetBytes(scad))), true);
        }

        /// <summary>
        /// decodifica una cadena
        /// </summary>
        /// <param name="scad">cadena a desencriptar</param>
        /// <returns>cadena original</returns>
        public  string desencripta(string scad)
        {
            return Encoding.Unicode.GetString(desencriptaPE(Convert.FromBase64String(ReemplazaCaracteres(scad, false))));
        }


         string ReemplazaCaracteres(string sCadena, bool bIdaVuelta)
        {
            if (true == bIdaVuelta)
            {
                foreach (char[] arrPareja in arrRemplazos)
                {
                    sCadena = sCadena.Replace(arrPareja[0], arrPareja[1]);
                }
            }
            else
            {
                foreach (char[] arrPareja in arrRemplazos)
                {
                    sCadena = sCadena.Replace(arrPareja[1], arrPareja[0]);
                }
            }

            return sCadena;
        }

        #endregion
	}
 