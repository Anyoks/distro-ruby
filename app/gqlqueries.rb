# My assignments
query {   
  myassignments(
    userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" )
  {

   id
   stageName
   account{
     number
     name
   }
   staff{
     firstName
     lastName
   }
   task{
     name
   }
   report{
     comments
   }

  
 }
}

query($userId: String!) {
    myassignments(userId: $userId) {
      id
      stageName
      account {
        number
        name
      }
      staff {
        firstName
        lastName
      }
      task {
        name
      }
      report {
        comments
      }
    }
  }

# my tasks (from my department)
query {   
  mytasks(
    userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" )
  {
	 
      id
      name
      staffs {
        id
        firstName
        lastName
      }
  
   
 }
}
# another way to query
query($userId: String!) {
    mytasks(userId: $userId ) {
      name
      myTotalAssignments(userId: $userId)
    }
  }

# get tototal stats for user
 query {
    stages {
      name
      myTotalAssignments(userId: "9676bf1e-acce-4b97-a0cf-3028df2e76f0")
    }
  }

#   get total assignments by task type
query {   
  tasks
    
  {
	 name
   myTotalAssignments(userId:"9676bf1e-acce-4b97-a0cf-3028df2e76f0" ) 
 }
}

# My report
query($userId: String!) {
    myreports(userId: $userId) {
    id
    comments
    completed
    furtherAction{
      name
      other{
        name
      }
    }
    
    }
  }
# All reports
query {
  	reports {
    id
    comments
    completed
    furtherAction{
      name
      other{
        name
      }
    }
    
    }
  }

#########################################################################
#####################   MUTATIONS  ######################################
#########################################################################

# create report
mutation{
  createReport(
  input:{
    completed:true,
    comments:"no isses",
    furtherActionId: "06723a70-c4d8-4fbc-97e8-cb368c1267f3",
    assignmentId: "00ab8a26-d26c-4a4d-bbd6-d7bd437e1b56" ,
    otherComment: ""
  }
  ){
    report{
      id
    }
  }
}