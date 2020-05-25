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

# my undone assignments
 query {
    
      staff(phoneNumber: "0706519917" ){
        id
        lastName
        firstName
        undoneAssignments{
            id
            task{
              name
            }
          account{
            name
            number
            latitude
            longitude
            walkroute {
              name
            }
          }
        }
        undoneZoneAssignments{
          id
          desc
          task{
            name
            id
          }
          zone{
            name
            id
          }
        }
        undoneDmaAssignments{
          id
          desc
          task{
            id
            name
          }
          dma{
            id
            name
          }
        }
        totalAssignments
        totalUnDoneAssignments
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
# My  zone reports
  query($userId: String!) {
    myzonereports(userId: $userId) {
    id
    date
    stageName
  	zone{
      id
      name
    }
    furtherActionImage
    reportedBy
    zoneAssignment{
      stageName,
      staff{
        fullNames
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
query($userId: String!) {
    myPositions(email: $userId) {
      id
      name
      description
    }
  }

# building details

# connection info for zone/dma report
query($zoneReportId: String!) {
    zoneConnectionInfo(zoneReportId: $zoneReportId) {
    	id
    	buildingInfo{
        bedsitters
        oneBedrooms,
        singleRooms,
        threeBedrooms,
        twoBedrooms,
      },
    labelled,
    connectionNumber,
    accountStatus{
      name
    },
    buildingTypeCartegory{
      name
    }
    }
  }

  query($dmaReportId: String!) {
    dmaConnectionInfo(dmaReportId: $dmaReportId) {
    	id
    	buildingInfo{
        bedsitters
        oneBedrooms,
        singleRooms,
        threeBedrooms,
        twoBedrooms,
      },
    labelled,
    connectionNumber,
    accountStatus{
      name
    },
    buildingTypeCartegory{
      name
    }
    }
  }

# Anomaly for Zone/Dma Report
query($zoneReportId: String!) {
    zoneReportAnomaly(zoneReportId: $zoneReportId) {
    	id
    labelled,
    illegaluse{
      name
    },
    meterStandProblem{
      name
    }
    illegalUseImage,
    anomallyImage
    }
  }
# Anomaly for Zone/Dma Report
query($dmaReportId: String!) {
    dmaeportAnomaly(dmaReportId: $dmaReportId) {
    	id
    labelled,
    illegaluse{
      name
    },
    meterStandProblem{
      name
    }
    illegalUseImage,
    anomallyImage
    }
  }

#########################################################################
#####################   MUTATIONS  ######################################
#########################################################################

# Create Staff
mutation{
  registerStaff( 
  	 input: {
      firstName: "Black"
     lastName: "Jack"
      email: "black@jack.com"
      password: "1234567"
      phoneNumber: "0711430817" 
      positionId: "10771cff-8541-495d-803d-9f03d0d38fad"
    }
  ){
    staff{
      fullNames
      id
    }
  }
}

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

################################
## new staff
mutation{
  registerStaff( 
  	 input: {
      firstName: "Black"
     lastName: "Jack"
      email: "black@jack.com"
      password: "1234567"
      phoneNumber: "0711430817" 
      positionId: "10771cff-8541-495d-803d-9f03d0d38fad"
    }
  ){
    staff{
      fullNames
      id
      position{
        id
        name
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

# LIst Tenants
 query {
  tenants 
}
# ########################################
# create zone assignment
mutation{
  createZoneAssignment(
  input:{
   userId: "94ff3257-c8d1-4163-b03d-bfa677b61056",
    staffId: "363155a7-4ac7-4efd-b413-21065b68b9e3" ,
    desc: "Install meters",
    taskId:"a994a495-c1ea-4626-8939-631e920176da",
    zoneIds:["00f7c06d-a7ea-4c60-95fa-8bcae5aa863e", "faea5e5d-70aa-451e-bd53-e8f016fdb1dd"  ],
     numberOfAssignments: 2,
  }
  ){
    zoneAssignments{
      id
      desc
    }
  }
}
#  create DMa assignment
mutation{
  createDmaAssignment(
  input:{
   userId: "94ff3257-c8d1-4163-b03d-bfa677b61056",
    staffId: "363155a7-4ac7-4efd-b413-21065b68b9e3" ,
    desc: "Install meters",
    taskId:"a994a495-c1ea-4626-8939-631e920176da",
    dmaIds:["7d2b598b-30cf-41a4-925c-218030f17897", "10a34112-2da9-4f4a-af40-d8fd2bb47a61"] ,
     numberOfAssignments: 2,
  }
  ){
    dmaAssignments{
      id
      desc
    }
  }
}
# DMA REPORT CREATE
mutation{
  createDmaReport(
  input:{
   schemeId: "0a6f2a54-eaa3-4c20-babd-02a156befe90" ,
    bulkMeterId: "1496eeba-f7f1-4557-9d12-8543dfc7c5b2" ,
    dmaAssignmentId:"36aebf0b-6eb9-42c0-9dea-f289a6b215f9",
    section: "c",
    latitude: 0.1,
    longitude: 100000.2,
    accuracy: 4.3
    altitude: 3.2
  }
  ){
    dmaReport{
      id
    },
    success,
    errors
  }
}
# create report response
# {
#   "data": {
#     "createDmaReport": {
#       "dmaReport": {
#         "id": "3e4a4d42-9f63-4ae8-bafa-ac19c3b9cc66"
#       }
#     }
#   }
# }

# ZONE REPORT CREATE
mutation{
  createZoneReport(
  input:{
   schemeId: "0a6f2a54-eaa3-4c20-babd-02a156befe90" ,
    bulkMeterId: "1496eeba-f7f1-4557-9d12-8543dfc7c5b2" ,
    zoneAssignmentId:"06256302-0f87-4368-b324-ba84baa1f95d",
    latitude: 0.1,
    longitude: 100000.2,
    accuracy: 4.3
    altitude: 3.2
  }
  ){
    zoneReport{
      id
    },
    success,
    errors
  }
}
# RESPONSE
# {
#   "data": {
#     "createZoneReport": {
#       "zoneReport": {
#         "id": "694b6213-a1e3-482b-90ed-9e0914bbd33b"
#       },
#       "success": true,
#       "errors": []
#     }
#   }
# }
# create Account report
mutation{
  createAccountReport(
    input:{
    assignmentId: "15b51be2-0566-49c4-a5e1-c402d8717c35",
      latitude: 0.1,
    longitude: 100000.2,
    accuracy: 4.3
    altitude: 3.2
  }
  ){
    accountReport{
      id
    },
    success,
    errors
  }
}
# reposnse
{
  "data": {
    "createAccountReport": {
      "accountReport": {
        "id": "07da05ae-a4a5-40f3-bc74-7b8572ab54bf"
      }
    }
  }
}

# create meter info
mutation{
  createMeterInfo(
  input:{
   zoneReportId: "694b6213-a1e3-482b-90ed-9e0914bbd33b",
    dmaReportId: "",
    meterStatusId:"317d14eb-b276-473c-9468-5e7eb7ff27bd",
    meterSerial: "1233" ,
    meterAccessible: true,
    meterPresent: true ,
    meterStandLocation:"WITHIN PREMISES"
  }
  ){
    meterInfo{
      id
    },
    success,
    errors
  }
}
# response
{
  "data": {
    "createMeterInfo": {
      "meterInfo": {
        "id": "55dff87f-4860-4424-81c9-37521b6ecde2"
      },
      "success": true,
      "errors": []
    }
  }
}
# create Burst and lealage
mutation{
  createBurstAndLeaks(
  input:{
   zoneReportId: "",
    dmaReportId: "3e4a4d42-9f63-4ae8-bafa-ac19c3b9cc66" ,
    accountReportId: ""
    pipematerialId:"408dc1dd-fab1-4849-9335-d1a7cff9ecd3",
    pipesizeId: "0ef1e442-6407-4137-828d-846e6475b8c3"  ,
    surroundingArea: "true",
  	remarks: "true" ,
    
  }
  ){
    burstAndLealage{
      id
    },
    success,
    errors
  }
}
# response
{
  "data": {
    "createBurstAndLeaks": {
      "burstAndLealage": {
        "id": "6b139596-7abb-41a5-aad5-8c26a4e43625"
      },
      "success": true,
      "errors": []
    }
  }
}
# CREATE ANOMALLY
mutation{
  createAnomally(
  input:{
   zoneReportId: "",
    dmaReportId: "3e4a4d42-9f63-4ae8-bafa-ac19c3b9cc66"  ,
    accountReportId:"",
    meterStandProblemId:"03128863-ff8b-4c95-9780-f29f15efd97d",
    illegaluseId:  "382453c7-8cea-448a-aedb-af141d50be1c"  ,
    labelled: "true",
  	otherProblem: "none at all" ,
    otherIllegalUse: ""
    
  }
  ){
    anomally{
      id
    },
    success,
    errors
  }
}
# RESPONSE
{
  "data": {
    "createAnomally": {
      "anomally": {
        "id": "0728234d-ad8d-4baf-b2d6-e8508e4c12f8"
      },
      "success": true,
      "errors": []
    }
  }
}
# CREATE CONNECTION INFO
mutation{
  createConnectionInfo(
  input:{
   zoneReportId: "",
    dmaReportId: "3e4a4d42-9f63-4ae8-bafa-ac19c3b9cc66"  ,
    buildingTypeCartegoryId:"3fb9fbd4-6ea3-44c9-96db-7622298e84a0",
    labelled: true,
  	connectionNumber: "none at all",
    accountStatusId:"0672c88a-6c15-4f38-9001-2fb805b3b5d6"
    
  }
  ){
    connectionInfo{
      id
    },
    success,
    errors
  }
}
# response
{
  "data": {
    "createConnectionInfo": {
      "connectionInfo": {
        "id": "59c74ffa-212f-427d-a1be-38701584bd6e"
      },
      "success": true,
      "errors": []
    }
  }
}

# CREATE BUILDING INFO
mutation{
  createBuildingInfo(
  input:{
   connectionInfoId: "1d9b407c-fd35-4032-9950-31a3a83891cc",
    singleRooms: "1"  ,
    bedsitters:"7",
    oneBedrooms: "5",
  	 twoBedrooms: "2",
    threeBedrooms:"3",
    floorId: "5f765d5c-4434-4f73-a412-193674cb82f1" ,
  }
  ){
    buildingInfo{
      id
    },
    success,
    errors
  }
}
# RESPONSE
{
  "data": {
    "createBuildingInfo": {
      "buildingInfo": {
        "id": "e10a0cef-6814-4f44-8a4e-066bd0815bbb"
      },
      "success": true,
      "errors": []
    }
  }
}

# cerate Report Further Action
mutation{
  createReportFurtherAction(
  input:{
   zoneReportId: "",
    dmaReportId: "3e4a4d42-9f63-4ae8-bafa-ac19c3b9cc66" ,
    accountReportId: ""
    relocateMeter: true,
    raiseMeter: false,
    replaceMeter:true,
    disconnectionType: "int"
    remark: "test"
    actionTaken: false
    other: "none"
    
  }
  ){
    reportFurtherAction{
      id
    },
    success,
    errors
  }
}




# upload land mark image
  mutation($byteData: Upload!) {
     uploadLandmarkImage(
        input:{
          burstAndLealageId:"07622539-41ff-4f1f-8b7c-ace5bc6550ed"
          image: $byteData
        }
        ){
          id
        }
      }


# upload land mark image
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
# upload illegal use image

  mutation($byteData: Upload!) {
     uploadIllegalUseImage(
        input:{
          anomallyId:"07622539-41ff-4f1f-8b7c-ace5bc6550ed"
          image: $byteData
        }
        ){
          id
        }
      }
# upload Burst and leak image

  mutation($byteData: Upload!) {
     uploadBurstImage(
        input:{
          burstAndLealageId:"07622539-41ff-4f1f-8b7c-ace5bc6550ed"
          image: $byteData
        }
        ){
          id
        }
      }
# Upload Anomaly picture
 mutation($byteData: Upload!) {
     uploadAnomallyPicture(
        input:{
          anomallyId:"07622539-41ff-4f1f-8b7c-ace5bc6550ed"
          image: $byteData
        }
        ){
          id
        }
      }