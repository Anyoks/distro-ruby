      mutation(
        $email: String!
        $password: String!
        $firstName: String!
        $lastName: String!
      ) {
        registerUser(
          input: {
            firstName: $firstName
            lastName: $lastName
            email: $email
            password: $password
          }
        ) {
          user {
            id
            firstName
            lastName
            authenticationToken
          }
        }
      }
    `,this.http.post(this.getServerPath()+this.options.registerAccountPath,t)}deleteAccount(){return this.http.delete(this.getServerPath()+this.options.deleteAccountPath)}signIn(t){console.log("IN SIGN IN"),this.userType=null==t.userType?null:this.getUserTypeByName(t.userType);const n={[this.options.loginField]:t.login,password:t.password};lP.a`
      mutation($email: String!, $password: String!) {
        signIn(input: { email: $email, password: $password }) {
          user {
            firstName
            lastName
            authenticationToken
            id
          }
        }
      }