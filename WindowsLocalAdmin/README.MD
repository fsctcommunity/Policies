# Windows Local Admin Policies

## Use Case

This is a folder of policies to help understand Windows Local Admin and who has admin rights and doesn't.

The following policies are included:

### Local Admin Permission Audit

This policy runs a script to check what AD accounts have local admin access and marks devices as non-compliant or compliant based on the accounts. Import the policy and the ApprovedLocalAdmins.vbs

### Logged on User Admin Check

This policy checks to see if the user logged in, is a member of the local admin group in Windows. Import the policy and the LocalAdminsLoggedOn.vbs.

### Recent Admin Group Additions

This policy checks to see if changes are made to a Local Security Group within Windows. Import the policy and the LocalSecurityGroupAddition.vbs.

## Needed for the policy

The XML included in this policy set imports a new folder called "Windows Local Admin Audit." Each policy relies on an associated script imported into Forescout. 
The scripts are:

- ApprovedLocalAdmins.vbs
  - This needs to be edited to include Admins that are authorized.
- LocalAdminLoggedOn.vbs
  - Tracks if the user logged in is a memeber of the Local Admin Group
- RecentSecurityGroupAddition.vbs
  - Tracks to see if there are changes to a specific Security Group
  - Needs to be edited to validate the correct group
