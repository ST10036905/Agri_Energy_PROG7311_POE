using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
//Mayra Selemane
//ST10036905
//Form that user makes payment.

namespace Agri_Energy_PROG7311_POE
{
    public partial class Transactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        /// <summary>
        /// Method to validate payment details.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ConfirmPayment_Click(object sender, EventArgs e)
        {
            bool isValid = true;

            // Validating card CVV
            if (string.IsNullOrWhiteSpace(Cvv.Text) || Cvv.Text.Length != 3 || !int.TryParse(Cvv.Text, out _))
            {
                ErrorMessageLabel.Text = "Invalid CVV.";
                isValid = false; 
            }

            // Validating card number
            if (string.IsNullOrWhiteSpace(CardNumber.Text) || CardNumber.Text.Length != 16 || !long.TryParse(CardNumber.Text, out _))
            {
                ErrorMessageLabel.Text = "Invalid card number.";
                isValid = false; 
            }

            // Validating expiry date
            if (string.IsNullOrWhiteSpace(ExpiryDate.Text) || !ValidateExpiryDate(ExpiryDate.Text))
            {
                ErrorMessageLabel.Text = "Expired card.";
                isValid = false;
            }

            // If both CVV and card number are valid, display payment successful message
            if (isValid)
            {
                SuccessMessageLabel.Text = "Payment successful! Redirecting....";

                // Register a startup script to redirect after 5 seconds
                string script = "setTimeout(function(){ window.location = 'Dashboard.aspx'; }, 5000);";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method to validate expiry date.
        /// </summary>
        /// <param name="expiryDate"></param>
        /// <returns></returns>
        private bool ValidateExpiryDate(string expiryDate)
        {
            if (DateTime.TryParse(expiryDate, out DateTime parsedDate))
            {
                // Ensure the expiry date is greater than today's date
                return parsedDate > DateTime.Today;
            }
            return false;
        }//______________________________________________________________________________________________________________


        /// <summary>
        /// Method to cancel payment. 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AbortPayment_Click(object sender, EventArgs e)
        {
            CardholderName.Text = "";
            ExpiryDate.Text = "";
            CardNumber.Text = "";
            Cvv.Text = "";
            Response.Redirect("Dashboard.aspx");
        }//____________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//____________________________________________________END OF FILE_______________________________________________________