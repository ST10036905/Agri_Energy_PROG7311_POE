﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Form being used to register an employee.

namespace Agri_Energy_PROG7311_POE
{
    public partial class Register : System.Web.UI.Page
    {

        /// <summary>
        /// declaring and instantiating an object from users class.
        /// </summary>
        Users userData = new Users();


        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Button click event that saves registration data.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            // Checking if any of the text boxes are empty
            if (string.IsNullOrEmpty(EmailTxtBox.Text) ||
                string.IsNullOrEmpty(UsernameTxtBox.Text) ||
                string.IsNullOrEmpty(NameTxtBox.Text) ||
                string.IsNullOrEmpty(AgeTxtBox.Text) ||
                string.IsNullOrEmpty(PasswordTxtBox.Text) ||
                string.IsNullOrEmpty(ReEnterPasswordTxtBox.Text) ||
                string.IsNullOrEmpty(AddressTxtBox.Text))
            {
                ErrorMessageLabel.Text = "Please fill in all the fields.";
                return;
            }

            //filling the text boxes with form data
            userData.Email = EmailTxtBox.Text;
            userData.Username = UsernameTxtBox.Text;
            userData.Name = NameTxtBox.Text;
            userData.Role = DropDownListRole.Text;
            userData.Password = PasswordTxtBox.Text.Trim();
            userData.Address = AddressTxtBox.Text;

            //performing validation on age.
            int age;
            if (!int.TryParse(AgeTxtBox.Text, out age))
            {
                ErrorMessageLabel.Text = "Please enter a valid age.";
                return;
            }

            //performing validation to ensure password and confirm passsword match.
            string confirmPassword = ReEnterPasswordTxtBox.Text.Trim();
            if (userData.Password != confirmPassword)
            {
                //Displaying an error message
                ErrorMessageLabel.Text = "Password does not match.";
                return;
            }

            //performing validation to ensure only farmers can register user.
            if (DropDownListRole.Text.Equals("Farmer"))
            {
                //Displaying an error message
                ErrorMessageLabel.Text = "Farmers are not allowed to register.";
                return;
            }

            //calling the RegisterQuery method after getting the data
            RegisterQuery(userData.Email, userData.Username, userData.Name,age, userData.Role, userData.Password,userData.Address);

            // Using a startup script to redirect after 5 seconds
            SucessMessageLabel.Text = "Registration succesful....Loading";
            string script = "setTimeout(function(){ window.location = 'Login.aspx'; }, 5000);";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//_______________________________________________________________________________________________________________


        /// <summary>
        /// Method used to save the registration data in database.
        /// </summary>
        /// <param name="email"></param>
        /// <param name="username"></param>
        /// <param name="name"></param>
        /// <param name="age"></param>
        /// <param name="role"></param>
        /// <param name="password"></param>
        /// <param name="address"></param>

        public void RegisterQuery(string email, string username, string name, int age, string role, string password, string address)
        {
            try
            {
                // Hashing the password before storing it
                string hashedPassword = Farmers.HashPassword(password);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    
                    conn.Open();

                    using (SqlTransaction transaction = conn.BeginTransaction())
                    {
                        // Generating a query to insert data into the database table
                        string query = "INSERT INTO Employee (Email, Username, Name, Age, Role, Password, Address)" +
                                       " VALUES (@Email, @Username, @Name, @Age, @Role, @Password, @Address)";

                        // Using the connection string to create the command and query
                        using (SqlCommand command = new SqlCommand(query, conn, transaction))
                        {
                            command.Parameters.AddWithValue("@Email", email);
                            command.Parameters.AddWithValue("@Username", username);
                            command.Parameters.AddWithValue("@Name", name);
                            command.Parameters.AddWithValue("@Age", age);
                            command.Parameters.AddWithValue("@Role", role);
                            command.Parameters.AddWithValue("@Password", hashedPassword); // Store hashed password
                            command.Parameters.AddWithValue("@Address", address);
                            command.ExecuteNonQuery();
                        }

                        // Inserting data into the User table
                        string userQuery = "INSERT INTO [User] (Username, Password, Role) VALUES (@Username, @Password, @Role)";
                        using (SqlCommand userCommand = new SqlCommand(userQuery, conn, transaction))
                        {
                            userCommand.Parameters.AddWithValue("@Username", username);
                            userCommand.Parameters.AddWithValue("@Password", hashedPassword); // Store hashed password
                            userCommand.Parameters.AddWithValue("@Role", role);
                            // Executing the connection
                            userCommand.ExecuteNonQuery();
                        }

                        // Committing the transaction
                        transaction.Commit();
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "An error occurred during registration: " + ex.Message;
            }
        }//_______________________________________________________________________________________________________________



        /// <summary>
        /// Button user selects to redirect to cancel the operation.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            EmailTxtBox.Text = "";
            UsernameTxtBox.Text = "";
            NameTxtBox.Text = "";
            DropDownListRole.SelectedIndex = -1;
            PasswordTxtBox.Text = "";
            ReEnterPasswordTxtBox.Text = "";

            //Using a startup script to redirect after 5 seconds
            ErrorMessageLabel.Text = "Operation being canceled...";
            string script = "setTimeout(function(){ window.location = 'Default.aspx'; }, 5000);";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//_____________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//____________________________________________________END OF FILE_______________________________________________________