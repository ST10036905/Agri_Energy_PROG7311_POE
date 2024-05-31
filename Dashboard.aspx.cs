using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Form that allows all products to be sold.

namespace Agri_Energy_PROG7311_POE
{
    public partial class Dashboard : System.Web.UI.Page
    {

        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";


        /// <summary>
        /// initializing the binding method to display repeater.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProduct();
            }
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method to display products added by farmers in the dashboard.
        /// </summary>
        public void BindProduct()
        {
            try
            {
                //query to select all data from products
                string query = "SELECT Name,Description,ProductPrice,Quantity,ProductionDate,ProductImage,ProductCategory FROM Product " +
                    "UNION SELECT Name,Description,ProductPrice,Quantity,ProductionDate,ProductImage,ProductCategory FROM GreenProduct";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query,connection);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable data = new DataTable();
                    dataAdapter.Fill(data);
                    ProductsRepeater.DataSource = data;
                    ProductsRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "Data not captured. " + ex.Message;
            }
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method user selects to buy a product.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuyProductBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Transactions.aspx");
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method user selects to enquire the supplier of the product.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void EnquireSupplierBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DiscussionBoard.aspx");
        }//______________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//____________________________________________________END OF FILE_______________________________________________________