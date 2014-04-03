using System.Collections.Specialized;
using MembershipAdapter;

namespace $rootnamespace$.Samples
{
    public class RoleSettings : RoleProviderSettings
    {
        public RoleSettings(NameValueCollection config)
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