using System;
using System.Collections.Specialized;
using MembershipAdapter;

namespace $rootnamespace$.Samples
{
    public class SampleRoleRepository : IRoleRepository
    {
        private readonly NameValueCollection config;

        public RoleProviderSettings Settings { get; private set; }

        public SampleRoleRepository(NameValueCollection config)
        {
            this.config = config;
            this.config.Add("key", "role value");
            this.Settings = new RoleSettings(config);
            this.Settings.Initialize(false);
        }

        public void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public string[] GetRolesForUser(string username)
        {
            throw new NotImplementedException();
        }

        public string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}