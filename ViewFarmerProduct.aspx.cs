using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Form that will allow employee to filter farmers products based on category and date.

namespace Agri_Energy_PROG7311_POE
{
    public partial class ViewFarmerProduct : System.Web.UI.Page
    {
        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";


        protected void Page_Load(object sender, EventArgs e)
        {
      
        }

        protected void FilterButton_Click(object sender, EventArgs e)
        {
            // Call the method to bind products after the filter button is clicked
            BindProducts();
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method that adds product to the repeater for sorting.
        /// </summary>
        protected void BindProducts()
        {
            try
            {
                // will be used to compare and sort 
                string sorting = ddlFilter.SelectedValue;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        // Construct the query based on selected category and date range
                        string query = "SELECT * FROM Product";
                        if (string.IsNullOrEmpty(sorting))
                        {
                            query += $"ORDER BY {sorting}";
                        }
                       
                        cmd.CommandText = query;
                        cmd.Connection = connection;
                        connection.Open();
                        // Bind the result to the repeater
                        ProductsRepeater.DataSource = cmd.ExecuteReader();
                        ProductsRepeater.DataBind();
                    }
                }
            }
            catch(Exception ex)
            {
                ErrorMessageLabel.Text = "An error occurred while fetching data: " + ex.Message;
            }
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Calling method to bind product
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }//______________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//____________________________________________________END OF FILE_______________________________________________________