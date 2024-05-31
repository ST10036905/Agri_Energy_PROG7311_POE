using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Project funding form to display the available projects that can be funded or collaborated.

namespace Agri_Energy_PROG7311_POE
{
    public partial class ProjectFunding : System.Web.UI.Page
    {
        /// <summary>
        /// declaring data fields to store project form data.
        /// </summary>
        public class ProjectFundings
        {
            public int ID { get; set; }
            public string ImagePath { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
            public string FundingNeeded { get; set; }
        }//________________________________________________________________________________________________________________________


        /// <summary>
        /// Method that loads the project opportunities and binds them.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<ProjectFundings> projects = new List<ProjectFundings>
                {
                    new ProjectFundings
                    {
                        ID = 1,
                        ImagePath = "https://i0.wp.com/solarquarter.com/wp-content/uploads/2022/10/1-6.png?fit=1200%2C675&quality=80&ssl=1",
                        Title = "Solar Powered Irrigation System",
                        Description = "A project to install solar powered irrigation systems in rural farms across Western Cape.",
                        FundingNeeded = "R 200,000"
                    },
                    new ProjectFundings
                    {
                        ID = 2,
                        ImagePath = "https://static.scientificamerican.com/sciam/cache/file/0E1B6E8A-E54C-424C-AA6D9EE54EB8BFF4_source.png?w=1200",
                        Title = "Wind Energy for Remote Areas in Gauteng",
                        Description = "Implementing wind energy solutions for off-grid farms",
                        FundingNeeded = "R 250,000"
                    },
                    new ProjectFundings
                    {
                        ID = 3,
                        ImagePath = "https://qph.cf2.quoracdn.net/main-qimg-8812487e703c4f504293ce00d08bea2b-lq",
                        Title = "Organic Farm Expansion",
                        Description = "Expanding organic farming practices in local communities around all districts.",
                        FundingNeeded = "R 150,000"
                    },
                    new ProjectFundings
                    {
                        ID = 4,
                        ImagePath = "https://globalfoodsafetyresource.com/wp-content/uploads/2023/09/edit-6-shutterstock-2290096783.jpg",
                        Title = "Comprehensive Farm Audits",
                        Description = "Energy audit grants, efficiency improvement funding, and renewable energy programs.",
                        FundingNeeded = "R 150,000"
                    }
                };

                // Binding projects to the repeater.
                ProjectsRepeater.DataSource = projects;
                ProjectsRepeater.DataBind();
            }
        }//________________________________________________________________________________________________________________________


        /// <summary>
        /// Method to allow user to fund the specific projects offered.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void FundBtn_Click(object sender, EventArgs e)
        {
            // Redirecting user to funding form and storing the project ID.
            Response.Redirect("Transactions.aspx");
        }//________________________________________________________________________________________________________________________


        /// <summary>
        /// Method to allow user to join the specific projects offered.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void JoinBtn_Click(object sender, EventArgs e)
        {
            // Redirecting user to join form and storing the project ID.
            Response.Redirect("JoinProject.aspx");
        }//________________________________________________________________________________________________________________________


        protected void ProjectsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }


    }//_____________________________________________________________________________________________________________________________
}//_____________________________________________________END OF FILE_________________________________________________________________
