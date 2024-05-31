using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Form that allows user to enroll to a specific educational resource offered at Agri-Energy.

namespace Agri_Energy_PROG7311_POE
{
    public partial class Enroll : System.Web.UI.Page
    {
        /// <summary>
        /// declaring and instantiating object from users class.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        Users userData = new Users();


        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";

       
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        /// <summary>
        /// method that holds button used to register user in educational resources.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            //Checking if any of the required fields are empty
            if (string.IsNullOrEmpty(ParticipantNameTxtBox.Text) ||
                string.IsNullOrEmpty(RoleDropDownList.SelectedValue) ||
                string.IsNullOrEmpty(ContactTxtBox.Text) ||
                string.IsNullOrEmpty(InformationTxtBox.Text))
            {
                ErrorMessageLabel.Text = "Please fill in all the fields.";
                return;
            }

            //filling in the text boxes with form values.
            userData.Name = ParticipantNameTxtBox.Text;
            userData.Role = RoleDropDownList.SelectedValue;
            userData.AdditionalData = InformationTxtBox.Text;
            userData.Contact = ContactTxtBox.Text;

           //calling method to store data in database.
            EnrollQuery(userData.Name, userData.Role, userData.Contact, userData.AdditionalData);
        }//________________________________________________________________________________________________________________________


        /// <summary>
        /// method that saves enrollment details to database. 
        /// </summary>
        /// <param name="name"></param>
        /// <param name="age"></param>
        /// <param name="startDate"></param>
        /// <param name="duration"></param>
        /// <param name="contact"></param>
        /// <param name="additionalData"></param>
        public void EnrollQuery(string name,string role,string additionalData,string contact)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //Inserting data to enrollment table.
                    string query = "INSERT INTO Enroll (Name, Role,Information,Contact) VALUES (@Name,@Role,@Information,@Contact)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Name", name);
                        command.Parameters.AddWithValue("@Role", role);
                        command.Parameters.AddWithValue("@Information", additionalData);
                        command.Parameters.AddWithValue("@Contact", contact);
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();

                        // Using a startup script to redirect after 5 seconds
                        SuccessMessageLabel.Text = "User registration succesful. An e-mail will be sent soon. Please proceed to payment";
                        string script = "setTimeout(function(){ window.location = 'Transactions.aspx'; }, 5000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "An error occurred while saving enrollment details: " + ex.Message;
            }
        }//________________________________________________________________________________________________________________________


        /// <summary>
        /// method that cancels registration operation.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            ParticipantNameTxtBox.Text = "";
            RoleDropDownList.SelectedIndex = -1;
            ContactTxtBox.Text = "";
            InformationTxtBox.Text = "";

            // Using a startup script to redirect after 2 seconds
            ErrorMessageLabel.Text = "Operation canceled...Redirecting";
            string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 2000);";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//_________________________________________________________________________________________________________________________

       
    }//_____________________________________________________________________________________________________________________________
}//_____________________________________________________END OF FILE_________________________________________________________________
