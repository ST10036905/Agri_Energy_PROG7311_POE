using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
//Mayra Selemane
//ST10036905
//Class to store data fields for users, used in registration and enrollment forms. 

namespace Agri_Energy_PROG7311_POE
{
    public class Users
    {
        /// <summary>
        /// declaring getters and setters for user.
        /// </summary>
        public string Email { get; set; }
        public string Username { get; set; }
        public string Name { get; set; }
        public string Age { get; set; }
        public string Role { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public string Contact { get; set; }
        public string AdditionalData { get; set; }


        /// <summary>
        /// default constructor
        /// </summary>
        public Users()
        {

        }//_________________________________________________________________________________________________________________

        /// <summary>
        /// parameterised constructor for registration form. 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="username"></param>
        /// <param name="name"></param>
        /// <param name="age"></param>
        /// <param name="role"></param>
        /// <param name="password"></param>
        /// <param name="address"></param>
        public Users(string email, string username, string name, string age, string role, string password, string address)
        {
            Email = email;
            Username = username;
            Name = name;
            Age = age;
            Role = role;
            Password = password;
            Address = address;
        }//_____________________________________________________________________________________________________________


        /// <summary>
        /// parameterised constructor to be used in enrollment for education form.
        /// </summary>
        /// <param name="name"></param>
        /// <param name="role"></param>
        /// <param name="startDate"></param>
        /// <param name="duration"></param>
        /// <param name="additionalData"></param>
        /// <param name="contact"></param>
        public Users(string name,string role,string additionalData,string contact)
        {
            Name = name;
            Role = role;
            AdditionalData = additionalData;
            Contact = contact;
        }//_____________________________________________________________________________________________________________


        /// <summary>
        /// parameterised constructor for login form
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        public Users(string username, string password)
        {
            this.Username = username;
            SetPassword(password);
        }//_____________________________________________________________________________________________________________


        /// <summary>
        /// setting the hashed password.
        /// </summary>
        /// <param name="password"></param>
        public void SetPassword(string password)
        {
            this.Password = HashPassword(password);
        }//_____________________________________________________________________________________________________________


        /// <summary>
        /// method that hashes password.
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        public string HashPassword(string password)
        {
 
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }//_____________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//________________________________________________END OF FILE__________________________________________________________