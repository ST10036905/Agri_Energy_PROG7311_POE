using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Educational form that consists of the courses and training available.

namespace Agri_Energy_PROG7311_POE
{
    public partial class EducationalResources : System.Web.UI.Page
    {
        /// <summary>
        /// declaring data fields to store educational form data.
        /// </summary>
        public class EducationalResource
        {
            public int ID { get; set; }
            public string ImagePath { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
            public string Price { get;set; }
        }//________________________________________________________________________________________________________________________

        /// <summary>
        /// Method that receives the image of available courses and binds them.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<EducationalResource> resources = new List<EducationalResource>
                {
                    new EducationalResource
                    {
                        ID = 1,
                        ImagePath = "https://media.istockphoto.com/id/1365693929/photo/shot-of-a-young-woman-using-a-digital-tablet-while-inspecting-crops-on-a-farm.jpg?s=612x612&w=0&k=20&c=k8vmv91sLcR7ipcNQbefXtwlCCUVHVJXwo5H0AaWeC4=",
                        Title = "Sustainable Farming Workshop",
                        Description = "Learn the basics of sustainable farming in this interactive workshop.",
                        Price = "R 8000"
                    },
                    new EducationalResource
                    {
                        ID = 2,
                        ImagePath = "https://thumbs.dreamstime.com/b/green-energy-park-solar-panels-wind-turbines-53413706.jpg",
                        Title = "Green Energy Webinar",
                        Description = "Discover various green energy solutions for your farm in our webinar.",
                        Price = "R 6000"
                    },
                    new EducationalResource
                    {
                        ID = 3,
                        ImagePath = "https://agrierp.com/blog/wp-content/uploads/2023/05/The-Benefits-of-Crop-Management-Software-for-Farmers-copy-scaled.jpg",
                        Title = "Online Course on Advanced Crop Management",
                        Description = "Advanced techniques and strategies for effective crop management.",
                        Price = "R12 000"
                    },
                    new EducationalResource
                    {
                        ID = 4,
                        ImagePath = "https://www.shutterstock.com/image-photo/irrigation-system-works-field-sprinkles-600nw-2187912435.jpg",
                        Title = "Online course in irrigation systems",
                        Description = "Comprehensive guide to modern irrigation systems.",
                        Price = "R 4000"
                    },
                    new EducationalResource
                    {
                        ID = 5,
                        ImagePath = "https://ceac.arizona.edu/sites/default/files/styles/az_full_width_bg_extra_small/public/Intensive%20Workshop%20web%20image.jpg?itok=HT7lMJHD",
                        Title = "Precision Agriculture Workshop",
                        Description = "Implementing precision agriculture for an optimized farming.",
                        Price = "R 8000"
                    },
                    new EducationalResource
                    {
                        ID = 6,
                        ImagePath = "https://www.nicheagriculture.com/wp-content/uploads/2020/10/Untitled-1-1024x683-_1_-1.webp",
                        Title = "Mechanized Farming Techniques",
                        Description = "Learn about modern mechanized farming techniques.",
                        Price = "R 18 000"
                    },
                    new EducationalResource
                    {
                        ID = 7,
                        ImagePath = "https://secure.caes.uga.edu/news/multimedia/images/7129/iStock-1307039908-(1).jpg",
                        Title = "Online course in soil Health and Fertility Management",
                        Description = "Strategies for maintaining soil health and fertility.",
                        Price = "R 5000"
                    },
                    new EducationalResource
                    {
                        ID = 8,
                        ImagePath = "https://happyharvestfarms.com/blog/wp-content/uploads/2023/11/Organic-Farming-2.jpg",
                        Title = "Organic Farming Practices",
                        Description = "Principles and practices of organic farming.",
                        Price = "R 18 000"
                    },
                    new EducationalResource
                    {
                        ID = 9,
                        ImagePath = "https://manuelbarreirocastaneda.com/wp-content/uploads/2023/09/urban.jp_.jpeg",
                        Title = "Urban Farming Workshop",
                        Description = "Learn about urban farming and its benefits.",
                        Price = "R 10 000"
                    },
                    new EducationalResource
                    {
                        ID = 10,
                        ImagePath = "https://vertical.mt/wp-content/uploads/elementor/thumbs/Vertical-farms-urban-agriculture-qiz08mf1z6u9on9e1hq04pnoahedx47frcpl4d6lk8.jpg",
                        Title = "Vertical Farming Techniques",
                        Description = "Explore the techniques of vertical farming for space-efficient cultivation.",
                        Price = "R 12 500"
                    }
                };
                //binding images to the repeater.
                CoursesRepeater.DataSource = resources;
                CoursesRepeater.DataBind();
            }
        }//________________________________________________________________________________________________________________________


        /// <summary>
        /// Method to allow user to enroll on the specific courses offered.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void EnrollBtn_Click(object sender, EventArgs e)
        {
            //sending the enroll button as an event.
            Button enrollButton = (Button)sender;

            //converting corse if to be sent.
            int courseId = Convert.ToInt32(enrollButton.CommandArgument);

            // Redirecting user to enrollment form and storing the course Id.
            Response.Redirect($"Enroll.aspx?CourseID={courseId}");
        }//________________________________________________________________________________________________________________________

   
    }//_____________________________________________________________________________________________________________________________
}//_____________________________________________________END OF FILE_________________________________________________________________
