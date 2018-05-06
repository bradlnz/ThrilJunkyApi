
using Newtonsoft.Json;
using RestSharp;
using RestSharp.Authenticators;

namespace Coconut
{
	public class CoconutAPI
	{
		RestClient Cli;
	
		/// <summary>
		/// Create an CoconutClient instance
		/// </summary>
		/// <param name="APIKey"></param>
		/// <example>
		/// CoconutClient Coconut = new CoconutClient("k-myapikey");
		/// </example>
		public CoconutAPI (string APIKey)
		{
			Cli = new RestClient("https://api.coconut.co");
			Cli.Authenticator = new HttpBasicAuthenticator(APIKey, "");
			Cli.AddDefaultHeader("Accept", "application/json");
			Cli.UserAgent = "Coconut/2.0.0 (dotnet)";
		}


		/// Create a Job
		/// </summary>
		/// <param name="Data">A string representing the config content</param>
		/// <returns>CoconutJob instance</returns>
		public CoconutJob Submit(string Data)
		{
            return JsonConvert.DeserializeObject<CoconutJob>(Request("v1/job", Method.POST, Data));
		}

		private string Request(string path, Method method, string Data) {
			var request = new RestRequest(path, method);
			request.AddParameter("text/plain", Data, ParameterType.RequestBody);

            IRestResponse response = Cli.Execute(request);

            var code = response.StatusCode.ToString();

			if(code == "Created" || code == "OK" || code == "No Content")
			{
				return response.Content;
			}
			else
			{
                string ErrorMessage = JsonConvert.DeserializeObject<CoconutError> (response.Content).Message;
				throw new CoconutException(ErrorMessage);
			}

		}
	}
}