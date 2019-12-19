# My assignments
query {   
  myassignments(
    userId:"dennorina@gmail.com" )
  {

   id
   stageName
   date
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
    stageName
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
    stageName
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
    furtherActionId: "6e7be5dc-4ff7-44b9-a5a1-4d129410f023",
    assignmentId: "302f12b7-56ed-4f2c-929d-be2809b0f1f2"  ,
    otherComment: "Testing this other",
    remarkId:"038d36fc-1cb0-4aeb-8bd9-607acb1a6e8e",
    otherRemark: "testing this other remark",
    meterSerial:"19040599",
    meterReading:"1234567", 
  }
  ){
    report{
      id
    }
    other
    otherRemark
    errors
    
  }
}
# SELECT ASSIGNMENT NOT IN REPORTS
Assignment.where("id NOT IN (SELECT  assignment_id FROM Reports)").fourth.id
mutation(
    $userId: String!
    $staffId: String!
    $taskId: String!
    $accountIds: [String!]!
  ) {
    createAssignment(
      input: {
        userId: $userId
        staffId: $staffId
        taskId: $taskId
        accountIds: $accountIds
      }
    ) {
      assignments {
        id
      }
    }
  }


  mutation($byteData: Upload!) {
     uploadImage(
        input:{
          reportId:"07622539-41ff-4f1f-8b7c-ace5bc6550ed"
          image: $byteData
        }
        ){
          id
        }
      }