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

# All Further Actions
query{
  furtheractions{
    name
    id
  }
}
# All remarks
query{
  remarks{
    name
    id
  }
}

# All Account status types 
# faulty, discounnect, active
query{
  accountstatus{
    name
    id
  }
}

# All Building Types
query{
  buildingtypes{
    name
    id
  }
}
## accounts paginated

 query($first: Int!, $after: String! ) {
    
      accountsConnection(first: $first, after: $after) {
        pageInfo {
          endCursor
          startCursor
          hasPreviousPage
          hasNextPage
        }
        edges{
          node{
            id
            name
            meterSerial
            number
            oldAccountNumber
            walkroute {
              subzone {
                zone {
                  name
                }
              }
            }
          }
        }
    }
  }

  # ### Accounts by zone.

  query($zoneId: String!) {
    zoneaccounts(zoneId: "e9e23e75-d0c0-4a49-8e33-baaec55cdd3a"){
      id
      name
      meterSerial
      number
      oldAccountNumber
      walkroute {
        subzone {
          zone {
            name
          }
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
    assignmentId: "4caa579a-4f5a-4ec3-9764-19c78f9ce74e"  ,
    otherComment: "Testing this other",
    remarkId:"038d36fc-1cb0-4aeb-8bd9-607acb1a6e8e",
    otherRemark: "testing this other remark",
    meterSerial:"19040599",
    meterReading:"1234567",
    buildingTypeCartegoryId: "5f4d956d-c0c5-476a-9189-437001de5b33",
    accountStatusId: "9a5842ef-3676-403c-9b94-4b8f45554039",
    buildingDetail: "Bed sitter"
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