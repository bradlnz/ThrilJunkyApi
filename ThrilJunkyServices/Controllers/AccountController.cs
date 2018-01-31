using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace ThrilJunkyServices.Controllers
{
    public class AccountController : Controller
    {
        IConfiguration Configuration { get; }
        public AccountController(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public async Task<Result> Login([FromBody] UserModel model)
        {
            var nvc = new List<KeyValuePair<string, string>>();
            nvc.Add(new KeyValuePair<string, string>("grant_type", "password"));
            nvc.Add(new KeyValuePair<string, string>("username", model.Username));
            nvc.Add(new KeyValuePair<string, string>("password", model.Password));
            nvc.Add(new KeyValuePair<string, string>("client_id", "resourceOwner"));
            nvc.Add(new KeyValuePair<string, string>("client_secret", "secret"));
            nvc.Add(new KeyValuePair<string, string>("scope", "api1"));

            using (var client = new HttpClient())
            {
                var req = new HttpRequestMessage(HttpMethod.Post, $"http://{Configuration["Auth:Domain"]}/connect/token");

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

                var res = await client.PostAsync($"http://{Configuration["Auth:Domain"]}/api/account/register", content);

                var result = await res.Content.ReadAsStringAsync();

                return JsonConvert.DeserializeObject<RegResult>(result);

            }
        }

        public class UserModel
        {
            public string Username { get; set; }
            public string Password { get; set; }
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
            }
            public class Error
            {
                public string code { get; set; }
                public string description { get; set; }
            }
        }
    }
