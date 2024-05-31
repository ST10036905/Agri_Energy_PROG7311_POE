using System;
using System.Data.SqlClient;
using System.Web.UI;
//Mayra Selemane
//ST10036905
//Login is a form being used for Agri-energy stakeholders to login,either farmers or employees.

namespace Agri_Energy_PROG7311_POE
{
    public partial class Login : System.Web.UI.Page
    {
        /// <summary>
        /// Declaring and instantiating an object from the users class
        /// </summary>
        Users userData = new Users();


        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";


        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                // Checking if username or password is empty
                if (string.IsNullOrEmpty(UsernameTxtBox.Text) || string.IsNullOrEmpty(PasswordTxtBox.Text))
                {
                    ErrorMessageLabel.Text = "Please enter username and password.";
                    return;
                }

                //filling the text boxes with form data
                userData.Username = UsernameTxtBox.Text;
                userData.Password = PasswordTxtBox.Text;
                var userDetail = ValidateLogin(userData.Username, userData.Password);

                //validating based on role who is to user in order to redirect them to right form.
                if (userDetail != null)
                {
                    if (userDetail.Value.Role == "Farmer")
                    {
                        Session["FarmerId"] = userDetail.Value.UserId;

                        // Using a startup script to redirect after 5 seconds
                        SucessMessageLabel.Text = "Login succesful...Redirecting farmer";
                        string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 5000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);

                    }
                    else if (userDetail.Value.Role == "Employee")
                    {
                        Session["EmployeeId"] = userDetail.Value.UserId;

                        // Using a startup script to redirect after 5 seconds
                        SucessMessageLabel.Text = "Welcome back :) Redirecting.......";
                        string script = "setTimeout(function(){ window.location = 'EmployeeDashboard.aspx'; }, 5000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                        
                    }
                }
                else
                {
                    ErrorMessageLabel.Text = "Invalid username or password";
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "Error: " + ex.Message;
            }
        }//_________________________________________________________________________________________________________________


        /// <summary>
        /// Method used to validate login credentials using a query
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public (string UserId, string Role)? ValidateLogin(string username, string password)
        {
            (string UserId, string Role)? userDetail = null;

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = @"
                        SELECT EmployeeId AS UserId, 'Employee' AS Role, Password 
                        FROM Employee 
                        WHERE Username = @Username
                        UNION ALL 
                        SELECT FarmerId AS UserId, 'Farmer' AS Role, Password 
                        FROM Farmer 
                        WHERE Username = @Username";

                    using (SqlCommand cmd = new SqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                string storedHashedPassword = reader["Password"].ToString();
                                string hashedPassword = Farmers.HashPassword(password);

                                if (hashedPassword == storedHashedPassword)
                                {
                                    userDetail = (reader["UserId"].ToString(), reader["Role"].ToString());
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "An error occurred: " + ex.Message;
            }
            return userDetail;
        }//_________________________________________________________________________________________________________________


        /// <summary>
        /// Method to cancel login operation.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            UsernameTxtBox.Text = "";
            PasswordTxtBox.Text = "";

            //Using a startup script to redirect after 5 seconds
            ErrorMessageLabel.Text = "Operation being canceled...Loading";
            string script = "setTimeout(function(){ window.location = 'Default.aspx'; }, 3000);";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//_________________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//____________________________________________________END OF FILE_______________________________________________________