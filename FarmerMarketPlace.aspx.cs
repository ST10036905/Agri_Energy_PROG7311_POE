using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Form that allows farming products to be sold.

namespace Agri_Energy_PROG7311_POE
{
    public partial class FarmerMarketPlace : System.Web.UI.Page
    {
        /// <summary>
        /// declaring and instantiating products class object.
        /// </summary>
        Products productData = new Products();


        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";


        /// <summary>
        /// calling the farmer id in page load to display their own products when they enter.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int farmerId = Convert.ToInt32(Session["FarmerId"]);
                BindProduct(farmerId);
            }
        }//____________________________________________________________________________________________________________

        /// <summary>
        /// Method to add product to marketplace.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddProductBtn_Click(object sender, EventArgs e)
        {
            // Checking if any of the text boxes are empty
            if (string.IsNullOrEmpty(ProductNameTxtBox.Text) ||
            string.IsNullOrEmpty(ProductDescriptionTxtBox.Text) ||
            string.IsNullOrEmpty(ProductImageTxtBox.Text) ||
            string.IsNullOrEmpty(ProductCategoryDropDownList.Text) ||
            string.IsNullOrEmpty(DateTxtBox.Text) ||
            string.IsNullOrEmpty(ProductPriceTxtBox.Text) ||
            string.IsNullOrEmpty(ProductQntyTxtBox.Text))
            {
                ErrorMessageLabel.Text = "Please fill in all the fields.";
                return;
            }

            //fill in text boxes with form value
            productData.ProductName = ProductNameTxtBox.Text;
            productData.ProductDescription = ProductDescriptionTxtBox.Text;
            productData.ProductImage = ProductImageTxtBox.Text;
            productData.ProductCategory = ProductCategoryDropDownList.SelectedValue;

            //validating date format.
            DateTime date;
            if (!DateTime.TryParse(DateTxtBox.Text, out date))
            {
                ErrorMessageLabel.Text = "Please enter a valid date.";
                return;
            }

            //validating price format.
            double price;
            if (!double.TryParse(ProductPriceTxtBox.Text, out price))
            {
                ErrorMessageLabel.Text = "Please enter a valid price.";
                return;
            }

            //validating quantity format.
            int quantity;
            if (!int.TryParse(ProductQntyTxtBox.Text, out quantity))
            {
                ErrorMessageLabel.Text = "Please enter a valid quantity.";
                return;
            }

            productData.ProductPrice = price;
            productData.ProductCount = quantity;
            productData.ProductionDate = date;

            //calling method that will save product to database
            ProductsQuery(productData.ProductName, productData.ProductDescription, productData.ProductPrice, productData.ProductCount, productData.ProductionDate, productData.ProductImage, productData.ProductCategory);
        }//____________________________________________________________________________________________________________


        /// <summary>
        /// Method to insert data in the product table.
        /// </summary>
        public void ProductsQuery(string name, string description, double price, int quantity, DateTime productionDate, string image, string category)
        {
            try
            {
                //fetching the farmer id using a session
                int farmerId = Convert.ToInt32(Session["FarmerId"]);

                //Inserting data to products table.
                string query = "INSERT INTO Product(Name, Description, ProductPrice, Quantity, ProductionDate, ProductImage, ProductCategory, FarmerId) " +
                               "VALUES (@Name, @Description, @ProductPrice, @Quantity, @ProductionDate, @ProductImage, @ProductCategory, @FarmerId)";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@ProductPrice", price);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@ProductionDate", productionDate);
                    command.Parameters.AddWithValue("@ProductImage", image);
                    command.Parameters.AddWithValue("@ProductCategory", category);
                    command.Parameters.AddWithValue("@FarmerId", farmerId);
                    connection.Open();
                    command.ExecuteNonQuery();

                    // Register a startup script to redirect after 5 seconds
                    SuccessMessageLabel.Text = "Product successfully entered.";
                    string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 5000);";
                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);

                    //Call the method to reset input fields
                     ResetInputFields();
                }
            }
            catch (Exception ex)
            {
                // Log the exception and display an error message
                ErrorMessageLabel.Text = "An error occurred while saving the product: " + ex.Message;
            }
        }//____________________________________________________________________________________________________________


        /// <summary>
        /// Method that displays the image of the products entered by farmer.
        /// </summary>
        public void BindProduct(int farmerId)
        {
            try
            {
                // Query to select only the products of the current farmer
                string query = "SELECT * FROM Product WHERE FarmerId = @FarmerId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        cmd.Parameters.AddWithValue("@FarmerId", farmerId);
                        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        dataAdapter.Fill(dt);
                        ProductsRepeater.DataSource = dt;
                        ProductsRepeater.DataBind();                        
                    }                   
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "Data not captured. " + ex.Message;
            }
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method to reset input fields after adding a product.
        /// </summary>
        private void ResetInputFields()
        {
            ProductNameTxtBox.Text = "";
            ProductDescriptionTxtBox.Text = "";
            ProductImageTxtBox.Text = "";
            ProductCategoryDropDownList.SelectedIndex = 0;
            DateTxtBox.Text = "";
            ProductPriceTxtBox.Text = "";
            ProductQntyTxtBox.Text = "";
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method to clear operation. 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            ResetInputFields();
            // Register a startup script to redirect after 5 seconds
            ErrorMessageLabel.Text = "Operation being canceled...";
            string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 5000);";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//______________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//____________________________________________________END OF FILE_______________________________________________________