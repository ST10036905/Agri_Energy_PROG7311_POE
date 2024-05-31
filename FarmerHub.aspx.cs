using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Xml.Linq;
//Mayra Selemane
//ST10036905
//Form that allows farmers to communicate.

namespace Agri_Energy_PROG7311_POE
{
    public partial class FarmerHub : System.Web.UI.Page
    {


        /// <summary>
        /// declaring and instantiating connection string.
        /// </summary>
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\AgriEaseData.mdf;Integrated Security=True";


        /// <summary>
        /// initializing data to the repeater only if the page is not being reloaded due to postback
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindComment();
            }
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Button to share the farmers idea.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ShareBtn_Click (object sender, EventArgs e)
        {
            string comment = IdeaTextBox.Text;

            if (string.IsNullOrEmpty(comment))
            {
                ErrorMessageLabel.Text = "Field is blank";
                return;
            }
            CommentQuery(comment);
        }//______________________________________________________________________________________________________________
        

        /// <summary>
        /// Query to insert comment to database.
        /// </summary>
        /// <param name="comment"></param>
        public void CommentQuery(string comment)
        {
            try
            {
                //Insertig data to database.
                string query = "INSERT INTO Comment(Text) VALUES (@Text)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Text", comment);
                    connection.Open();
                    command.ExecuteNonQuery();

                    // Register a startup script to redirect after 5 seconds
                    SuccessMessageLabel.Text = "Comment successfully entered.";
                    string script = "setTimeout(function(){ window.location = 'DiscussionBoard.aspx'; }, 1000);";
                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "An error occurred while adding comment: " + ex.Message;
            }
        }//____________________________________________________________________________________________________________
       

        /// <summary>
        /// Method that adds comment to repeater.
        /// </summary>
        public void BindComment()
        {
            try
            {
                //query to select all data from products
                string query = "SELECT * FROM Comment";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable data = new DataTable();
                    dataAdapter.Fill(data);
                    PostsRepeater.DataSource = data;
                    PostsRepeater.DataBind();
                }
            }
            catch (Exception ex)
            {
                ErrorMessageLabel.Text = "Data not captured. " + ex.Message;
            }
        }//______________________________________________________________________________________________________________

        protected void PostsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void IdeaTextBox_TextChanged(object sender, EventArgs e)
        {

        }


    }//_____________________________________________________________________________________________________________________________
}//_____________________________________________________END OF FILE_________________________________________________________________