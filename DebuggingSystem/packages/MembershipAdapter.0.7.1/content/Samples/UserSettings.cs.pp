using System.Collections.Specialized;
using MembershipAdapter;

namespace $rootnamespace$.Samples
{
    public class UserSettings : MembershipProviderSettings
    {
        public UserSettings(NameValueCollection config)
            : base(config)
        {
        }

        public override NameValueCollection Initialize(bool throwOnError = true)
        {
            var config = base.Initialize(throwOnError);
            this.Key = config["key"];
            return config;
        }

        public string Key { get; set; }
    }
}