using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
//Mayra Selemane
//ST10036905
//Class to store farmers data, used in farmers form(to add farmer).

namespace Agri_Energy_PROG7311_POE
{
    public class Farmers
    {
            /// <summary>
            /// Getters and setters methods.
            /// </summary>
            public string Name { get; set; }
            public string Surname { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
            public string Contact { get; set; }
            public string Email { get; set; }
            public string Address { get; set; }

            //setting farmer role to default
            public string Role = "Farmer";


            /// <summary>
            /// Default constructor.
            /// </summary>
            public Farmers() { }


            /// <summary>
            /// Parameterised constructor.
            /// </summary>
            /// <param name="name"></param>
            /// <param name="surname"></param>
            /// <param name="username"></param>
            /// <param name="password"></param>
            /// <param name="contact"></param>
            /// <param name="email"></param>
            /// <param name="address"></param>
            /// <param name="role"></param>
            public Farmers(string name, string surname, string username, string password, string contact, string email, string address, string role)
            {
                Name = name;
                Surname = surname;
                Username = username;
                Password = password;
                Contact = contact;
                Email = email;
                Address = address;
                Role = role;
            }//_________________________________________________________________________________________________________________


            /// <summary>
            /// Parameterised constructor.
            /// </summary>
            /// <param name="username"></param>
            /// <param name="password"></param>
            /// <param name="role"></param>
            public Farmers(string username, string password, string role)
            {
                Username = username;
                Password = password;
                Role = role;
            }//_________________________________________________________________________________________________________________


            /// <summary>
            /// Method converting password hash.
            /// </summary>
            /// <param name="password"></param>
            public void SetPassword(string password)
            {
                Password = HashPassword(password);
            }//_________________________________________________________________________________________________________________


            /// <summary>
            /// Method hashing password.
            /// </summary>
            /// <param name="password"></param>
            /// <returns></returns>
            public static string HashPassword(string password)
            {
                using (SHA256 sha256 = SHA256.Create())
                {
                    byte[] hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                    return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
                }
            }//_________________________________________________________________________________________________________________


            /// <summary>
            /// Method that verifies hashed password.
            /// </summary>
            /// <param name="inputPassword"></param>
            /// <returns></returns>
            public bool VerifyPassword(string inputPassword)
            {
                return Password.Equals(HashPassword(inputPassword));
            }//_________________________________________________________________________________________________________________


    }//_________________________________________________________________________________________________________________
}//________________________________________________END OF FILE__________________________________________________________