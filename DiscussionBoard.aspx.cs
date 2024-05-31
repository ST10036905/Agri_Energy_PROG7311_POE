using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
//Mayra Selemane
//ST10036905
//Form that allows stakeholders to discuss.

namespace Agri_Energy_PROG7311_POE
{
    public partial class DiscussionBoard : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                BindComment();
            }
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// method to bind comment to the repeater.
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


        /// <summary>
        /// Button to post comment in discussion board.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PostBtn_Click(object sender, EventArgs e)
        {
           string comment = CommentTxtBox.Text;

            if (string.IsNullOrEmpty(comment))
            {
                ErrorMessageLabel.Text = "Field is blank";
                return;
            }

            PostQuery(comment);
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// button to cancel operation.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            TopicTxtBox.Text = "";
            CategoryDropDown.SelectedIndex = -1;
            CommentTxtBox.Text = "";

            // Using a startup script to redirect after 2 seconds
            ErrorMessageLabel.Text = "Operation canceled...Redirecting";
            string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 2000);";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// method that inserts the data to database.
        /// </summary>
        /// <param name="comment"></param>
        public void PostQuery(string comment)
        {
            try
            {
                //Inserting data to comments table.
                string query = "INSERT INTO Comment(Text) VALUES (@Text)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Text", comment);

                    connection.Open();

                    command.ExecuteNonQuery();

                    SuccessMessageLabel.Text = "Comment successfully entered.";

                    // Register a startup script to redirect after 5 seconds
                    string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 2000);";
                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
            }
            catch (Exception ex)
            {
                // Log the exception and display an error message
                ErrorMessageLabel.Text = "An error occurred while adding comment: " + ex.Message;
            }
        }//_________________________________________________________________________________________________________________________


    }//_____________________________________________________________________________________________________________________________
}//_____________________________________________________END OF FILE_________________________________________________________________