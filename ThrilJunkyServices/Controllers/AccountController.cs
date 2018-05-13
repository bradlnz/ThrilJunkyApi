using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using IdentityModel.Client;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using SendGrid;
using SendGrid.Helpers.Mail;
using ThrilJunkyServices.Models;
using ThrilJunkyServices.Repositories;

namespace ThrilJunkyServices.Controllers
{
    public class AccountController : Controller
    {
        IConfiguration Configuration { get; }
        IUserRepository UserRepository { get; set; }

      
        public AccountController(IConfiguration configuration, IUserRepository _UserRepository)
        {
            Configuration = configuration;
            UserRepository = _UserRepository;
        }


        public async Task<Result> Login([FromBody] UserModel model)
        {
            var nvc = new List<KeyValuePair<string, string>>();
            nvc.Add(new KeyValuePair<string, string>("grant_type", string.IsNullOrWhiteSpace(model.refresh_token) ? "password" : "refresh_token"));
            nvc.Add(new KeyValuePair<string, string>("client_id", "resourceOwner"));
            nvc.Add(new KeyValuePair<string, string>("client_secret", "secret"));

            if (string.IsNullOrWhiteSpace(model.refresh_token))
            {
                nvc.Add(new KeyValuePair<string, string>("username", model.Username));
                nvc.Add(new KeyValuePair<string, string>("password", model.Password));
            
                nvc.Add(new KeyValuePair<string, string>("scope", "openid profile api1 offline_access"));
            } else 
            {
                nvc.Add(new KeyValuePair<string, string>("refresh_token", model.refresh_token));
            }

            using (var client = new HttpClient())
            {
                var req = new HttpRequestMessage(HttpMethod.Post, $"{Configuration["Auth:Domain"]}/connect/token");

                req.Content = new FormUrlEncodedContent(nvc);

                var res = await client.SendAsync(req);

                var result = await res.Content.ReadAsStringAsync();

                return JsonConvert.DeserializeObject<Result>(result);

            }
        }



        public async Task<RegResult> Register([FromBody] UserRegisterModel model)
        {
            var newreg = new UserRegisterModel
            {
                Username = model.Username,
                Password = model.Password,
                Email = model.Email
            };

            using (var client = new HttpClient())
            {
                var data = JsonConvert.SerializeObject(newreg);
                var content = new StringContent(data, Encoding.UTF8, "application/json");

                var res = await client.PostAsync($"{Configuration["Auth:Domain"]}/api/account/register", content);

                var result = await res.Content.ReadAsStringAsync();

                var regresult = JsonConvert.DeserializeObject<RegResult>(result);

                try {
                    
                    var user = UserRepository.GetItem(newreg.Username);

                    user.MediaId = 329;

                    UserRepository.Modify(user);

  
                } catch(Exception Ex){
                    
                }
              
                return regresult;
            }
        }


        public async Task<User> GetUser([FromBody]Token data)
        {
 

            using (var client = new HttpClient())
            {
                client.SetBearerToken(data.token);

                var userInfoClient = new UserInfoClient($"{Configuration["Auth:Domain"]}/connect/userinfo");

                var response = await userInfoClient.GetAsync(data.token);
       
                var userDetails  = JsonConvert.DeserializeObject<UserGen>(response.Json.ToString());

                using (var client2 = new HttpClient())
                {
                    var req = new HttpRequestMessage(HttpMethod.Post, $"{Configuration["Auth:Domain"]}/api/account/getuserbysub");


                    req.Content = new StringContent(JsonConvert.SerializeObject(userDetails), Encoding.UTF8, "application/json");

                    var res = await client.SendAsync(req);

                    var result = await res.Content.ReadAsStringAsync();

                    return JsonConvert.DeserializeObject<User>(result);
                }
            }
        }



        [HttpGet]
        public async Task ForgottenPassword(string email)
        {

            if (!string.IsNullOrWhiteSpace(email))
            {
                Random generator = new Random();

                String r = generator.Next(0, 999999).ToString("D6");

                //Send random 6 digit code
                // Message
                var msg = new SendGridMessage();
                msg.Subject = "Reset Password";

                msg.From = new EmailAddress("support@thriljunky.com");

                msg.PlainTextContent = $"Your reset code is: {r}";
                msg.AddTo(email);

                // Send
                var client = new SendGridClient(Configuration["Auth:SendGridApiKey"]);

                var response = await client.SendEmailAsync(msg);

          
                try
                {

                    var user = UserRepository.GetAll().FirstOrDefault(a => a.Email == email);

                    user.ResetCode = r;

                    UserRepository.Modify(user);


                }
                catch (Exception Ex)
                {

                }
            }
        }

        [HttpGet]
        public async Task<string> ResetPassword(string resetCode, string password)
        {
            var user = await UserRepository.FindByResetCode(resetCode);

            if(user != null){

                using (var client = new HttpClient())
                {
            
                    var res = await client.GetAsync($"{Configuration["Auth:Domain"]}/api/account/reset?email=" + user.Email + "&password="+ password);

                    var result = await res.Content.ReadAsStringAsync();

                    return "success";
         
                }
               
            }

            return "fail";
            //User inserts number 

            //password reset token generated

            //if user != null

        
            //Else
        }

       



        public class Token
        {
            public string token { get; set; }
        }
        public class UserModel
        {
            public string Username { get; set; }
            public string Password { get; set; }
            public string refresh_token { get; set; }
        }

        public class UserGen
        {
            public string sub { get; set; }
            public string name { get; set; }
            public string given_name { get; set; }
            public string fmily_name { get; set; }
            public string[] roles { get; set; }
         }

        public class UserRegisterModel : UserModel
        {
            public string Email { get; set; }
        }

        public class RegResult
        {
            public bool succeeded { get; set; }
            public List<Error> errors { get; set; }

        } 
        public class Result
            {
                public string access_token { get; set; }
                public string refresh_token { get; set; }
            }
            public class Error
            {
                public string code { get; set; }
                public string description { get; set; }
            }
        }
    }
