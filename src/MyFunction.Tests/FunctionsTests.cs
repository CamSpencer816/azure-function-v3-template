using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Xunit;

namespace MyFunction.Tests
{
    public class FunctionsTests
    {
        private readonly ILogger logger = TestFactory.CreateLogger();

        [Fact]
        public async void MyHttpTriggerFunction_Should_Return_SuccessMessage_When_NameIsProvided()
        {
            var name = "Bill";
            var request = TestFactory.CreateHttpRequest("name", name);
            var response = (OkObjectResult)await MyHttpTriggerFunction.Run(request, logger);
            Assert.Equal($"Hello, {name}. This HTTP triggered function executed successfully.", response.Value);
        }

        [Fact]
        public async void MyHttpTriggerFunction_Should_Return_DefaultMessage_When_NameIsEmpty()
        {
            var name = "";
            var request = TestFactory.CreateHttpRequest("name", name);
            var response = (OkObjectResult)await MyHttpTriggerFunction.Run(request, logger);
            Assert.Equal("This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.", response.Value);
        }

        [Theory]
        [MemberData(nameof(TestFactory.Data), MemberType = typeof(TestFactory))]
        public async void MyHttpTriggerFunction_Should_Return_SuccessMessage_From_MemberData(string queryStringKey, string queryStringValue)
        {
            var request = TestFactory.CreateHttpRequest(queryStringKey, queryStringValue);
            var response = (OkObjectResult)await MyHttpTriggerFunction.Run(request, logger);
            Assert.Equal($"Hello, {queryStringValue}. This HTTP triggered function executed successfully.", response.Value);
        }
    }
}
