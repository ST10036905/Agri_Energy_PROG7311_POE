using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//Mayra Selemane
//ST10036905
//Class to store products data, used in products form.

namespace Agri_Energy_PROG7311_POE
{
    public class Products
    {
        /// <summary>
        /// getters and setters methods.
        /// </summary>
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public double ProductPrice { get; set; }
        public int ProductCount { get; set; }
        public DateTime ProductionDate { get; set; }
        public string ProductImage { get; set; }
        public string ProductCategory { get; set; }

        /// <summary>
        /// default constructor
        /// </summary>
        public Products()
        {

        }//_________________________________________________________________________________________________________________

        /// <summary>
        /// parameterised constructor.
        /// </summary>
        /// <param name="productName"></param>
        /// <param name="productDescription"></param>
        /// <param name="productPrice"></param>
        /// <param name="productCount"></param>
        /// <param name="productionDate"></param>
        /// <param name="productImage"></param>
        /// <param name="productCategory"></param>
        public Products(string productName, string productDescription, double productPrice, int productCount, DateTime productionDate, string productImage, string productCategory)
        {
            ProductName = productName;
            ProductDescription = productDescription;
            ProductPrice = productPrice;
            ProductCount = productCount;
            ProductionDate = productionDate;
            ProductImage = productImage;
            ProductCategory = productCategory;
        }//_________________________________________________________________________________________________________________

    }//_________________________________________________________________________________________________________________
}//________________________________________________END OF FILE__________________________________________________________
