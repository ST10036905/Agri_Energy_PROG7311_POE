using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
//Mayra Selemane
//ST10036905
//EmployeeHub is a form being used to register a farmer.

namespace Agri_Energy_PROG7311_POE
{
    public partial class EmployeeHub : System.Web.UI.Page
    {
        /// <summary>
        /// declaring and instantiating farmers class object.
        /// </summary>
        Farmers farmerData = new Farmers();


        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        /// <summary>
        /// Method that allows an employee to register the farmer.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            
                // Checking if any of the text boxes are empty
                if (string.IsNullOrEmpty(NameTxtBox.Text) || 
                string.IsNullOrEmpty(SurnameTxtBox.Text) || 
                string.IsNullOrEmpty(UsernameTxtBox.Text) || 
                string.IsNullOrEmpty(PasswordTxtBox.Text) || 
                string.IsNullOrEmpty(ConfirmPasswordTxtBox.Text) || 
                string.IsNullOrEmpty(ContactTxtBox.Text) || 
                string.IsNullOrEmpty(EmailTxtBox.Text) || 
                string.IsNullOrEmpty(AddressTxtBox.Text))
                {
                ErrorMessageLabel.Text = "Please fill in all the fields.";
                return;
                }

                //filling the text boxes with form data
                farmerData.Name = NameTxtBox.Text;
                farmerData.Surname = SurnameTxtBox.Text;
                farmerData.Username = UsernameTxtBox.Text;
                farmerData.SetPassword(PasswordTxtBox.Text);

                //validating the password if they match
                string confirmPasswordHash = Farmers.HashPassword(ConfirmPasswordTxtBox.Text.Trim());
                if (farmerData.Password != confirmPasswordHash)
                {
                    ErrorMessageLabel.Text = "Password does not match.";
                    return;
                }

                farmerData.Contact = ContactTxtBox.Text;
                farmerData.Email = EmailTxtBox.Text;
                farmerData.Address = AddressTxtBox.Text;
                
                //calling method that saves data to database
                FarmerQuery(farmerData.Name, farmerData.Surname, farmerData.Username, farmerData.Password, farmerData.Contact, farmerData.Email, farmerData.Address, farmerData.Role);
            
               // Using a startup script to redirect after 5 seconds
               SucessMessageLabel.Text = "Farmer registration succesful.";
               string script = "setTimeout(function(){ window.location = 'Login.aspx'; }, 5000);";
               ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//___________________________________________________________________________________________________________________________________________________________________________


        /// <summary>
        /// Method that saves the data to the farmer database.
        /// </summary>
        /// <param name="name"></param>
        /// <param name="surname"></param>
        /// <param name="age"></param>
        /// <param name="contact"></param>
        /// <param name="email"></param>
        /// <param name="address"></param>
        public void FarmerQuery(string name, string surname, string username, string password, string contact, string email, string address, string role)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        // Inserting data into the Farmer table
                        string farmerQuery = "INSERT INTO Farmer (Name, Surname, Username, Password, Contact, Email, Address, Role) VALUES (@Name, @Surname, @Username, @Password, @Contact, @Email, @Address, @Role)";
                        using (SqlCommand farmerCommand = new SqlCommand(farmerQuery, conn, transaction))
                        {
                            farmerCommand.Parameters.AddWithValue("@Name", name);
                            farmerCommand.Parameters.AddWithValue("@Surname", surname);
                            farmerCommand.Parameters.AddWithValue("@Username", username);
                            farmerCommand.Parameters.AddWithValue("@Password", password);
                            farmerCommand.Parameters.AddWithValue("@Contact", contact);
                            farmerCommand.Parameters.AddWithValue("@Email", email);
                            farmerCommand.Parameters.AddWithValue("@Address", address);
                            farmerCommand.Parameters.AddWithValue("@Role", role);
                            farmerCommand.ExecuteNonQuery();
                        }
                        // Inserting data into the User table
                        string userQuery = "INSERT INTO [User] (Username, Password, Role) VALUES (@Username, @Password, @Role)";
                        using (SqlCommand userCommand = new SqlCommand(userQuery, conn, transaction))
                        {
                            userCommand.Parameters.AddWithValue("@Username", username);
                            userCommand.Parameters.AddWithValue("@Password", password);
                            userCommand.Parameters.AddWithValue("@Role", role);
                            userCommand.ExecuteNonQuery();
                        }

                        transaction.Commit();
                    }
                    // Redirecting user to login
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "An error occurred while saving the farmer: " + ex.Message;
            }
        }//_______________________________________________________________________________________________________________


        /// <summary>
        /// Button that redirects the user to cancel the operation.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            NameTxtBox.Text = "";
            SurnameTxtBox.Text = "";
            UsernameTxtBox.Text = "";
            PasswordTxtBox.Text = "";
            ConfirmPasswordTxtBox.Text = "";
            ContactTxtBox.Text = "";
            EmailTxtBox.Text = "";
            AddressTxtBox.Text = "";

            //Using a startup script to redirect after 5 seconds
            ErrorMessageLabel.Text = "Operation being canceled...";
            string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 5000);";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//_____________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//____________________________________________________END OF FILE_______________________________________________________