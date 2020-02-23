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
# My subdepartment
query($userId: String!){
	mySubdepartment(email: $userId){
    name
    id
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

  # positions
  query{
  positions{
    id
    name
    description
    subdepartments{
      id
      name
    }
    staffs{
      id
      firstName 
      lastName
    }
  }
}
# my positions
query{
  myPositions(email: "dennorina@gmail.com"){
    
    name
    id
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

###############################################
###  CREATE/ UPDATE DEPARTMENTS

mutation{
  createDepartment(input:
  	{
      name: "tes1t",
			description: "test1"    
    }
  ){
    department{
      name
      id
    }
  }
}

mutation{
  updateDepartment(input:
  	{
      name: "Incredible",
			description: "testing accordingly" ,
      id: "c26802a7-2e02-4ee0-8d0b-4592cd216e48"
    }
  ){
    department{
      name
      description
      id
    }
  }
}

###############################################
###  CREATE/ UPDATE SUBDEPARTMENTS
mutation{
  createSubdepartment(input:
  	{
      name: "tes1t",
      description: "test1"  
       departmentId: "052df7ea-6645-4128-bc7a-75591fc477f1"  
        positionIds:[]
    }
  ){
    department{
      name
      id
    }
  }
}
##udpate
mutation{
  updateSubdepartment(input:
  	{
      name: "billing & customer relations",
			description: "Make sure we have cash" ,
      id: "bf356691-274f-4167-ac51-fa65488ed723",
      departmentId: "10968d0b-508d-41f7-b78d-eb38d7f3536e"
      positionIds:["e9334ed6-0841-4b65-be73-17ab3b651011" ]
    }
  ){
    subdepartment{
      name
      id
      description
      positions{
        name
        id
      }
    }
  }
}
#####################################
#CREATE UPDATE POSITIONS
# CREATE
mutation{
  createPosition(input:
  	{
      name: "Test",
			description: "Test very well" ,
      subdepartmentIds: ["bf356691-274f-4167-ac51-fa65488ed723"]
    }
  ){
    position{
      name
      description
    }
  }
}
# UPDATE
mutation{
  updatePosition(input:
  	{
      id: "69c29cb1-bd1d-4514-9c7f-fcc1c309689e",
      name: "Tested",
			description: "Went very well" ,
      subdepartmentIds: ["bf356691-274f-4167-ac51-fa65488ed723"]
    }
  ){
    position{
      id
      name
      description
    }
  }
}

# #####################################
##CREATE UPDATE TASKS
# CREATE
mutation{
  createTask(input:
  	{
      name: "test",
			description: "test" 
      subdepartmentIds:["3962ee69-eadd-4ebf-b7b1-f82b6bf6f714"]
    }
  ){
    task{
      name
      id
      subdepartments{
        name
        id
      }
    }
  }
}
# UPDATE
mutation{
  updateTask(input:
  	{
      id: "cb934cdb-41ec-4edd-a25f-cc5e0a03b40a",
      name: "testing",
			description: "tested very well too!" 
      subdepartmentIds:["3962ee69-eadd-4ebf-b7b1-f82b6bf6f714","c0255136-9405-4eb9-8e61-47caafd56ff1"]
    }
  ){
    task{
      name
      id
      subdepartments{
        name
        id
      }
    }
  }
}
# ####################################################
### UPDATE STAFF POSITION
mutation{
  updateStaffPosition(input:
  	{
      staffId: "067e7f3b-1af1-4c63-ab51-739a9d3b0361",
      positionId: "94dbf492-f4a4-4d52-a40c-e9464da9b265" ,
    }
  ){
    staff{
      firstName
      lastName
      id
      position{
        name
        id
      }
      
    }
  }
}
#  CREATE POSITION

 mutation(
    $name: String!,
    $description: String!,
    $subdepartmentIds: [String!]!,
    $staffIds: [String!]!
  ){
  createPosition(
    input:
  	{
      name: $name,
      description: $description,
      subdepartmentIds:$subdepartmentIds,
      staffIds: $staffIds,
    }
  ){
    position{
      name
      id
      description
      subdepartments {
        id
        name
      }
      staffs {
        id
        firstName
        lastName
      }
    }
  }
}


# LIST STAFF
query{
  staffs{
    lastName
    firstName
    id
    position{
      name
      id
    }
  }
}
# ########################################